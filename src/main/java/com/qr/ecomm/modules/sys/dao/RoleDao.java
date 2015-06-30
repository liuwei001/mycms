/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.sys.dao;

import com.qr.ecomm.common.persistence.CrudDao;
import com.qr.ecomm.common.persistence.annotation.MyBatisDao;
import com.qr.ecomm.modules.sys.entity.Role;

/**
 * 角色DAO接口
 * @author qr
 * @version 2013-12-05
 */
@MyBatisDao
public interface RoleDao extends CrudDao<Role> {

	public Role getByName(Role role);
	
	public Role getByEnname(Role role);

	/**
	 * 维护角色与菜单权限关系
	 * @param role
	 * @return
	 */
	public int deleteRoleMenu(Role role);

	public int insertRoleMenu(Role role);
	
	/**
	 * 维护角色与公司部门关系
	 * @param role
	 * @return
	 */
	public int deleteRoleOffice(Role role);

	public int insertRoleOffice(Role role);

}
