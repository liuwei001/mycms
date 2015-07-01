/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.sys.dao;

import com.klht.common.persistence.CrudDao;
import com.klht.common.persistence.annotation.MyBatisDao;
import com.klht.modules.sys.entity.Log;

/**
 * 日志DAO接口
 * @author qr
 * @version 2015-05-16
 */
@MyBatisDao
public interface LogDao extends CrudDao<Log> {

}
