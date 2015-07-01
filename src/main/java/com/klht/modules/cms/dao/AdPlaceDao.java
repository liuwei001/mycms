/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.dao;

import java.util.List;

import com.klht.common.persistence.CrudDao;
import com.klht.common.persistence.annotation.LongMyBatisDao;
import com.klht.common.persistence.annotation.MyBatisDao;
import com.klht.common.persistence.longid.LCrudDao;
import com.klht.modules.cms.entity.AdPlace;
import com.klht.modules.cms.entity.Advert;

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