/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.dao;

import java.util.List;
import java.util.Map;

import com.qr.ecomm.common.persistence.CrudDao;
import com.qr.ecomm.common.persistence.annotation.LongMyBatisDao;
import com.qr.ecomm.common.persistence.annotation.MyBatisDao;
import com.qr.ecomm.common.persistence.longid.LCrudDao;
import com.qr.ecomm.modules.cms.entity.Bid;
import com.qr.ecomm.modules.cms.entity.Content;
import com.qr.ecomm.modules.cms.entity.ContentTxt;

/**
 * 标书管理DAO接口
 * @author xc
 * @version 2015-05-11
 */
@LongMyBatisDao
public interface BidDao extends LCrudDao<Bid> {
	public void updateStatus(Map  map);
	
	public String selectBidTxt(Long bidId);
	public void insertBidTxt(Map map);
	public void updateBidTxt(Map map);
	public List<Bid> findAuditList(Bid bid);
	
}