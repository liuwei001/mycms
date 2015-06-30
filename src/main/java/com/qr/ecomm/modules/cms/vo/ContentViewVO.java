/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.vo;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2015年6月2日      vmp         Create
 * ****************************************************************************
 * </pre>
 * @author vmp
 * @since 1.0
 */
public class ContentViewVO {
	private String id;
	private Long views;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Long getViews() {
		return views;
	}
	public void setViews(Long views) {
		this.views = views;
	}
	
	
}
