/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.entity;

import java.util.Date;

import com.klht.common.persistence.longid.LDataEntity;

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
public class Exhibition  extends LDataEntity<Exhibition>{
	private Long channelId;
	private String title;
	private Date startDate;
	private Date endDate;
	private String exhibitionImg;
	private String pavilionName;
	private String provinceId;
	private String cityId;
	private String countryId;
	private String address;
	private String description;
	private String hostCompany;
	private String official;
	private String holdCompany;
	private String contact;
	private String contactPhone;
	private String officePhone;
	private String mailbox;
	private String fax;
	private String qq;
	private String contactAddress;
	private Integer status;
	private Integer type;
	private Date releaseDate;
	
	private String exhibitionTxt;
	private String channelPathName;
	
	private String cityName;
	private String countryName;
	private Integer dateStatus;
	
	private Date beginDate;
//	private Date endDate;
	

	public Long getChannelId() {
		return channelId;
	}
	public void setChannelId(Long channelId) {
		this.channelId = channelId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getExhibitionImg() {
		return exhibitionImg;
	}
	public void setExhibitionImg(String exhibitionImg) {
		this.exhibitionImg = exhibitionImg;
	}
	
	public String getPavilionName() {
		return pavilionName;
	}
	public void setPavilionName(String pavilionName) {
		this.pavilionName = pavilionName;
	}
	public String getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}
	public String getCityId() {
		return cityId;
	}
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getHostCompany() {
		return hostCompany;
	}
	public void setHostCompany(String hostCompany) {
		this.hostCompany = hostCompany;
	}
	public String getOfficial() {
		return official;
	}
	public void setOfficial(String official) {
		this.official = official;
	}
	public String getHoldCompany() {
		return holdCompany;
	}
	public void setHoldCompany(String holdCompany) {
		this.holdCompany = holdCompany;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	public String getOfficePhone() {
		return officePhone;
	}
	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}
	public String getMailbox() {
		return mailbox;
	}
	public void setMailbox(String mailbox) {
		this.mailbox = mailbox;
	}
	
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getContactAddress() {
		return contactAddress;
	}
	public void setContactAddress(String contactAddress) {
		this.contactAddress = contactAddress;
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
	public String getExhibitionTxt() {
		return exhibitionTxt;
	}
	public void setExhibitionTxt(String exhibitionTxt) {
		this.exhibitionTxt = exhibitionTxt;
	}
	public String getChannelPathName() {
		return channelPathName;
	}
	public void setChannelPathName(String channelPathName) {
		this.channelPathName = channelPathName;
	}
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	
	
	public String getCountryId() {
		return countryId;
	}
	public void setCountryId(String countryId) {
		this.countryId = countryId;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public Integer getDateStatus() {
		Date date = new Date();
		if(this.getStartDate().getTime() > date.getTime())
			dateStatus = 1;
		else if(this.getEndDate().getTime() < date.getTime())
			dateStatus = 2;
		else
			dateStatus = 0;
		return dateStatus;
	}
	public void setDateStatus(Integer dateStatus) {
		this.dateStatus = dateStatus;
	}



	public static final int STATUS_ADD = 1;
	public static final int STATUS_NOT_AUDIT = 2;
	
	public static final int TYPE_MAN = 0;
	public static final int TYPE_SPIDER = 1;
	
}
