/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qr.ecomm.common.persistence.Page;
import com.qr.ecomm.common.service.CrudService;
import com.qr.ecomm.common.service.LCrudService;
import com.qr.ecomm.modules.cms.entity.AdPlace;
import com.qr.ecomm.modules.cms.entity.Advert;
import com.qr.ecomm.modules.cms.entity.Classify;
import com.qr.ecomm.modules.cms.entity.TopicContent;
import com.qr.ecomm.modules.cms.dao.AdPlaceDao;
import com.qr.ecomm.modules.cms.dao.ClassifyDao;

/**
 * 广告位管理Service
 * @author xc
 * @version 2015-05-08
 */
@Service
@Transactional(readOnly = true)
public class AdPlaceService extends LCrudService<AdPlaceDao, AdPlace> {
	@Autowired
	private ClassifyDao classifyDao;

	public AdPlace get(Long id) {
		return super.get(id);
	}
	
	public List<AdPlace> findList(AdPlace adPlace) {
		return super.findList(adPlace);
	}
	
	public Page<AdPlace> findPage(Page<AdPlace> page, AdPlace adPlace) {
		return super.findPage(page, adPlace);
	}
	
	@Transactional(readOnly = false)
	public void saveOrUpdate(AdPlace adPlace) {
		if (adPlace.getId() == null) {
			adPlace.preInsert();
			dao.insert(adPlace);
		}else{
			adPlace.preUpdate();
			dao.update(adPlace);
		}
	}
	public List findAddTypeList(){
		return classifyDao.findClassifyList(Classify.TYPE_ADVERT);
	}
	public Page<Advert> findAdPage(Page<Advert> page, Advert Advert) {
		Advert.setPage(page);
		page.setList(dao.findAdList(Advert));
		return page;
	}
	
}