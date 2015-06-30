/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.dao;

import java.util.List;

import com.qr.ecomm.common.persistence.CrudDao;
import com.qr.ecomm.common.persistence.annotation.LongMyBatisDao;
import com.qr.ecomm.common.persistence.annotation.MyBatisDao;
import com.qr.ecomm.common.persistence.longid.LCrudDao;
import com.qr.ecomm.modules.cms.entity.AdPlace;
import com.qr.ecomm.modules.cms.entity.Advert;

/**
 * 广告位管理DAO接口
 * @author xc
 * @version 2015-05-08
 */
@LongMyBatisDao
public interface AdPlaceDao extends LCrudDao<AdPlace> {
//	public List findAddTypeList();
	public List findAdList(Advert advert);
}