/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qr.ecomm.common.service.BaseService;
import com.qr.ecomm.modules.cms.dao.SysDao;
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
@Service
@Transactional(readOnly = true)
public class SysService extends BaseService{
	@Autowired
	private SysDao sysDao;
	public List<AreaVO> findArea(AreaVO area){
		return sysDao.findArea(area);
	}
}
