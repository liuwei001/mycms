/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.sys.dao;

import java.util.List;

import com.qr.ecomm.common.persistence.CrudDao;
import com.qr.ecomm.common.persistence.annotation.MyBatisDao;
import com.qr.ecomm.modules.sys.entity.Menu;

/**
 * 菜单DAO接口
 * @author qr
 * @version 2015-05-16
 */
@MyBatisDao
public interface MenuDao extends CrudDao<Menu> {

	public List<Menu> findByParentIdsLike(Menu menu);

	public List<Menu> findByUserId(Menu menu);
	
	public int updateParentIds(Menu menu);
	
	public int updateSort(Menu menu);
	
}
