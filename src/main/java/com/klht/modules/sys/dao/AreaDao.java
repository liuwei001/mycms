/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.sys.dao;

import com.klht.common.persistence.TreeDao;
import com.klht.common.persistence.annotation.MyBatisDao;
import com.klht.modules.sys.entity.Area;

/**
 * 区域DAO接口
 * @author qr
 * @version 2015-05-16
 */
@MyBatisDao
public interface AreaDao extends TreeDao<Area> {
	
}
