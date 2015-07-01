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
import com.klht.modules.cms.entity.Content;
import com.klht.modules.cms.entity.ContentTxt;
import com.klht.modules.cms.service.ContentService;
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
@RequestMapping(value = "${adminPath}/cms/content")
public class ContentController extends BaseController{
	@Autowired
	private ContentService contentService;
	
	@ModelAttribute
	public Content get(@RequestParam(required=false) Long id) {
		if (id != null){
			return contentService.get(id);
		}else{
			return new Content();
		}
	}
	@RequiresPermissions("cms:content:view")
	@RequestMapping(value = {"index", ""})
	public String index() {
		return "modules/cms/content/contentIndex";
	}
	@RequiresPermissions("cms:content:view")
	@RequestMapping(value = "tree")
	public String tree(Model model) {
		model.addAttribute("channelList", contentService.findChannelList());
		return "modules/cms/content/channelTree";
	}
	@RequiresPermissions("cms:content:view")
	@RequestMapping(value = "list")
	public String list(Content content,Long chanId, HttpServletRequest request, HttpServletResponse response, Model model) {
		content.setChannelId(chanId);
		content.setType(Content.TYPE_MAN);
		Page<Content> page = contentService.findPage(new Page<Content>(request, response), content); 
        model.addAttribute("page", page);
        model.addAttribute("chanId", chanId);
		return "modules/cms/content/contentList";
	}
	@RequiresPermissions("cms:content:view")
	@RequestMapping(value = "spiderList")
	public String spiderList(Content content,HttpServletRequest request, HttpServletResponse response, Model model) {
		content.setType(Content.TYPE_SPIDER);
		Page<Content> page = contentService.findPage(new Page<Content>(request, response), content); 
        model.addAttribute("page", page);
		return "modules/cms/content/spiderList";
	}
	@RequiresPermissions("cms:content:view")
	@RequestMapping(value = "form")
	public String form(Content content,Long chanId, HttpServletRequest request, HttpServletResponse response, Model model) {
		if(content.getId() == null && chanId == null) return "error";
		if(content.getId() == null)
			content.setChannelId(chanId);
		content.setChannelPathName(contentService.findChannelPathName(content.getChannelId()));
		if(content.getId() != null){
			ContentTxt txt = contentService.findContentTxt(content.getId());
			if(txt != null)
				content.setContentTxt(txt.getContentTxt());
		}
		model.addAttribute("content", content);
		model.addAttribute("chanId",chanId);
		return "modules/cms/content/contentForm";
	}
	@RequiresPermissions("cms:content:view")
	@RequestMapping(value = "spiderForm")
	public String spiderForm(Content content,HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
		if(content.getChannelId() != null)	{
			TreeVO channelTree = contentService.findChannel(content.getChannelId());
			if( channelTree != null ){
				content.setChannelPathName(channelTree.getName());	
			}
		}		
		if(content.getId() != null){
			ContentTxt txt = contentService.findContentTxt(content.getId());
			if(txt != null)
				content.setContentTxt(txt.getContentTxt());
		}		
		model.addAttribute("content", content);
		return "modules/cms/content/spiderForm";
	}
	@RequiresPermissions("cms:content:edit")
	@RequestMapping(value = "save")
	public String save(Content content,Long chanId,String audit, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		if(StringUtils.isNotEmpty(audit) && "1".equals(audit))
			content.setStatus(Content.STATUS_NOT_AUDIT);
		else if(content.getStatus() == null)
			content.setStatus(Content.STATUS_ADD);
		contentService.saveOrUpdate(content);
		addMessage(redirectAttributes, "保存新闻成功");
		String chanIds = "";
		if(chanId != null) chanIds = chanId.toString();
		if(content.getType() == 0)
			return "redirect:" + adminPath + "/cms/content/list?chanId="+chanIds;
		else
			return "redirect:" + adminPath + "/cms/content/spiderList";
	}
	@RequiresPermissions("cms:content:edit")
	@RequestMapping(value = "delete")
	public String delete(Long[] ids,Long chanId,Long type, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		if(ids != null && ids.length > 0){
			for (Long id : ids) {
				Content content = new Content();
				content.setId(id);
				contentService.delete(content);
			}
		}
		addMessage(redirectAttributes, "删除新闻成功");
		String chanIds = "";
		if(chanId != null) chanIds = chanId.toString();
		if(type == 0)
			return "redirect:" + adminPath + "/cms/content/list?chanId="+chanIds;
		else
			return "redirect:" + adminPath + "/cms/content/spiderList";
	}
	@RequiresPermissions("cms:content:edit")
	@RequestMapping(value = "toAudit")
	public String toAudit(Long[] ids,Long chanId,Long type, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		Map map = Maps.newHashMap();
		map.put("ids", ids);
		map.put("status", Content.STATUS_NOT_AUDIT);
		if(ids != null && ids.length > 0)
			contentService.updateStatus(map);
		addMessage(redirectAttributes, "送审新闻成功");
		String chanIds = "";
		if(chanId != null) chanIds = chanId.toString();
		if(type == 0)
			return "redirect:" + adminPath + "/cms/content/list?chanId="+chanIds;
		else
			return "redirect:" + adminPath + "/cms/content/spiderList";
	}
	@RequiresUser
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(Model model) {
		List<TreeVO> list = contentService.findChannelList();
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
	@RequiresPermissions("cms:content:view")
	@RequestMapping(value = "auditIndex")
	public String auditIndex() {
		return "modules/cms/content/audit/contentAuditIndex";
	}
	@RequiresPermissions("cms:content:view")
	@RequestMapping(value = "auditTree")
	public String auditTree(Model model) {
		model.addAttribute("channelList", contentService.findChannelList());
		return "modules/cms/content/audit/channelTree";
	}
	@RequiresPermissions("cms:content:view")
	@RequestMapping(value = "auditList")
	public String auditList(Content content,Long chanId, HttpServletRequest request, HttpServletResponse response, Model model) {
		content.setChannelId(chanId);
		Page<Content> page = contentService.findAuditPage(new Page<Content>(request, response), content); 
        model.addAttribute("page", page);
        model.addAttribute("chanId", chanId);
		return "modules/cms/content/audit/contentAuditList";
	}
	@RequiresPermissions("cms:content:edit")
	@RequestMapping(value = "audit")
	public String audit(Long[] ids,Long chanId,Long status,Long type, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		Map map = Maps.newHashMap();
		map.put("ids", ids);
		map.put("status", status);
		if(ids != null && ids.length > 0)
			contentService.updateStatus(map);
		String handle = "";
		if(status == 3) handle = "发布";
		else if(status == 4) handle = "拒绝";
		else if(status == 5) handle = "下线";
		addMessage(redirectAttributes, handle + "新闻成功");
		String chanIds = "";
		if(chanId != null) chanIds = chanId.toString();
		return "redirect:" + adminPath + "/cms/content/auditList?chanId="+chanIds;
	}
	@RequiresPermissions("cms:content:view")
	@RequestMapping(value = "view")
	public String view(Content content,Long chanId, HttpServletRequest request, HttpServletResponse response, Model model) {
		if(content.getId() == null && chanId == null) return "error";
		if(content.getId() == null)
			content.setChannelId(chanId);
		content.setChannelPathName(contentService.findChannelPathName(content.getChannelId()));
		if(content.getId() != null){
			ContentTxt txt = contentService.findContentTxt(content.getId());
			if(txt != null)
				content.setContentTxt(txt.getContentTxt());
		}
		if (content.getContentTxt()!=null){
			content.setContentTxt(StringEscapeUtils.unescapeHtml4(
					content.getContentTxt()));
		}
		model.addAttribute("content", content);
		return "modules/cms/content/contentView";
	}
}
