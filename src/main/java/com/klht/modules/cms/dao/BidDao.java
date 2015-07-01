/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.dao;

import java.util.List;
import java.util.Map;

import com.klht.common.persistence.CrudDao;
import com.klht.common.persistence.annotation.LongMyBatisDao;
import com.klht.common.persistence.annotation.MyBatisDao;
import com.klht.common.persistence.longid.LCrudDao;
import com.klht.modules.cms.entity.Bid;
import com.klht.modules.cms.entity.Content;
import com.klht.modules.cms.entity.ContentTxt;

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