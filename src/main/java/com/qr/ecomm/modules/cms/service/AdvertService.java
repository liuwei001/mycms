/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qr.ecomm.common.persistence.Page;
import com.qr.ecomm.common.service.CrudService;
import com.qr.ecomm.common.service.LCrudService;
import com.qr.ecomm.modules.cms.entity.AdPlace;
import com.qr.ecomm.modules.cms.entity.Advert;
import com.qr.ecomm.modules.cms.entity.Classify;
import com.qr.ecomm.modules.cms.entity.Content;
import com.qr.ecomm.modules.cms.entity.TopicContent;
import com.qr.ecomm.modules.cms.dao.AdPlaceDao;
import com.qr.ecomm.modules.cms.dao.AdvertDao;
import com.qr.ecomm.modules.cms.dao.ClassifyDao;

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