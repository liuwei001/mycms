/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.dao;

import java.util.List;
import java.util.Map;

import com.klht.common.persistence.annotation.LongMyBatisDao;
import com.klht.common.persistence.longid.LCrudDao;
import com.klht.modules.cms.entity.Content;
import com.klht.modules.cms.entity.ContentTxt;
import com.klht.modules.cms.entity.Exhibition;
import com.klht.modules.cms.entity.Tag;
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
public interface ExhibitionDao extends LCrudDao<Exhibition>{
	public void updateStatus(Map  map);
	
//	public List findChannelList();
//	public TreeVO findChannel(Long channelId);
	
	public String selectExhibitionTxt(Long exhibitionId);
	public void insertExhibitionTxt(Map map);
	public void updateExhibitionTxt(Map map);
	public List<Exhibition> findAuditList(Exhibition exhibition);
	
}
