/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.entity;

import java.util.Date;

import com.qr.ecomm.common.persistence.longid.LBaseEntity;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2015年5月7日      vmp         Create
 * ****************************************************************************
 * </pre>
 * @author vmp
 * @since 1.0
 */
public class TopicContent extends LBaseEntity<TopicContent>{
	private Long topicId;
	private Long contentId;
	private String contentTitle;
	private Long topicInnerChnlId;
	private String topicInnerChnlName;
	private Date createDate;
	private Long channelId;
	private Integer status;
	private String author;
	
	private Date beginDate;
	private Date endDate;
	public Long getTopicId() {
		return topicId;
	}
	public void setTopicId(Long topicId) {
		this.topicId = topicId;
	}
	public Long getContentId() {
		return contentId;
	}
	public void setContentId(Long contentId) {
		this.contentId = contentId;
	}
	public String getContentTitle() {
		return contentTitle;
	}
	public void setContentTitle(String contentTitle) {
		this.contentTitle = contentTitle;
	}
	public Long getTopicInnerChnlId() {
		return topicInnerChnlId;
	}
	public void setTopicInnerChnlId(Long topicInnerChnlId) {
		this.topicInnerChnlId = topicInnerChnlId;
	}
	public String getTopicInnerChnlName() {
		return topicInnerChnlName;
	}
	public void setTopicInnerChnlName(String topicInnerChnlName) {
		this.topicInnerChnlName = topicInnerChnlName;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public Long getChannelId() {
		return channelId;
	}
	public void setChannelId(Long channelId) {
		this.channelId = channelId;
	}
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	@Override
	public void preInsert() {
	}
	@Override
	public void preUpdate() {
	}
	
}
