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
import com.qr.ecomm.modules.cms.dao.ExhibitionDao;
import com.qr.ecomm.modules.cms.entity.Classify;
import com.qr.ecomm.modules.cms.entity.Content;
import com.qr.ecomm.modules.cms.entity.ContentTxt;
import com.qr.ecomm.modules.cms.entity.Exhibition;
import com.qr.ecomm.modules.cms.entity.Tag;
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
public class ExhibitionService extends LCrudService<ExhibitionDao, Exhibition>{
	@Autowired
	private ClassifyDao classifyDao;
	@Transactional(readOnly = false)
	public void saveOrUpdate(Exhibition exhibition) {
		if (exhibition.getExhibitionTxt()!=null){
			exhibition.setExhibitionTxt(StringEscapeUtils.unescapeHtml4(
					exhibition.getExhibitionTxt()));
		}
		if (exhibition.getId() == null) {
			exhibition.preInsert();
			dao.insert(exhibition);
			Map map =Maps.newHashMap();
			map.put("exhibitionId", exhibition.getId());
			map.put("exhibitionTxt", exhibition.getExhibitionTxt());
			dao.insertExhibitionTxt(map);
		} else {
			exhibition.preUpdate();
			dao.update(exhibition);
			Map map =Maps.newHashMap();
			map.put("exhibitionId", exhibition.getId());
			map.put("exhibitionTxt", exhibition.getExhibitionTxt());
			dao.updateExhibitionTxt(map);
		}
	}
	public void updateStatus(Map map){
		dao.updateStatus(map);
	}
	public List findChannelList(){
		return classifyDao.findClassifyList(Classify.TYPE_EXHIBITION);
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
	public String findExhibitionTxt(Long exhibitionId){
		return dao.selectExhibitionTxt(exhibitionId);
	}
	public TreeVO findChannel(Long channelId){
		return classifyDao.findClassify(channelId);
	}
	
	public Page<Exhibition> findAuditPage(Page<Exhibition> page, Exhibition exhibition) {
		exhibition.setPage(page);
		page.setList(dao.findAuditList(exhibition));
		return page;
	}
}
