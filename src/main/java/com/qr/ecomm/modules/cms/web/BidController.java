/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Maps;
import com.qr.ecomm.common.config.Global;
import com.qr.ecomm.common.persistence.Page;
import com.qr.ecomm.common.web.BaseController;
import com.qr.ecomm.common.utils.StringUtils;
import com.qr.ecomm.modules.cms.entity.Bid;
import com.qr.ecomm.modules.cms.service.BidService;

/**
 * 标书管理Controller
 * @author xc
 * @version 2015-05-11
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/bid")
public class BidController extends BaseController {

	@Autowired
	private BidService bidService;
	
	@ModelAttribute
	public Bid get(@RequestParam(required=false) Long id) {
		Bid entity = null;
		if (id != null){
			entity = bidService.get(id);
		}
		if (entity == null){
			entity = new Bid();
		}
		return entity;
	}
	
	@RequiresPermissions("cms:bid:view")
	@RequestMapping(value = {"list", ""})
	public String list(Bid bid, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Bid> page = bidService.findPage(new Page<Bid>(request, response), bid); 
		model.addAttribute("page", page);
		return "modules/cms/bid/bidList";
	}

	@RequiresPermissions("cms:bid:view")
	@RequestMapping(value = "form")
	public String form(Bid bid, Model model) {
		if(bid.getId() != null)
			bid.setBidTxt(bidService.selectBidTxt(bid.getId()));
		model.addAttribute("bid", bid);
		return "modules/cms/bid/bidForm";
	}

	@RequiresPermissions("cms:bid:edit")
	@RequestMapping(value = "save")
	public String save(Bid bid, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, bid)){
			return form(bid, model);
		}
		if(bid.getStatus() == null)
			bid.setStatus(Bid.STATUS_ADD);
		bidService.save(bid);
		addMessage(redirectAttributes, "保存标书成功");
		return "redirect:"+Global.getAdminPath()+"/cms/bid/?repage";
	}
	
	@RequiresPermissions("cms:bid:edit")
	@RequestMapping(value = "delete")
	public String batDelete(Long[] ids, RedirectAttributes redirectAttributes) {
		if(ids != null && ids.length > 0){
			for (Long id : ids) {
				Bid bid = new Bid();
				bid.setId(id);
				bidService.delete(bid);
			}
		}
		addMessage(redirectAttributes, "删除标书成功");
		return "redirect:"+Global.getAdminPath()+"/cms/bid/?repage";
	}
	@RequiresPermissions("cms:bid:edit")
	@RequestMapping(value = "toAudit")
	public String toAudit(Long[] ids, RedirectAttributes redirectAttributes) {
		Map map = Maps.newHashMap();
		map.put("ids", ids);
		map.put("status", Bid.STATUS_NOT_AUDIT);
		if(ids != null && ids.length > 0)
			bidService.updateStatus(map);
		addMessage(redirectAttributes, "送审标书成功");
		return "redirect:"+Global.getAdminPath()+"/cms/bid/?repage";
	}
	@RequiresPermissions("cms:bid:edit")
	@RequestMapping(value = "audit")
	public String audit(Long[] ids,Long status, RedirectAttributes redirectAttributes) {
		Map map = Maps.newHashMap();
		map.put("ids", ids);
		map.put("status", status);
		if(ids != null && ids.length > 0)
			bidService.updateStatus(map);
		String handle = "";
		if(status == 3) handle = "发布";
		else if(status == 4) handle = "拒绝";
		else if(status == 5) handle = "下线";
		addMessage(redirectAttributes, handle + "标书成功");
		return "redirect:"+Global.getAdminPath()+"/cms/bid/auditList/?repage";
	}
	@RequiresPermissions("cms:bid:view")
	@RequestMapping(value = "auditList")
	public String auditList(Bid bid, HttpServletRequest request, HttpServletResponse response, Model model) {
//		if(bid.getStatus() == null)
//			bid.setStatus(Bid.STATUS_NOT_AUDIT);
		Page<Bid> page = bidService.findAuditPage(new Page<Bid>(request, response), bid); 
		model.addAttribute("page", page);
		return "modules/cms/bid/bidAuditList";
	}
	@RequiresPermissions("cms:bid:view")
	@RequestMapping(value = "view")
	public String view(Bid bid, Model model) {
		if(bid.getId() != null)
			bid.setBidTxt(bidService.selectBidTxt(bid.getId()));
		if (bid.getBidTxt()!=null){
			bid.setBidTxt(StringEscapeUtils.unescapeHtml4(
					bid.getBidTxt()));
		}
		model.addAttribute("bid", bid);
		model.addAttribute("type", bid.getType());
		return "modules/cms/bid/bidView";
	}
}