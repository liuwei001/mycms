/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.entity;

import java.util.Date;

import com.qr.ecomm.common.persistence.longid.LDataEntity;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2015年5月5日      xc         Create
 * ****************************************************************************
 * </pre>
 * @author xc
 * @since 1.0
 */
public class Content  extends LDataEntity<Content>{
	private Long channelId;
	private Long extChnlId;
	private String title;
	private String author;
	private String origin;
	private String originUrl;
	private String description;
	private Date releaseDate;
	private String titleImg;
	private Integer status;
	private String tags;
	private String keywords;
	private Integer type;
	private String shortTitle;
	private Integer isRecommand = 0;
	
	private String contentTxt;
	private String channelPathName;
	
	private Date beginDate;
	private Date endDate;
	public Long getChannelId() {
		return channelId;
	}
	public void setChannelId(Long channelId) {
		this.channelId = channelId;
	}
	public Long getExtChnlId() {
		return extChnlId;
	}
	public void setExtChnlId(Long extChnlId) {
		this.extChnlId = extChnlId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getOriginUrl() {
		return originUrl;
	}
	public void setOriginUrl(String originUrl) {
		this.originUrl = originUrl;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getTitleImg() {
		return titleImg;
	}
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
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
	public String getContentTxt() {
		return contentTxt;
	}
	public void setContentTxt(String contentTxt) {
		this.contentTxt = contentTxt;
	}
	public String getChannelPathName() {
		return channelPathName;
	}
	public void setChannelPathName(String channelPathName) {
		this.channelPathName = channelPathName;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
	
	
	public String getShortTitle() {
		return shortTitle;
	}
	public void setShortTitle(String shortTitle) {
		this.shortTitle = shortTitle;
	}
	public Integer getIsRecommand() {
		return isRecommand;
	}
	public void setIsRecommand(Integer isRecommand) {
		this.isRecommand = isRecommand;
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


	public static final int STATUS_ADD = 1;
	public static final int STATUS_NOT_AUDIT = 2;
	
	public static final int TYPE_MAN = 0;
	public static final int TYPE_SPIDER = 1;
	
}
