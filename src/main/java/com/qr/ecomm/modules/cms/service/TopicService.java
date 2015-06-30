/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;
import com.qr.ecomm.common.persistence.Page;
import com.qr.ecomm.common.service.LCrudService;
import com.qr.ecomm.common.utils.StringUtils;
import com.qr.ecomm.modules.cms.dao.ClassifyDao;
import com.qr.ecomm.modules.cms.dao.TopicDao;
import com.qr.ecomm.modules.cms.entity.Classify;
import com.qr.ecomm.modules.cms.entity.Content;
import com.qr.ecomm.modules.cms.entity.Topic;
import com.qr.ecomm.modules.cms.entity.TopicContent;
import com.qr.ecomm.modules.cms.entity.TopicInnerChnl;

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
public class TopicService extends LCrudService<TopicDao, Topic>{
	@Autowired
	private ClassifyDao classifyDao;
	@Autowired
	private ContentService contentService;
	@Transactional(readOnly = false)
	public void saveOrUpdate(Topic topic) {
		if (topic.getDescription()!=null){
			topic.setDescription(StringEscapeUtils.unescapeHtml4(
					topic.getDescription()));
		}
		if (topic.getId() == null) {
			topic.preInsert();
			dao.insert(topic);
		} else {
			topic.preUpdate();
			dao.update(topic);
		}
		List<TopicInnerChnl> lists = topic.getTopicInnerChnlList();
		if(lists != null && lists.size() > 0){
			for (TopicInnerChnl topicInnerChnl : lists) {
				if(topicInnerChnl == null) continue;
				if(StringUtils.isEmpty(topicInnerChnl.getName())) continue;
				if(topicInnerChnl.getId() == null){
					topicInnerChnl.setTopicId(topic.getId());
					topicInnerChnl.preInsert();dao.insertTopicInnerChnl(topicInnerChnl);
				}else{
					dao.updateTopicInnerChnl(topicInnerChnl);
				}
			}
		}
		
	}
	public List<TopicInnerChnl> selectTopicInnerChnl(Long topicId){
		return dao.selectTopicInnerChnl(topicId);
	}
	@Transactional(readOnly = false)
	public void updateStatus(Map map){
		dao.updateStatus(map);
	}
	public List findTopicChnlList(){
		return classifyDao.findClassifyList(Classify.TYPE_TOPIC);
	}
	public Page<TopicContent> findTopicContentPage(Page<TopicContent> page, TopicContent topicContent) {
		topicContent.setPage(page);
		page.setList(dao.selectTopicContentList(topicContent));
		return page;
	}
	public Page<TopicContent> findContentPage(Page<TopicContent> page, TopicContent topicContent) {
		topicContent.setPage(page);
		page.setList(dao.selectContent(topicContent));
		return page;
	}
	public List selectTopicContent(TopicContent topicContentVO ){
		return dao.selectTopicContentList(topicContentVO);
	}
	public TopicContent selectTopicContent(Map map){
		return dao.selectTopicContent(map);
	}
	public void insertTopicContent(Map map){
		TopicContent topicContent = dao.selectTopicContent(map);
		if(topicContent == null)
			dao.insertTopicContent(map);
	}
	@Transactional(readOnly = false)
	public void deleteTopicContent(Map map){
		dao.deleteTopicContent(map);
	}
	@Transactional(readOnly = false)
	public void saveOrUpdateContent(Content content,Long topicId,Long topicInnerChnlId){
		if(content.getId() == null){
			contentService.saveOrUpdate(content);
			Map map = Maps.newHashMap();
			map.put("topicId", topicId);
			map.put("topicInnerChnlId", topicInnerChnlId);
			map.put("contentId", content.getId());
			dao.insertTopicContent(map);
		}else{
			contentService.saveOrUpdate(content);
			Map map = Maps.newHashMap();
			map.put("topicId", topicId);
			map.put("topicInnerChnlId", topicInnerChnlId);
			map.put("contentId", content.getId());
			dao.updateTopicContent(map);
		}
	}
	public Page<Topic> findAuditPage(Page<Topic> page, Topic topic) {
		topic.setPage(page);
		page.setList(dao.findAuditList(topic));
		return page;
	}
}
