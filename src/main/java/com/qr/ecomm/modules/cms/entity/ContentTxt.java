/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.entity;

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
public class ContentTxt {
	private Long contentId;
	private String contentTxt;
	private String userDef1;
	private String userDef2;
	private String userDef3;
	public Long getContentId() {
		return contentId;
	}
	public void setContentId(Long contentId) {
		this.contentId = contentId;
	}
	public String getContentTxt() {
		return contentTxt;
	}
	public void setContentTxt(String contentTxt) {
		this.contentTxt = contentTxt;
	}
	public String getUserDef1() {
		return userDef1;
	}
	public void setUserDef1(String userDef1) {
		this.userDef1 = userDef1;
	}
	public String getUserDef2() {
		return userDef2;
	}
	public void setUserDef2(String userDef2) {
		this.userDef2 = userDef2;
	}
	public String getUserDef3() {
		return userDef3;
	}
	public void setUserDef3(String userDef3) {
		this.userDef3 = userDef3;
	}
	

}
