/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;
import com.klht.common.persistence.Page;
import com.klht.common.service.CrudService;
import com.klht.common.service.LCrudService;
import com.klht.modules.cms.dao.BidDao;
import com.klht.modules.cms.entity.Bid;
import com.klht.modules.cms.entity.Content;

/**
 * 标书管理Service
 * @author xc
 * @version 2015-05-11
 */
@Service
@Transactional(readOnly = true)
public class BidService extends LCrudService<BidDao, Bid> {

	public Bid get(Long id) {
		return super.get(id);
	}
	
	public List<Bid> findList(Bid bid) {
		return super.findList(bid);
	}
	
	public Page<Bid> findPage(Page<Bid> page, Bid bid) {
		return super.findPage(page, bid);
	}
	
	@Transactional(readOnly = false)
	public void save(Bid bid) {
		if (bid.getBidTxt()!=null){
			bid.setBidTxt(StringEscapeUtils.unescapeHtml4(
					bid.getBidTxt()));
		}
		if(bid.getId() == null){
			super.save(bid);
			Map map = Maps.newHashMap();
			map.put("bidId", bid.getId());
			map.put("bidTxt", bid.getBidTxt());
			dao.insertBidTxt(map);
		}else{
			super.save(bid);
			Map map = Maps.newHashMap();
			map.put("bidId", bid.getId());
			map.put("bidTxt", bid.getBidTxt());
			dao.updateBidTxt(map);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(Bid bid) {
		super.delete(bid);
	}
	@Transactional(readOnly = false)
	public void updateStatus(Map  map){
		dao.updateStatus(map);
	}
	
	public String selectBidTxt(Long bidId){
		return dao.selectBidTxt(bidId);
	}
	public Page<Bid> findAuditPage(Page<Bid> page, Bid bid) {
		bid.setPage(page);
		page.setList(dao.findAuditList(bid));
		return page;
	}
	
}