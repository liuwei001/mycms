/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.dao;

import java.util.List;
import java.util.Map;

import com.qr.ecomm.common.persistence.annotation.LongMyBatisDao;
import com.qr.ecomm.common.persistence.longid.LCrudDao;
import com.qr.ecomm.modules.cms.entity.Content;
import com.qr.ecomm.modules.cms.entity.ContentTxt;
import com.qr.ecomm.modules.cms.entity.Tag;
import com.qr.ecomm.modules.cms.entity.Topic;
import com.qr.ecomm.modules.cms.entity.TopicContent;
import com.qr.ecomm.modules.cms.entity.TopicInnerChnl;
import com.qr.ecomm.modules.cms.vo.TreeVO;

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
