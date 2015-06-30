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
 *  1    2015年5月8日      xc         Create
 * ****************************************************************************
 * </pre>
 * @author xc
 * @since 1.0
 */
public class Advert extends LDataEntity<Advert>{
	private String adName;
	private Long adPlaceId;
	private String adContent;
	private String adUrl;
	private Date adStartTm;
	private Date adEndTm;
	private Integer adValidPeriod;
	private String adDesc;
	private Integer status;
	private Integer type;
	private Long adTypeId;
	private String vipName;
	private Long placePixelX;
	private Long placePixelY;
	private Long sort;
	
	private String adTypeName; 
	private String adPlaceName;
	private Date beginDate;
	private Date endDate;
	public String getAdName() {
		return adName;
	}
	public void setAdName(String adName) {
		this.adName = adName;
	}
	public Long getAdPlaceId() {
		return adPlaceId;
	}
	public void setAdPlaceId(Long adPlaceId) {
		this.adPlaceId = adPlaceId;
	}
	public String getAdContent() {
		return adContent;
	}
	public void setAdContent(String adContent) {
		this.adContent = adContent;
	}
	public String getAdUrl() {
		return adUrl;
	}
	public void setAdUrl(String adUrl) {
		this.adUrl = adUrl;
	}
	public Date getAdStartTm() {
		return adStartTm;
	}
	public void setAdStartTm(Date adStartTm) {
		this.adStartTm = adStartTm;
	}
	public Date getAdEndTm() {
		return adEndTm;
	}
	public void setAdEndTm(Date adEndTm) {
		this.adEndTm = adEndTm;
	}
	public String getAdDesc() {
		return adDesc;
	}
	public void setAdDesc(String adDesc) {
		this.adDesc = adDesc;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Long getAdTypeId() {
		return adTypeId;
	}
	public void setAdTypeId(Long adTypeId) {
		this.adTypeId = adTypeId;
	}
	public String getAdTypeName() {
		return adTypeName;
	}
	public void setAdTypeName(String adTypeName) {
		this.adTypeName = adTypeName;
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
	public String getVipName() {
		return vipName;
	}
	public void setVipName(String vipName) {
		this.vipName = vipName;
	}
	public Integer getAdValidPeriod() {
		return adValidPeriod;
	}
	public void setAdValidPeriod(Integer adValidPeriod) {
		this.adValidPeriod = adValidPeriod;
	}
	public String getAdPlaceName() {
		return adPlaceName;
	}
	public void setAdPlaceName(String adPlaceName) {
		this.adPlaceName = adPlaceName;
	}
	public Long getPlacePixelX() {
		return placePixelX;
	}
	public void setPlacePixelX(Long placePixelX) {
		this.placePixelX = placePixelX;
	}
	public Long getPlacePixelY() {
		return placePixelY;
	}
	public void setPlacePixelY(Long placePixelY) {
		this.placePixelY = placePixelY;
	}
	public Long getSort() {
		return sort;
	}
	public void setSort(Long sort) {
		this.sort = sort;
	}


	public static final int STATUS_ADD = 1;
	public static final int STATUS_NOT_AUDIT = 2;
}
