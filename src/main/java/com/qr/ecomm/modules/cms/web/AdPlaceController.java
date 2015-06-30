/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.web;

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

import com.qr.ecomm.common.config.Global;
import com.qr.ecomm.common.persistence.Page;
import com.qr.ecomm.common.web.BaseController;
import com.qr.ecomm.common.utils.StringUtils;
import com.qr.ecomm.modules.cms.entity.AdPlace;
import com.qr.ecomm.modules.cms.entity.Advert;
import com.qr.ecomm.modules.cms.service.AdPlaceService;

/**
 * 广告位管理Controller
 * @author xc
 * @version 2015-05-08
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/adPlace")
public class AdPlaceController extends BaseController {

	@Autowired
	private AdPlaceService adPlaceService;
	
	@ModelAttribute
	public AdPlace get(@RequestParam(required=false) Long id) {
		AdPlace entity = null;
		if (id != null){
			entity = adPlaceService.get(id);
		}
		if (entity == null){
			entity = new AdPlace();
		}
		return entity;
	}
	
	@RequiresPermissions("cms:adPlace:view")
	@RequestMapping(value = {"list", ""})
	public String list(AdPlace adPlace, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AdPlace> page = adPlaceService.findPage(new Page<AdPlace>(request, response), adPlace); 
		model.addAttribute("page", page);
		model.addAttribute("addTypeList", adPlaceService.findAddTypeList());
		return "modules/cms/adPlace/adPlaceList";
	}

	@RequiresPermissions("cms:adPlace:view")
	@RequestMapping(value = "form")
	public String form(AdPlace adPlace, Model model) {
		model.addAttribute("addTypeList", adPlaceService.findAddTypeList());
		model.addAttribute("adPlace", adPlace);
		return "modules/cms/adPlace/adPlaceForm";
	}

	@RequiresPermissions("cms:adPlace:edit")
	@RequestMapping(value = "save")
	public String save(AdPlace adPlace, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, adPlace)){
			return form(adPlace, model);
		}
		if(adPlace.getIsLimitAdNum() == 0)
			adPlace.setMaxAdNum(null);
		adPlaceService.saveOrUpdate(adPlace);
		addMessage(redirectAttributes, "保存广告位成功");
		return "redirect:"+Global.getAdminPath()+"/cms/adPlace/?repage";
	}
	
	@RequiresPermissions("cms:adPlace:edit")
	@RequestMapping(value = "delete")
	public String delete(Long[] ids, RedirectAttributes redirectAttributes) {
		if(ids != null && ids.length >0){
			for (Long id : ids) {
				AdPlace adPlace = new AdPlace();
				adPlace.setId(id);
				adPlaceService.delete(adPlace);
			}
		}
		addMessage(redirectAttributes, "删除广告位成功");
		return "redirect:"+Global.getAdminPath()+"/cms/adPlace/?repage";
	}
	@RequestMapping(value = "defaultAdScript")
	public String defaultAdScript(String defaultAdScript, HttpServletRequest request, HttpServletResponse response, Model model){
		model.addAttribute("defaultAdScript","defaultAdScript");
		return "modules/cms/adPlace/defaultAdScript";
	}
	@RequiresPermissions("cms:adPlace:view")
	@RequestMapping(value = "adList")
	public String adList(Advert advert,Long adPlaceId, HttpServletRequest request, HttpServletResponse response, Model model) {
		advert.setAdPlaceId(adPlaceId);
		Page<Advert> page = adPlaceService.findAdPage(new Page<Advert>(request, response), advert); 
		model.addAttribute("page", page);
		model.addAttribute("adPlaceId", adPlaceId);
		return "modules/cms/adPlace/adList";
	}

}