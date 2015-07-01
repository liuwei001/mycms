/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.web;

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
import com.klht.common.config.Global;
import com.klht.common.persistence.Page;
import com.klht.common.utils.StringUtils;
import com.klht.common.web.BaseController;
import com.klht.modules.cms.entity.Advert;
import com.klht.modules.cms.entity.Bid;
import com.klht.modules.cms.entity.Content;
import com.klht.modules.cms.entity.ContentTxt;
import com.klht.modules.cms.entity.Topic;
import com.klht.modules.cms.entity.TopicContent;
import com.klht.modules.cms.entity.TopicInnerChnl;
import com.klht.modules.cms.service.ContentService;
import com.klht.modules.cms.service.TopicService;
import com.klht.modules.cms.vo.TreeVO;

/**
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
@RequestMapping(value = "${adminPath}/cms/topic")
public class TopicController extends BaseController{
	@Autowired
	private TopicService topicService;
	@Autowired
	private ContentService contentService;
	
	@ModelAttribute
	public Topic get(@RequestParam(required=false) Long id) {
		if (id != null){
			return topicService.get(id);
		}else{
			return new Topic();
		}
	}
	@RequiresPermissions("cms:topic:view")
	@RequestMapping(value = "tree")
	public String tree(Model model) {
		model.addAttribute("channelList", contentService.findChannelList());
		return "modules/cms/topic/channelTree";
	}
	@RequiresPermissions("cms:topic:view")
	@RequestMapping(value = "list")
	public String list(Topic topic, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Topic> page = topicService.findPage(new Page<Topic>(request, response), topic); 
        model.addAttribute("page", page);
		return "modules/cms/topic/topicList";
	}
	@RequiresPermissions("cms:topic:view")
	@RequestMapping(value = "form")
	public String form(Topic topic, HttpServletRequest request, HttpServletResponse response, Model model) {
		if(topic.getId() != null)
			topic.setTopicInnerChnlList(topicService.selectTopicInnerChnl(topic.getId()));
		model.addAttribute("topic", topic);
		return "modules/cms/topic/topicForm";
	}
	@RequiresPermissions("cms:topic:edit")
	@RequestMapping(value = "save")
	public String save(Topic topic,String audit, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		if(StringUtils.isNoneEmpty(audit) && "1".equals(audit))
			topic.setStatus(Topic.STATUS_NOT_AUDIT);
		else if(topic.getStatus() == null)
			topic.setStatus(Topic.STATUS_ADD);
		topicService.saveOrUpdate(topic);
		return "redirect:" + adminPath + "/cms/topic/list";
	}
	@RequiresPermissions("cms:topic:edit")
	@RequestMapping(value = "delete")
	public String delete(Long[] ids, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		if(ids != null && ids.length > 0){
			for (Long id : ids) {
				Topic topic = new Topic();
				topic.setId(id);
				topicService.delete(topic);
			}
		}
		addMessage(redirectAttributes, "删除专题成功");
		return "redirect:" + adminPath + "/cms/topic/list";
	}
	@RequiresPermissions("cms:topic:edit")
	@RequestMapping(value = "toAudit")
	public String toAudit(Long[] ids, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		Map map = Maps.newHashMap();
		map.put("ids", ids);
		map.put("status", Topic.STATUS_NOT_AUDIT);
		if(ids != null && ids.length > 0)
			topicService.updateStatus(map);
		addMessage(redirectAttributes, "送审专题成功");
		return "redirect:" + adminPath + "/cms/topic/list";
	}
	@RequiresUser
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(Model model) {
		List<TreeVO> list = topicService.findTopicChnlList();
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
	@RequiresPermissions("cms:topic:view")
	@RequestMapping(value = "topicContentList")
	public String topicContentList(TopicContent topicContent,Long topicId,String func, HttpServletRequest request, HttpServletResponse response, Model model) {
		topicContent.setTopicId(topicId);
		Page<TopicContent> page = topicService.findTopicContentPage(new Page<TopicContent>(request, response), topicContent); 
		List<TopicInnerChnl> topicInnerChnls = topicService.selectTopicInnerChnl(topicId);
        model.addAttribute("page", page);
        model.addAttribute("topicId", topicId);
        model.addAttribute("topicInnerChnls", topicInnerChnls);
        model.addAttribute("func", func);
		return "modules/cms/topic/topicContentList";
	}
	@RequiresPermissions("cms:topic:edit")
	@RequestMapping(value = "topicContentDelete")
	public String topicContentDelete(Long[] ids,Long topicId, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		Map map =Maps.newHashMap();
		map.put("topicId", topicId);
		map.put("contentIds", ids);
		if(ids != null && ids.length > 0)
			topicService.deleteTopicContent(map);
		return "redirect:" + adminPath + "/cms/topic/topicContentList?func=1&topicId="+topicId;
	}
	@RequiresPermissions("cms:topic:view")
	@RequestMapping(value = "contentForm")
	public String contentForm(Long topicId,Long contentId, HttpServletRequest request, HttpServletResponse response, Model model) {
		Content content = new Content();
		Long topicInnerChnl = -1L;
		if(contentId != null){
			content = contentService.get(contentId);
			ContentTxt txt = contentService.findContentTxt(content.getId());
			if(txt != null)
				content.setContentTxt(txt.getContentTxt());
			Map map = Maps.newHashMap();
			map.put("contentId", contentId);
			map.put("topicId", topicId);
			TopicContent topicContent = topicService.selectTopicContent(map);
			if(topicContent != null)
				topicInnerChnl = topicContent.getTopicInnerChnlId();
			
		}
		List<TopicInnerChnl> topicInnerChnls = topicService.selectTopicInnerChnl(topicId);
        model.addAttribute("content", content);
        model.addAttribute("topicId", topicId);
        model.addAttribute("topicName", topicService.get(topicId).getTopicTitle());
        model.addAttribute("topicInnerChnls", topicInnerChnls);
        model.addAttribute("topicInnerChnl", topicInnerChnl);
		return "modules/cms/topic/contentForm";
	}
	@RequiresPermissions("cms:topic:edit")
	@RequestMapping(value = "saveContent")
	public String saveContent(Content content,Long topicId,Long topicInnerChnlId, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		topicService.saveOrUpdateContent(content, topicId, topicInnerChnlId);;
		return "redirect:" + adminPath + "/cms/topic/topicContentList?func=1&topicId="+topicId;
	}
	@RequiresPermissions("cms:topic:view")
	@RequestMapping(value = "contentIndex")
	public String contentIndex(Long topicId,HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("topicId", topicId);
		return "modules/cms/topic/contentIndex";
	}
	@RequiresPermissions("cms:topic:view")
	@RequestMapping(value = "contentList")
	public String contentList(Content content,Long topicId,@RequestParam(required=false)Long channelId, HttpServletRequest request, HttpServletResponse response, Model model) {
		TopicContent topicContent = new TopicContent();
		if(content != null){
			topicContent.setBeginDate(content.getBeginDate());
			topicContent.setEndDate(content.getEndDate());
			topicContent.setStatus(content.getStatus());
			topicContent.setContentTitle(content.getTitle());
			topicContent.setAuthor(content.getAuthor());
		}
		topicContent.setChannelId(channelId);
		topicContent.setTopicId(topicId);
		Page<TopicContent> page = topicService.findContentPage(new Page<TopicContent>(request, response), topicContent); 
		List<TopicInnerChnl> topicInnerChnls = topicService.selectTopicInnerChnl(topicId);
        model.addAttribute("page", page);
        model.addAttribute("topicId", topicId);
        model.addAttribute("channelId", channelId);
        model.addAttribute("topicInnerChnls", topicInnerChnls);
		return "modules/cms/topic/contentList";
	}
	@RequiresPermissions("cms:topic:view")
	@RequestMapping(value = "channelTree")
	public String channelTree(Long topicId,HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("topicId", topicId);
		model.addAttribute("channelList", contentService.findChannelList());
		return "modules/cms/topic/channelTree";
	}
	@RequiresPermissions("cms:topic:edit")
	@RequestMapping(value = "toTopic")
	public String toTopic(Long[] ids,Long contentId,Long topicId,Long topicInnerChnlId,Long channelId, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		if(contentId != null){
			Map map = Maps.newHashMap();
			map.put("contentId", contentId);
			map.put("topicId", topicId);
			map.put("topicInnerChnlId", topicInnerChnlId);
			topicService.insertTopicContent(map);
		}else{
			if(ids != null && ids.length > 0){
				for (Long id : ids) {
					Map map = Maps.newHashMap();
					map.put("contentId", id);
					map.put("topicId", topicId);
					map.put("topicInnerChnlId", topicInnerChnlId);
					topicService.insertTopicContent(map);
				}
			}
		}
		String chanId = "";
		if(channelId != null) chanId = channelId.toString();
		return "redirect:" + adminPath + "/cms/topic/contentList?topicId="+topicId + "&channelId="+chanId;
	}
	@RequiresPermissions("cms:topic:view")
	@RequestMapping(value = "auditList")
	public String auditList(Topic topic, HttpServletRequest request, HttpServletResponse response, Model model) {
//		if(topic.getStatus() == null)
//			topic.setStatus(Topic.STATUS_NOT_AUDIT);
		Page<Topic> page = topicService.findAuditPage(new Page<Topic>(request, response), topic); 
		model.addAttribute("page", page);
		return "modules/cms/topic/topicAuditList";
	}
	@RequiresPermissions("cms:topic:edit")
	@RequestMapping(value = "audit")
	public String audit(Long[] ids,Long status, RedirectAttributes redirectAttributes) {
		Map map = Maps.newHashMap();
		map.put("ids", ids);
		map.put("status", status);
		if(ids != null && ids.length > 0)
			topicService.updateStatus(map);
		String handle = "";
		if(status == 3) handle = "发布";
		else if(status == 4) handle = "拒绝";
		else if(status == 5) handle = "下线";
		addMessage(redirectAttributes, handle + "广告成功");
		return "redirect:"+Global.getAdminPath()+"/cms/topic/auditList/?repage";
	}
}
