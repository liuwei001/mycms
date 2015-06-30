/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;
import com.qr.ecomm.common.persistence.Page;
import com.qr.ecomm.common.service.CrudService;
import com.qr.ecomm.common.service.LCrudService;
import com.qr.ecomm.common.utils.StringUtils;
import com.qr.ecomm.modules.cms.dao.ClassifyDao;
import com.qr.ecomm.modules.cms.dao.ContentDao;
import com.qr.ecomm.modules.cms.entity.Classify;
import com.qr.ecomm.modules.cms.entity.Content;
import com.qr.ecomm.modules.cms.entity.ContentTxt;
import com.qr.ecomm.modules.cms.entity.Tag;
import com.qr.ecomm.modules.cms.vo.ContentViewVO;
import com.qr.ecomm.modules.cms.vo.ImportNewsVO;
import com.qr.ecomm.modules.cms.vo.TreeVO;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2015年4月29日      xc         Create
 * ****************************************************************************
 * </pre>
 * @author xc
 * @since 1.0
 */
@Service
@Transactional(readOnly = true)
public class ContentService extends LCrudService<ContentDao, Content>{
	@Autowired
	private ClassifyDao classifyDao;
	@Transactional(readOnly = false)
	public void saveOrUpdate(Content content) {
		if (content.getContentTxt()!=null){
			content.setContentTxt(StringEscapeUtils.unescapeHtml4(
					content.getContentTxt()));
		}
		if (content.getId() == null) {
			content.preInsert();
			dao.insert(content);
			ContentTxt txt = new ContentTxt();
			txt.setContentId(content.getId());
			txt.setContentTxt(content.getContentTxt());
			dao.insertContentTxt(txt);
		} else {
			content.preUpdate();
			dao.update(content);
			ContentTxt txt = new ContentTxt();
			txt.setContentId(content.getId());
			txt.setContentTxt(content.getContentTxt());
			dao.updateContentTxt(txt);
		}
		contentTag(content);
	}
	@Transactional(readOnly = false)
	private void contentTag(Content content){
		String tagNames = content.getTags();
		if(StringUtils.isEmpty(tagNames)){
			dao.deleteContentTag(content.getId());
		}else{
			String[] tagNameList = tagNames.split(" ");
			List<Long> tagIds = new ArrayList<Long>();
			if(tagNameList != null)
				for (String tagName : tagNameList) {
					if(StringUtils.isEmpty(tagName)) continue;
					Tag tag = dao.selectTag(tagName);
					if(tag == null){
						tag = new Tag();
						tag.setTagName(tagName);
						dao.insertTag(tag);
					}
					tagIds.add(tag.getId());
				}
			if(tagIds != null && tagIds.size()>0){
				dao.deleteContentTag(content.getId());
				Map map = new HashMap();
				map.put("contentId", content.getId());
				map.put("tagIds", tagIds);
				dao.insertContentTag(map);
			}
		}
	}
	public void updateStatus(Map map){
		dao.updateStatus(map);
	}
	public List findChannelList(){
		return classifyDao.findClassifyList(Classify.TYPE_CONTENT);
	}
	public String findChannelPathName(Long channelId){
		String pathName = "";
		while(channelId != null){
			TreeVO vo = classifyDao.findClassify(channelId);
			if(vo == null) break;
			pathName = vo.getName() + " -- " + pathName;
			channelId = vo.getParentId();
		}
		if(StringUtils.isNotEmpty(pathName))
			pathName = pathName.substring(0, pathName.lastIndexOf(" -- "));
		return pathName;
	}
	public ContentTxt findContentTxt(Long contentId){
		return dao.selectContentTxt(contentId);
	}
	public TreeVO findChannel(Long channelId){
		return classifyDao.findClassify(channelId);
	}
	public Page<Content> findAuditPage(Page<Content> page, Content content) {
		content.setPage(page);
		page.setList(dao.findAuditList(content));
		return page;
	}
	
	public List<ImportNewsVO> selectImportNews(Map map){
		return dao.selectImportNews(map);
	}
	public List<ContentViewVO> selectNewsViews(){
		return dao.selectNewsViews();
	}
}
