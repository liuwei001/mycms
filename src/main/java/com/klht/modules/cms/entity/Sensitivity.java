/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.entity;

import org.hibernate.validator.constraints.Length;

import com.klht.common.persistence.longid.LDataEntity;
import com.klht.common.utils.excel.annotation.ExcelField;

/**
 * 敏感词Entity
 * @author yy
 * @version 2015-05-05
 */
public class Sensitivity extends LDataEntity<Sensitivity> {
	
	private static final long serialVersionUID = 1L;
	private String sensitivity;		// 敏感词
	private String replacement;		// 替换词
	
	public Sensitivity() {
		super();
	}

	public Sensitivity(Long id){
		super(id);
	}

	@Length(min=1, max=30, message="敏感词长度必须介于 1 和 30 之间")
	@ExcelField(title="敏感词", align=1, sort=45)
	public String getSensitivity() {
		return sensitivity;
	}

	public void setSensitivity(String sensitivity) {
		this.sensitivity = sensitivity;
	}
	
	@Length(min=0, max=30, message="替换词长度必须介于 0 和 30 之间")
	@ExcelField(title="替换词", align=1, sort=55)
	public String getReplacement() {
		return replacement;
	}

	public void setReplacement(String replacement) {
		if("".equals(replacement)||null==replacement){
			replacement="***";
		}
		this.replacement = replacement;
	}
	
}