/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.dao;

import java.util.List;

import com.klht.common.persistence.annotation.LongMyBatisDao;
import com.klht.common.persistence.longid.LCrudDao;
import com.klht.modules.cms.entity.Sensitivity;

/**
 * 敏感词DAO接口
 * @author yy
 * @version 2015-05-05
 */
@LongMyBatisDao
public interface SensitivityDao extends LCrudDao<Sensitivity> {
//		/**
//		 * 根据敏感词查询
//		 * @param loginName
//		 * @return
//		 */
//		public Sensitivity getSensitivityName(Sensitivity cmsTbSensitivity);
		
		public List checkName(String sensitivity);
}