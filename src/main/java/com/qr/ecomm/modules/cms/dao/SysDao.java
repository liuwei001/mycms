/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.dao;

import java.util.List;

import com.qr.ecomm.common.persistence.BaseDao;
import com.qr.ecomm.common.persistence.annotation.LongMyBatisDao;
import com.qr.ecomm.modules.cms.vo.AreaVO;
import com.qr.ecomm.modules.sys.entity.Area;

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
