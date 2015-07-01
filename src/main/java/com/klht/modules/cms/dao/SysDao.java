/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.dao;

import java.util.List;

import com.klht.common.persistence.BaseDao;
import com.klht.common.persistence.annotation.LongMyBatisDao;
import com.klht.modules.cms.vo.AreaVO;
import com.klht.modules.sys.entity.Area;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2015年5月19日      vmp         Create
 * ****************************************************************************
 * </pre>
 * @author vmp
 * @since 1.0
 */
@LongMyBatisDao
public interface SysDao extends BaseDao{
	public List<AreaVO> findArea(AreaVO area);
}
