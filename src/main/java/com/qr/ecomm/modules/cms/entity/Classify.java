/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.entity;

import java.util.List;

import com.qr.ecomm.common.persistence.longid.LDataEntity;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2015年5月12日      vmp         Create
 * ****************************************************************************
 * </pre>
 * @author vmp
 * @since 1.0
 */
public class Classify extends LDataEntity<Classify>{
	private Long parentId;
	private String name;
	private Integer type;
	private String pathId;
	private String pathName;
	private String keywords;
	private Integer isShow = 1;
	private Long sort;
	private String code;
	
	private String parentName;
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getPathId() {
		return pathId;
	}
	public void setPathId(String pathId) {
		this.pathId = pathId;
	}
	public String getPathName() {
		return pathName;
	}
	public void setPathName(String pathName) {
		this.pathName = pathName;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public Integer getIsShow() {
		return isShow;
	}
	public void setIsShow(Integer isShow) {
		this.isShow = isShow;
	}
	public Long getSort() {
		return sort;
	}
	public void setSort(Long sort) {
		this.sort = sort;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public static void sortList(List<Classify> list, List<Classify> sourcelist, Long parentId){
		for (int i=0; i<sourcelist.size(); i++){
			Classify e = sourcelist.get(i);
			if (e.getParentId()!=null
					&& e.getParentId().equals(parentId)){
				list.add(e);
				// 判断是否还有子节点, 有则继续获取子节点
				for (int j=0; j<sourcelist.size(); j++){
					Classify child = sourcelist.get(j);
					if (child.getParentId()!=null
							&& child.getParentId().equals(e.getId())){
						sortList(list, sourcelist, e.getId());
						break;
					}
				}
			}
		}
	}
	
	public static final int TYPE_CONTENT = 1;
	public static final int TYPE_TOPIC = 2;
	public static final int TYPE_EXHIBITION = 3;
	public static final int TYPE_ADVERT = 4;
	
}
