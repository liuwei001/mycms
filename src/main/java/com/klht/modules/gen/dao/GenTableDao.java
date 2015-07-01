/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.gen.dao;

import com.klht.common.persistence.CrudDao;
import com.klht.common.persistence.annotation.MyBatisDao;
import com.klht.modules.gen.entity.GenTable;

/**
 * 业务表DAO接口
 * @author qr
 * @version 2013-10-15
 */
@MyBatisDao
public interface GenTableDao extends CrudDao<GenTable> {
	
}
