/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.klht.common.persistence.Page;
import com.klht.common.service.LCrudService;
import com.klht.modules.cms.dao.SensitivityDao;
import com.klht.modules.cms.entity.Sensitivity;

/**
 * 敏感词Service
 * @author yy
 * @version 2015-05-05
 */
@Service
@Transactional(readOnly = true)
public class SensitivityService extends LCrudService<SensitivityDao, Sensitivity> {

	public Sensitivity get(Long id) {
		return super.get(id);
	}
	
	public List<Sensitivity> findList(Sensitivity sensitivity) {
		return super.findList(sensitivity);
	}
	
	public Page<Sensitivity> findPage(Page<Sensitivity> page, Sensitivity sensitivity) {
		return super.findPage(page, sensitivity);
	}
	
	@Transactional(readOnly = false)
	public void save(Sensitivity sensitivity) {
		if(StringUtils.isEmpty(sensitivity.getReplacement()))
			sensitivity.setReplacement("***");
		super.save(sensitivity);
	}
	
	@Transactional(readOnly = false)
	public void delete(Sensitivity sensitivity) {
		super.delete(sensitivity);
	}
//	@Transactional(readOnly = false)
//	public void getSensitivityName(Sensitivity sensitivity) {
//		super.dao.getSensitivityName(sensitivity);
//	}
	@Transactional(readOnly = false)
	public int delete(String[] ids){
		try {
			for(int i = 0;i<ids.length;i++){
				Sensitivity sensitivity = new Sensitivity();
				sensitivity.setId(Long.valueOf(ids[i]));
				super.delete(sensitivity);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
	public Boolean checkName(String name){
		Sensitivity sensitivity = new Sensitivity();
		List list = dao.checkName(name);
		if(list != null && list.size() > 0 ) return true;
		return false;
	}
}