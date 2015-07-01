/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringEscapeUtils;
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
import com.klht.common.persistence.Page;
import com.klht.common.utils.StringUtils;
import com.klht.common.web.BaseController;
import com.klht.modules.cms.entity.ContentTxt;
import com.klht.modules.cms.entity.Exhibition;
import com.klht.modules.cms.service.ContentService;
import com.klht.modules.cms.service.ExhibitionService;
import com.klht.modules.cms.vo.TreeVO;

/**
 * 描述：人工采编
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2015年5月5日      xc         Create
 * ****************************************************************************
 * </pre>
 * @author xc
 * @since 1.0
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/exhibition")
public class ExhibitionController extends BaseController{
	@Autowired
	private ExhibitionService exhibitionService;
	
	@ModelAttribute
	public Exhibition get(@RequestParam(required=false) Long id) {
		if (id != null){
			return exhibitionService.get(id);
		}else{
			return new Exhibition();
		}
	}
	@RequiresPermissions("cms:exhibition:view")
	@RequestMapping(value = {"index", ""})
	public String index() {
		return "modules/cms/exhibition/exhibitionIndex";
	}
	@RequiresPermissions("cms:exhibition:view")
	@RequestMapping(value = "tree")
	public String tree(Model model) {
		model.addAttribute("channelList", exhibitionService.findChannelList());
		return "modules/cms/exhibition/channelTree";
	}
	@RequiresPermissions("cms:exhibition:view")
	@RequestMapping(value = "list")
	public String list(Exhibition exhibition,Long chanId, HttpServletRequest request, HttpServletResponse response, Model model) {
		exhibition.setChannelId(chanId);
		exhibition.setType(Exhibition.TYPE_MAN);
		Page<Exhibition> page = exhibitionService.findPage(new Page<Exhibition>(request, response), exhibition); 
        model.addAttribute("page", page);
        model.addAttribute("chanId", chanId);
		return "modules/cms/exhibition/exhibitionList";
	}
	@RequiresPermissions("cms:exhibition:view")
	@RequestMapping(value = "spiderList")
	public String spiderList(Exhibition exhibition,HttpServletRequest request, HttpServletResponse response, Model model) {
		exhibition.setType(Exhibition.TYPE_SPIDER);
		Page<Exhibition> page = exhibitionService.findPage(new Page<Exhibition>(request, response), exhibition); 
        model.addAttribute("page", page);
		return "modules/cms/exhibition/spiderList";
	}
	@RequiresPermissions("cms:exhibition:view")
	@RequestMapping(value = "form")
	public String form(Exhibition exhibition,Long chanId, HttpServletRequest request, HttpServletResponse response, Model model) {
		if(exhibition.getId() == null && chanId == null) return "error";
		if(exhibition.getId() == null)
			exhibition.setChannelId(chanId);
		exhibition.setChannelPathName(exhibitionService.findChannelPathName(exhibition.getChannelId()));
		if(exhibition.getId() != null){
			exhibition.setExhibitionTxt(exhibitionService.findExhibitionTxt(exhibition.getId()));
		}
		model.addAttribute("exhibition", exhibition);
		model.addAttribute("chanId",chanId);
		return "modules/cms/exhibition/exhibitionForm";
	}
	@RequiresPermissions("cms:exhibition:view")
	@RequestMapping(value = "spiderForm")
	public String spiderForm(Exhibition exhibition,HttpServletRequest request, HttpServletResponse response, Model model) {
		if(exhibition.getId() != null){
			exhibition.setExhibitionTxt(exhibitionService.findExhibitionTxt(exhibition.getId()));
		}
		if(exhibition.getChannelId() != null)
			exhibition.setChannelPathName(exhibitionService.findChannel(exhibition.getChannelId()).getName());
		model.addAttribute("exhibition", exhibition);
		return "modules/cms/exhibition/spiderForm";
	}
	@RequiresPermissions("cms:exhibition:edit")
	@RequestMapping(value = "save")
	public String save(Exhibition exhibition,Long chanId,String audit, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		if(StringUtils.isNotEmpty(audit) && "1".equals(audit))
			exhibition.setStatus(Exhibition.STATUS_NOT_AUDIT);
		else if(exhibition.getStatus() == null)
			exhibition.setStatus(Exhibition.STATUS_ADD);
		exhibitionService.saveOrUpdate(exhibition);
		addMessage(redirectAttributes, "保存展会成功");
		String chanIds = "";
		if(chanId != null) chanIds = chanId.toString();
		if(exhibition.getType() == 0)
			return "redirect:" + adminPath + "/cms/exhibition/list?chanId="+chanIds;
		else
			return "redirect:" + adminPath + "/cms/exhibition/spiderList";
	}
	@RequiresPermissions("cms:exhibition:edit")
	@RequestMapping(value = "delete")
	public String delete(Long[] ids,Long chanId,Long type, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		if(ids != null && ids.length > 0){
			for (Long id : ids) {
				Exhibition Exhibition = new Exhibition();
				Exhibition.setId(id);
				exhibitionService.delete(Exhibition);
			}
		}
		addMessage(redirectAttributes, "删除展会成功");
		String chanIds = "";
		if(chanId != null) chanIds = chanId.toString();
		if(type == 0)
			return "redirect:" + adminPath + "/cms/exhibition/list?chanId="+chanIds;
		else
			return "redirect:" + adminPath + "/cms/exhibition/spiderList";
	}
	@RequiresPermissions("cms:exhibition:edit")
	@RequestMapping(value = "toAudit")
	public String toAudit(Long[] ids,Long chanId,Long type, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		Map map = Maps.newHashMap();
		map.put("ids", ids);
		map.put("status", Exhibition.STATUS_NOT_AUDIT);
		if(ids != null && ids.length > 0)
			exhibitionService.updateStatus(map);
		addMessage(redirectAttributes, "送审展会成功");
		String chanIds = "";
		if(chanId != null) chanIds = chanId.toString();
		if(type == 0)
			return "redirect:" + adminPath + "/cms/exhibition/list?chanId="+chanIds;
		else
			return "redirect:" + adminPath + "/cms/exhibition/spiderList";
	}
	@RequiresUser
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(Model model) {
		List<TreeVO> list = exhibitionService.findChannelList();
		List<Map<String, Object>> mapList = Lists.newArrayList();
		for (int i=0; i<list.size(); i++){
				TreeVO e = list.get(i);
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("name", e.getName());
				mapList.add(map);
		}
		return mapList;
	}
	@RequiresPermissions("cms:exhibition:view")
	@RequestMapping(value = "auditIndex")
	public String auditIndex() {
		return "modules/cms/exhibition/audit/exhibitionAuditIndex";
	}
	@RequiresPermissions("cms:exhibition:view")
	@RequestMapping(value = "auditTree")
	public String auditTree(Model model) {
		model.addAttribute("channelList", exhibitionService.findChannelList());
		return "modules/cms/exhibition/audit/channelTree";
	}
	@RequiresPermissions("cms:exhibition:view")
	@RequestMapping(value = "auditList")
	public String auditList(Exhibition exhibition,Long chanId, HttpServletRequest request, HttpServletResponse response, Model model) {
		exhibition.setChannelId(chanId);
//		exhibition.setType(Exhibition.TYPE_MAN);
		Page<Exhibition> page = exhibitionService.findAuditPage(new Page<Exhibition>(request, response), exhibition); 
        model.addAttribute("page", page);
        model.addAttribute("chanId", chanId);
		return "modules/cms/exhibition/audit/exhibitionAuditList";
	}
	@RequiresPermissions("cms:exhibition:edit")
	@RequestMapping(value = "audit")
	public String audit(Long[] ids,Long chanId,Long status,Long type, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		Map map = Maps.newHashMap();
		map.put("ids", ids);
		map.put("status", status);
		if(ids != null && ids.length > 0)
			exhibitionService.updateStatus(map);
		String handle = "";
		if(status == 3) handle = "发布";
		else if(status == 4) handle = "拒绝";
		else if(status == 5) handle = "下线";
		addMessage(redirectAttributes, handle + "展会成功");
		String chanIds = "";
		if(chanId != null) chanIds = chanId.toString();
		return "redirect:" + adminPath + "/cms/exhibition/auditList?chanId="+chanIds;
	}
	@RequiresPermissions("cms:exhibition:view")
	@RequestMapping(value = "view")
	public String view(Exhibition exhibition,Long chanId,HttpServletRequest request, HttpServletResponse response, Model model) {
		if(exhibition.getId() == null && chanId == null) return "error";
		if(exhibition.getId() == null)
			exhibition.setChannelId(chanId);
		if(exhibition.getId() != null){
			exhibition.setExhibitionTxt(exhibitionService.findExhibitionTxt(exhibition.getId()));
		}
		if(exhibition.getChannelId() != null)
			exhibition.setChannelPathName(exhibitionService.findChannelPathName(exhibition.getChannelId()));
		if (exhibition.getExhibitionTxt()!=null){
			exhibition.setExhibitionTxt(StringEscapeUtils.unescapeHtml4(
					exhibition.getExhibitionTxt()));
		}
		model.addAttribute("exhibition", exhibition);
		return "modules/cms/exhibition/exhibitionView";
	}
}
