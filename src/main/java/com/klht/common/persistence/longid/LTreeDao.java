/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.common.persistence.longid;

import java.util.List;

/**
 * DAO支持类实现
 * @author qr
 * @version 2015-05-16
 * @param <T>
 */
public interface LTreeDao<T extends LTreeEntity<T>> extends LCrudDao<T> {

	/**
	 * 找到所有子节点
	 * @param entity
	 * @return
	 */
	public List<T> findByParentIdsLike(T entity);

	/**
	 * 更新所有父节点字段
	 * @param entity
	 * @return
	 */
	public int updateParentIds(T entity);
	
}