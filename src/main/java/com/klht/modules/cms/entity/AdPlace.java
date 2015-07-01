/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.entity;

import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

import com.klht.common.persistence.DataEntity;
import com.klht.common.persistence.longid.LDataEntity;

/**
 * 广告位管理Entity
 * @author xc
 * @version 2015-05-08
 */
public class AdPlace extends LDataEntity<AdPlace> {
	
	private static final long serialVersionUID = 1L;
	private String placeName;		// 广告位名称
	private String placeDesc;		// 广告位描述
	private String placeDemoImg;		// 广告位摆放位置示意图
	private Integer isCanOrder = 1;		// 是否允许会员订购0 允许 1 不允许
	private Integer isLimitAdNum = 0;		// 是否限制数量 0 限制1 不限制
	private Long maxAdNum;		// 限制是可投放的广告数量
	private Integer adTypeId;		// 广告类别
	private Long placePixelX;		// 广告位像素规格长
	private Long placePixelY;		// 广告位像素规格宽
	private Long placePrice;		// 价格   -1面议  0代表免费 其它为价格
	private Long totalAdCount;		// 广告总数
	private Long releaseAdCount;		// 已发布数
	private String defaultAdScript;		// 默认广告代码
	
	private String adTypeName;
	
	public AdPlace() {
		super();
	}

	public AdPlace(Long id){
		super(id);
	}

	@Length(min=1, max=100, message="广告位名称长度必须介于 1 和 100 之间")
	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	
	@Length(min=0, max=255, message="广告位描述长度必须介于 0 和 255 之间")
	public String getPlaceDesc() {
		return placeDesc;
	}

	public void setPlaceDesc(String placeDesc) {
		this.placeDesc = placeDesc;
	}
	
//	@Length(min=1, max=1020, message="广告位摆放位置示意图长度必须介于 1 和 1020 之间")
	public String getPlaceDemoImg() {
		return placeDemoImg;
	}

	public void setPlaceDemoImg(String placeDemoImg) {
		this.placeDemoImg = placeDemoImg;
	}
	
	@NotNull(message="是否允许会员订购0 允许 1 不允许不能为空")
	public Integer getIsCanOrder() {
		return isCanOrder;
	}

	public void setIsCanOrder(Integer isCanOrder) {
		this.isCanOrder = isCanOrder;
	}
	
	@NotNull(message="是否限制数量 0 限制1 不限制不能为空")
	public Integer getIsLimitAdNum() {
		return isLimitAdNum;
	}

	public void setIsLimitAdNum(Integer isLimitAdNum) {
		this.isLimitAdNum = isLimitAdNum;
	}
	
	public Long getMaxAdNum() {
		return maxAdNum;
	}

	public void setMaxAdNum(Long maxAdNum) {
		this.maxAdNum = maxAdNum;
	}
	
	@NotNull(message="广告类别不能为空")
	public Integer getAdTypeId() {
		return adTypeId;
	}

	public void setAdTypeId(Integer adTypeId) {
		this.adTypeId = adTypeId;
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
	
	public Long getPlacePrice() {
		return placePrice;
	}

	public void setPlacePrice(Long placePrice) {
		this.placePrice = placePrice;
	}
	
	public Long getTotalAdCount() {
		return totalAdCount;
	}

	public void setTotalAdCount(Long totalAdCount) {
		this.totalAdCount = totalAdCount;
	}
	
	public Long getReleaseAdCount() {
		return releaseAdCount;
	}

	public void setReleaseAdCount(Long releaseAdCount) {
		this.releaseAdCount = releaseAdCount;
	}
	
	public String getDefaultAdScript() {
		return defaultAdScript;
	}

	public void setDefaultAdScript(String defaultAdScript) {
		this.defaultAdScript = defaultAdScript;
	}

	public String getAdTypeName() {
		return adTypeName;
	}

	public void setAdTypeName(String adTypeName) {
		this.adTypeName = adTypeName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}