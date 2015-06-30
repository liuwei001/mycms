/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.dao;

import java.util.List;
import java.util.Map;

import com.qr.ecomm.common.persistence.CrudDao;
import com.qr.ecomm.common.persistence.annotation.LongMyBatisDao;
import com.qr.ecomm.common.persistence.annotation.MyBatisDao;
import com.qr.ecomm.common.persistence.longid.LCrudDao;
import com.qr.ecomm.modules.cms.entity.AdPlace;
import com.qr.ecomm.modules.cms.entity.Advert;
import com.qr.ecomm.modules.cms.entity.Content;

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