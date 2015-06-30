/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.qr.ecomm.common.utils.StringUtils;
import com.qr.ecomm.common.web.BaseController;
import com.qr.ecomm.modules.cms.entity.Classify;
import com.qr.ecomm.modules.cms.service.ClassifyService;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2015年4月29日      xc         Create
 * ****************************************************************************
 * </pre>
 * @author xc
 * @since 1.0
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/classify")
public class ClassifyController  extends BaseController{
	@Autowired
	private ClassifyService classifyService;
	
	@ModelAttribute
	public Classify get(@RequestParam(required=false) Long id) {
		if (id != null){
			return classifyService.get(id);
		}else{
			return new Classify();
		}
	}
	
	@RequiresPermissions("cms:classify:view")
	@RequestMapping(value = {"list", ""})
	public String list(Classify classify,Integer type, HttpServletRequest request, HttpServletResponse response, Model model) {
		if(type == null) type = new Integer(1);
		String rootName = findRootTypeName(type);
		classify.setType(type);
		List<Classify> sourcelist = classifyService.findList(classify);
		List<Classify> list = Lists.newArrayList();
		Classify.sortList(list, sourcelist, 0L);
        model.addAttribute("list", list);
        model.addAttribute("type", type);
        model.addAttribute("rootName", rootName);
		return "modules/cms/classify/classifyList";
	}
	@RequiresPermissions("cms:classify:view")
	@RequestMapping(value = "form")
	public String form(Classify classify, Integer type,Model model) {
		String rootName = findRootTypeName(type);
		classify.setType(type);
		model.addAttribute("classify", classify);
		model.addAttribute("type", type);
		model.addAttribute("rootName", rootName);
		return "modules/cms/classify/classifyForm";
	}
	@RequiresPermissions("cms:classify:view")
	@RequestMapping(value = "addlow")
	public String addlow(Classify classify,Integer type, Model model) {
		String rootName = findRootTypeName(type);
		Classify gc = new Classify();
		if(classify.getId() != null && classify.getId() != 0){
			gc.setParentId(classify.getId());
			gc.setParentName(classify.getName());
		}
		gc.setType(type);
		model.addAttribute("classify", gc);
		model.addAttribute("type", type);
		model.addAttribute("rootName", rootName);
		return "modules/cms/classify/classifyForm";
	}
	@RequiresPermissions("cms:classify:edit")
	@RequestMapping(value = "save")
	public String save(Classify classify,Integer type, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		classifyService.saveOrUpdate(classify);
		addMessage(redirectAttributes, "保存分类成功");
		return "redirect:" + adminPath + "/cms/classify/list?type="+type;
	}
	@RequiresPermissions("cms:classify:edit")
	@RequestMapping(value = "delete")
	public String delete(Classify classify,Integer type, RedirectAttributes redirectAttributes) {
		classifyService.delete(classify);
		addMessage(redirectAttributes, "删除分类成功");
		return "redirect:" + adminPath + "/cms/classify/list?type="+type;
	}
	@RequiresUser
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(String module,Integer type, @RequestParam(required=false) String extId, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		List<Map<String, Object>> mapList = Lists.newArrayList();
		Classify classify = new Classify();
		classify.setType(type);
		List<Classify> list = classifyService.findList(classify);
		for (int i=0; i<list.size(); i++){
			Classify e = list.get(i);
			if (extId != null && extId.equals(e.getId().toString())) continue;
			if (extId != null && extId.equals(e.getParentId().toString())) continue;
			if (extId != null && e.getPathId() != null  &&  ("/"+ e.getPathId() +"/").indexOf("/"+extId+"/")>=0) continue;
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("pId", e.getParentId());
			map.put("name", e.getName());
			mapList.add(map);
		}
		return mapList;
	}
	@RequiresPermissions("cms:classify:edit")
	@RequestMapping(value = "updateSort")
	public String updateSort(String[] ids, Integer[] sorts,String isFloor, RedirectAttributes redirectAttributes) {
    	int len = ids.length;
    	for (int i = 0; i < len; i++) {
    		classifyService.updateSort(ids[i], sorts[i].toString());
    	}
		return "redirect:" + adminPath + "/cms/classify/?isFloor="+isFloor;
	}
	private String findRootTypeName(Integer type){
		String rootName = "";
		switch(type){
			case 1: rootName = "新闻"; break;
			case 2: rootName = "专题"; break;
			case 3: rootName = "展会"; break;
			case 4: rootName = "广告"; break;
		}
		return rootName;
	}
	@ResponseBody
	@RequiresPermissions("cms:classify:edit")
	@RequestMapping(value = "checkCode")
	public String checkCode(String code,String oldCode,Integer type){
		if(StringUtils.isEmpty(code)) return "false";
		Classify classify = new Classify();
		classify.setType(type);
		classify.setCode(code);
		if(StringUtils.isEmpty(oldCode)){
			List list = classifyService.findList(classify);
			if(list != null && list.size() > 0)
				return "false";
		}else{
			if(oldCode.equals(code)) return "true";
			List list = classifyService.findList(classify);
			if(list != null && list.size() > 0)
				return "false";
		}
		return "true";
	}
	@ResponseBody
	@RequiresPermissions("cms:classify:edit")
	@RequestMapping(value = "checkName")
	public String checkName(String name,String oldName,Integer type){
		if(StringUtils.isEmpty(name)) return "false";
		Classify classify = new Classify();
		classify.setType(type);
		classify.setName(name);;
		if(StringUtils.isEmpty(oldName)){
			List list = classifyService.findList(classify);
			if(list != null && list.size() > 0)
				return "false";
		}else{
			if(oldName.equals(name)) return "true";
			List list = classifyService.findList(classify);
			if(list != null && list.size() > 0)
				return "false";
		}
		return "true";
	}

}
