/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.dao;

import java.util.List;
import java.util.Map;

import com.klht.common.persistence.annotation.LongMyBatisDao;
import com.klht.common.persistence.longid.LCrudDao;
import com.klht.modules.cms.entity.Classify;
import com.klht.modules.cms.vo.TreeVO;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2015年4月29日     xc         Create
 * ****************************************************************************
 * </pre>
 * @author xc
 * @since 1.0
 */
@LongMyBatisDao
public interface ClassifyDao extends LCrudDao<Classify>{
	public void updateSort(Map<String, String> map);
	
	public List findClassifyList(Integer type);
	public TreeVO findClassify(Long id);
	
	public void deleteContent(Long id);
	public void deleteExhibition(Long id);
	public void deleteTopic(Long id);
	public void deleteAdvert(Long id);
	public void deleteAdPlace(Long id);
}
