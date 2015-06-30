/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.dao;

import java.util.List;
import java.util.Map;

import com.qr.ecomm.common.persistence.annotation.LongMyBatisDao;
import com.qr.ecomm.common.persistence.longid.LCrudDao;
import com.qr.ecomm.modules.cms.entity.Content;
import com.qr.ecomm.modules.cms.entity.ContentTxt;
import com.qr.ecomm.modules.cms.entity.Exhibition;
import com.qr.ecomm.modules.cms.entity.Tag;
import com.qr.ecomm.modules.cms.vo.TreeVO;

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
