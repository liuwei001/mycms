/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.klht.common.persistence.Page;
import com.klht.common.service.CrudService;
import com.klht.common.service.LCrudService;
import com.klht.modules.cms.dao.AdPlaceDao;
import com.klht.modules.cms.dao.AdvertDao;
import com.klht.modules.cms.dao.ClassifyDao;
import com.klht.modules.cms.entity.AdPlace;
import com.klht.modules.cms.entity.Advert;
import com.klht.modules.cms.entity.Classify;
import com.klht.modules.cms.entity.Content;
import com.klht.modules.cms.entity.TopicContent;

/**
 * 广告位管理Service
 * @author xc
 * @version 2015-05-08
 */
@Service
@Transactional(readOnly = true)
public class AdvertService extends LCrudService<AdvertDao, Advert> {
	@Autowired
	private ClassifyDao classifyDao;

	@Transactional(readOnly = false)
	public void saveOrUpdate(Advert advert) {
		if (advert.getId() == null) {
			advert.preInsert();
			dao.insert(advert);
		}else{
			advert.preUpdate();
			dao.update(advert);
		}
	}
	public List findAdTypeList(){
		return classifyDao.findClassifyList(Classify.TYPE_ADVERT);
	}
	public Page<AdPlace> findAdPlacePage(Page<AdPlace> page, AdPlace adPlace){
		adPlace.setPage(page);
		page.setList(dao.findAdPlaceList(adPlace));
		return page;
	}
	@Transactional(readOnly = false)
	public void updateStatus(Map  map){
		dao.updateStatus(map);
	}
	
	public Page<Advert> findAuditPage(Page<Advert> page, Advert advert) {
		advert.setPage(page);
		page.setList(dao.findAuditList(advert));
		return page;
	}
	
}