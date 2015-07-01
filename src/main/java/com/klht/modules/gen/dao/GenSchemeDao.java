/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.gen.dao;

import com.klht.common.persistence.CrudDao;
import com.klht.common.persistence.annotation.MyBatisDao;
import com.klht.modules.gen.entity.GenScheme;

/**
 * 生成方案DAO接口
 * @author qr
 * @version 2013-10-15
 */
@MyBatisDao
public interface GenSchemeDao extends CrudDao<GenScheme> {
	
}
