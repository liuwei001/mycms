/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.dao;

import java.util.List;
import java.util.Map;

import com.klht.common.persistence.annotation.LongMyBatisDao;
import com.klht.common.persistence.longid.LCrudDao;
import com.klht.modules.cms.entity.Content;
import com.klht.modules.cms.entity.ContentTxt;
import com.klht.modules.cms.entity.Tag;
import com.klht.modules.cms.entity.Topic;
import com.klht.modules.cms.entity.TopicContent;
import com.klht.modules.cms.entity.TopicInnerChnl;
import com.klht.modules.cms.vo.TreeVO;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2015年4月29日     xc         Create
 * ****************************************************************************
 * </pre>
 * @author xc
 * @since 1.0
 */
@LongMyBatisDao
public interface TopicDao extends LCrudDao<Topic>{
	public void updateStatus(Map  map);
	
//	public List findTopicChnlList();
	
	public List<TopicInnerChnl> selectTopicInnerChnl(Long topicId);
	public void insertTopicInnerChnl(TopicInnerChnl topicInnerChnl);
	public void updateTopicInnerChnl(TopicInnerChnl topicInnerChnl);
	
	public List selectTopicContentList(TopicContent topicContent);
	public TopicContent selectTopicContent(Map map);
	public void insertTopicContent(Map map);
	public void deleteTopicContent(Map map);
	public void updateTopicContent(Map map);
	
	public List selectContent(TopicContent topicContent);
	
	public List<Topic> findAuditList(Topic topic);
}
