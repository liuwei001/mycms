/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.vo;

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
public class ImportNewsVO {
	private String id;
	private Long classifyid;
	private String classifyname;
	private String title;
	private String author;
	private String contenttxt;
	private String releasedatestr;
	private Long views;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Long getClassifyid() {
		return classifyid;
	}
	public void setClassifyid(Long classifyid) {
		this.classifyid = classifyid;
	}
	public String getClassifyname() {
		return classifyname;
	}
	public void setClassifyname(String classifyname) {
		this.classifyname = classifyname;
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
	public String getContenttxt() {
		return contenttxt;
	}
	public void setContenttxt(String contenttxt) {
		this.contenttxt = contenttxt;
	}
	public String getReleasedatestr() {
		return releasedatestr;
	}
	public void setReleasedatestr(String releasedatestr) {
		this.releasedatestr = releasedatestr;
	}
	public Long getViews() {
		return views;
	}
	public void setViews(Long views) {
		this.views = views;
	}
	
	
}
