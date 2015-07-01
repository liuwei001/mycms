/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.klht.common.persistence.Page;
import com.klht.common.service.CrudService;
import com.klht.common.service.LCrudService;
import com.klht.modules.cms.dao.AdPlaceDao;
import com.klht.modules.cms.dao.ClassifyDao;
import com.klht.modules.cms.entity.AdPlace;
import com.klht.modules.cms.entity.Advert;
import com.klht.modules.cms.entity.Classify;
import com.klht.modules.cms.entity.TopicContent;

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