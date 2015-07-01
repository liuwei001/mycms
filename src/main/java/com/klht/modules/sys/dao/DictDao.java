/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.sys.dao;

import java.util.List;

import com.klht.common.persistence.CrudDao;
import com.klht.common.persistence.annotation.MyBatisDao;
import com.klht.modules.sys.entity.Dict;

/**
 * 字典DAO接口
 * @author qr
 * @version 2015-05-16
 */
@MyBatisDao
public interface DictDao extends CrudDao<Dict> {

	public List<String> findTypeList(Dict dict);
	
}
