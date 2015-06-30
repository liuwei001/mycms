/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.sys.dao;

import com.qr.ecomm.common.persistence.CrudDao;
import com.qr.ecomm.common.persistence.annotation.MyBatisDao;
import com.qr.ecomm.modules.sys.entity.Log;

/**
 * 日志DAO接口
 * @author qr
 * @version 2015-05-16
 */
@MyBatisDao
public interface LogDao extends CrudDao<Log> {

}
