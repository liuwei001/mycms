/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.klht.common.persistence.DataEntity;
import com.klht.common.persistence.longid.LDataEntity;
import com.klht.modules.sys.entity.Area;

/**
 * 标书管理Entity
 * @author xc
 * @version 2015-05-11
 */
public class Bid extends LDataEntity<Bid> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private String unit;		// 单位
	private String origin;		// 来源
	private String contact;		// 联系人
	private String contactPhone;		// 联系电话
	private String areaId;		// 地区
	private Long tradeId;		// 行业
	private Integer status;		// status
	private Date releaseDate;		// 发布日期
	private Integer type;		// type
	private String description;		// 描述
	private Date startDate;
	private Date endDate;
	
	private String bidTxt;
	
	private String areaName;
	
	private Date beginDate;
	
	public Bid() {
		super();
	}

	public Bid(Long id){
		super(id);
	}

	@Length(min=1, max=100, message="标题长度必须介于 1 和 100 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=1, max=100, message="单位长度必须介于 1 和 100 之间")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	@Length(min=0, max=400, message="来源长度必须介于 0 和 400 之间")
	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}
	
	@Length(min=0, max=20, message="联系人长度必须介于 0 和 20 之间")
	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
	
	@Length(min=0, max=20, message="联系电话长度必须介于 0 和 20 之间")
	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	
	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public Long getTradeId() {
		return tradeId;
	}

	public void setTradeId(Long tradeId) {
		this.tradeId = tradeId;
	}
	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
	@Length(min=0, max=300, message="描述长度必须介于 0 和 300 之间")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBidTxt() {
		return bidTxt;
	}

	public void setBidTxt(String bidTxt) {
		this.bidTxt = bidTxt;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
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
	

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}


	public static final int STATUS_ADD = 1;
	public static final int STATUS_NOT_AUDIT = 2;
	
}