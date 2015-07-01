/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Maps;
import com.klht.common.config.Global;
import com.klht.common.persistence.Page;
import com.klht.common.utils.StringUtils;
import com.klht.common.web.BaseController;
import com.klht.modules.cms.entity.AdPlace;
import com.klht.modules.cms.entity.Advert;
import com.klht.modules.cms.entity.Bid;
import com.klht.modules.cms.entity.Topic;
import com.klht.modules.cms.service.AdPlaceService;
import com.klht.modules.cms.service.AdvertService;

/**
 * 广告位管理Controller
 * @author xc
 * @version 2015-05-08
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/advert")
public class AdvertController extends BaseController {

	@Autowired
	private AdvertService advertService;
	
	@ModelAttribute
	public Advert get(@RequestParam(required=false) Long id) {
		Advert entity = null;
		if (id != null){
			entity = advertService.get(id);
		}
		if (entity == null){
			entity = new Advert();
		}
		return entity;
	}
	
	@RequiresPermissions("cms:advert:view")
	@RequestMapping(value = {"list", ""})
	public String list(Advert advert, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Advert> page = advertService.findPage(new Page<Advert>(request, response), advert); 
		model.addAttribute("page", page);
		model.addAttribute("addTypeList", advertService.findAdTypeList());
		return "modules/cms/advert/advertList";
	}

	@RequiresPermissions("cms:advert:view")
	@RequestMapping(value = "form")
	public String form(Advert advert, Model model) {
		return "modules/cms/advert/advertForm";
	}

	@RequiresPermissions("cms:advert:edit")
	@RequestMapping(value = "save")
	public String save(Advert advert, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, advert)){
			return form(advert, model);
		}
		if(advert.getId() == null)
			advert.setStatus(Advert.STATUS_ADD);
		advertService.saveOrUpdate(advert);
		addMessage(redirectAttributes, "保存广告成功");
		return "redirect:"+Global.getAdminPath()+"/cms/advert";
	}
	@RequiresPermissions("cms:advert:edit")
	@RequestMapping(value = "delete")
	public String delete(Long[] ids, RedirectAttributes redirectAttributes) {
		if(ids != null && ids.length > 0){
			for (Long id : ids) {
				Advert advert = new Advert();
				advert.setId(id);
				advertService.delete(advert);
			}
		}
		addMessage(redirectAttributes, "删除广告成功");
		return "redirect:"+Global.getAdminPath()+"/cms/advert";
	}
	@RequiresPermissions("cms:advert:edit")
	@RequestMapping(value = "toAudit")
	public String toAudit(Long[] ids,HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		if(ids != null && ids.length > 0){
			Map map = Maps.newHashMap();
			map.put("ids", ids);
			map.put("status", Advert.STATUS_NOT_AUDIT);
			advertService.updateStatus(map);
		}
		addMessage(redirectAttributes, "送审广告成功");
		return "redirect:" + adminPath + "/cms/advert/list";
	}
	@RequiresPermissions("cms:advert:view")
	@RequestMapping(value = "placeList")
	public String placeList(AdPlace adPlace, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AdPlace> page = advertService.findAdPlacePage(new Page<AdPlace>(request, response), adPlace); 
		model.addAttribute("page", page);
		model.addAttribute("addTypeList", advertService.findAdTypeList());
		return "modules/cms/advert/adPlaceList";
	}
	@RequiresPermissions("cms:advert:view")
	@RequestMapping(value = "auditList")
	public String auditList(Advert advert, HttpServletRequest request, HttpServletResponse response, Model model) {
//		if(advert.getStatus() == null)
//			advert.setStatus(Advert.STATUS_NOT_AUDIT);
		Page<Advert> page = advertService.findAuditPage(new Page<Advert>(request, response), advert); 
		model.addAttribute("page", page);
		return "modules/cms/advert/advertAuditList";
	}
	@RequiresPermissions("cms:advert:edit")
	@RequestMapping(value = "audit")
	public String audit(Long[] ids,Long status, RedirectAttributes redirectAttributes) {
		Map map = Maps.newHashMap();
		map.put("ids", ids);
		map.put("status", status);
		if(ids != null && ids.length > 0)
			advertService.updateStatus(map);
		String handle = "";
		if(status == 3) handle = "发布";
		else if(status == 4) handle = "拒绝";
		else if(status == 5) handle = "下线";
		addMessage(redirectAttributes, handle + "广告成功");
		return "redirect:"+Global.getAdminPath()+"/cms/advert/auditList/?repage";
	}

}