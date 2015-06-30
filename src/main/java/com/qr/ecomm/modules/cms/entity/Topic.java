/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.entity;

import java.util.Date;
import java.util.List;

import com.google.common.collect.Lists;
import com.qr.ecomm.common.persistence.longid.LDataEntity;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2015年5月6日      vmp         Create
 * ****************************************************************************
 * </pre>
 * @author vmp
 * @since 1.0
 */
public class Topic extends LDataEntity<Topic>{
	private Long topicChnlId;
	private String topicTitle;
	private String topicImg;
	private String description;
	private String tags;
	private String keywords;
	private Long sort;
	private Integer status;
	
	private List<TopicInnerChnl> topicInnerChnlList = Lists.newArrayList();
	
	private String topicChnlName;
	private Integer contentNum;
	private Date beginDate;
	private Date endDate;
	public Long getTopicChnlId() {
		return topicChnlId;
	}
	public void setTopicChnlId(Long topicChnlId) {
		this.topicChnlId = topicChnlId;
	}
	public String getTopicTitle() {
		return topicTitle;
	}
	public void setTopicTitle(String topicTitle) {
		this.topicTitle = topicTitle;
	}
	public String getTopicImg() {
		return topicImg;
	}
	public void setTopicImg(String topicImg) {
		this.topicImg = topicImg;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public Long getSort() {
		return sort;
	}
	public void setSort(Long sort) {
		this.sort = sort;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getTopicChnlName() {
		return topicChnlName;
	}
	public void setTopicChnlName(String topicChnlName) {
		this.topicChnlName = topicChnlName;
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
	public Integer getContentNum() {
		return contentNum;
	}
	public void setContentNum(Integer contentNum) {
		this.contentNum = contentNum;
	}
	public List<TopicInnerChnl> getTopicInnerChnlList() {
		return topicInnerChnlList;
	}
	public void setTopicInnerChnlList(List<TopicInnerChnl> topicInnerChnlList) {
		this.topicInnerChnlList = topicInnerChnlList;
	}



	public static final int STATUS_ADD = 1;
	public static final int STATUS_NOT_AUDIT = 2;
	
}
