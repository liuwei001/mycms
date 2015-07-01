/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.dao;

import java.util.List;
import java.util.Map;

import com.klht.common.persistence.CrudDao;
import com.klht.common.persistence.annotation.LongMyBatisDao;
import com.klht.common.persistence.annotation.MyBatisDao;
import com.klht.common.persistence.longid.LCrudDao;
import com.klht.modules.cms.entity.AdPlace;
import com.klht.modules.cms.entity.Advert;
import com.klht.modules.cms.entity.Content;

/**
 * 广告位管理DAO接口
 * @author xc
 * @version 2015-05-08
 */
@LongMyBatisDao
public interface AdvertDao extends LCrudDao<Advert> {
//	public List findAdTypeList();
	public List findAdPlaceList(AdPlace adPlace);
	public void updateStatus(Map  map);
	public List<Advert> findAuditList(Advert advert);
}