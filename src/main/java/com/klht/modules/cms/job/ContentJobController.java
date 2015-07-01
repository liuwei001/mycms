/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.job;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;
import com.klht.common.mapper.JsonMapper;
import com.klht.common.web.BaseController;
import com.klht.modules.cms.common.ResponseMessage;
import com.klht.modules.cms.common.SystemConstants;
import com.klht.modules.cms.common.http.HttpClientUtils;
import com.klht.modules.cms.service.ContentService;
import com.klht.modules.cms.vo.ContentViewVO;
import com.klht.modules.cms.vo.ImportNewsVO;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2015年6月2日      vmp         Create
 * ****************************************************************************
 * </pre>
 * @author vmp
 * @since 1.0
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/job/content")
public class ContentJobController extends BaseController{
	@Autowired
	private ContentService contentService;
	
	private final Integer dateNum = 15;
	private final String dateType = "minute";
	
	@ResponseBody
	@RequestMapping(value = "importNews")
	public ResponseMessage importNews(){
		Map dateMap = Maps.newHashMap();
		dateMap.put("dateType", dateType);
		dateMap.put("dateNum", dateNum);
		String reqUrl = SystemConstants.oms_project_url + SystemConstants.oms_importnews_url;
		List<ImportNewsVO> newslist = contentService.selectImportNews(dateMap);
		if(newslist == null || newslist.size() == 0)  return null;
		Map map = Maps.newHashMap();
		map.put("newslist", newslist);
		String reqBody = JsonMapper.getInstance().toJson(map);
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
			String resBody = HttpClientUtils.httpPost(reqUrl, reqBody);
			ResponseMessage resMsg = JSONObject.parseObject(resBody, ResponseMessage.class);
			if(!SystemConstants.RETCODE_SUCCESS.equals(resMsg.getRetCode())){
				logger.info("新闻同步OMS失败，原因：" + resMsg.getMessage() + ",时间：" + df.format(date) + "\n" + reqUrl + reqBody);
				return new ResponseMessage(resMsg.getRetCode(),"新闻同步OMS失败, 原因：" + resMsg.getMessage() + "，时间：" + df.format(date) + "\n" + reqUrl + reqBody);
			}
			return resMsg;
		}catch(Exception e){
			logger.error("新闻同步OMS异常，时间：" + df.format(date) + "\n" + reqUrl + reqBody, e);
			return new ResponseMessage(SystemConstants.RETCODE_EXCEPTION,"新闻同步OMS异常，时间：" + df.format(date) + "\n" + reqUrl + reqBody);
		}
	}
	@ResponseBody
	@RequestMapping(value = "importNews/{dateType}/{dateNum}")
	public ResponseMessage importNews(HttpServletRequest request,@PathVariable String dateType,@PathVariable Integer dateNum){
		Map dateMap = Maps.newHashMap();
		dateMap.put("dateType", dateType);
		dateMap.put("dateNum", dateNum);
		String reqUrl = SystemConstants.oms_project_url + SystemConstants.oms_importnews_url;
		List<ImportNewsVO> newslist = contentService.selectImportNews(dateMap);
		if(newslist == null || newslist.size() == 0)  return null;
		Map map = Maps.newHashMap();
		map.put("newslist", newslist);
		String reqBody = JsonMapper.getInstance().toJson(map);
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
			String resBody = HttpClientUtils.httpPost(reqUrl, reqBody);
			ResponseMessage resMsg = JSONObject.parseObject(resBody, ResponseMessage.class);
			if(!SystemConstants.RETCODE_SUCCESS.equals(resMsg.getRetCode())){
				logger.info("新闻同步OMS失败，原因：" + resMsg.getMessage() + ",时间：" + df.format(date) + "\n" + reqUrl + reqBody);
				return new ResponseMessage(resMsg.getRetCode(),"新闻同步OMS失败, 原因：" + resMsg.getMessage() + "，时间：" + df.format(date) + "\n" + reqUrl + reqBody);
			}
			return resMsg;
		}catch(Exception e){
			logger.error("新闻同步OMS异常，时间：" + df.format(date) + "\n" + reqUrl + reqBody, e);
			return new ResponseMessage(SystemConstants.RETCODE_EXCEPTION,"新闻同步OMS异常，时间：" + df.format(date) + "\n" + reqUrl + reqBody);
		}
	}
	@ResponseBody
	@RequestMapping(value = "updateNewsViews")
	public ResponseMessage updateNewsViews(){
		String reqUrl = SystemConstants.oms_project_url + SystemConstants.oms_updatenewsviews_url;
		List<ContentViewVO> newslist = contentService.selectNewsViews();
		if(newslist == null || newslist.size() == 0)  return null;
		Map map = Maps.newHashMap();
		map.put("newslist", newslist);
		String reqBody = JsonMapper.getInstance().toJson(map);
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
			String resBody = HttpClientUtils.httpPost(reqUrl, reqBody);
			ResponseMessage resMsg = JSONObject.parseObject(resBody, ResponseMessage.class);
			if(!SystemConstants.RETCODE_SUCCESS.equals(resMsg.getRetCode())){
				logger.info("新闻点击量同步OMS失败，原因：" + resMsg.getMessage() + ",时间：" + df.format(date) + "\n" + reqUrl + reqBody);
				return new ResponseMessage(resMsg.getRetCode(),"新闻点击量同步OMS失败, 原因：" + resMsg.getMessage() + "，时间：" + df.format(date) + "\n" + reqUrl + reqBody);
			}
			return resMsg;
		}catch(Exception e){
			logger.error("新闻点击量同步OMS异常，时间：" + df.format(date) + "\n" + reqUrl + reqBody, e);
			return new ResponseMessage(SystemConstants.RETCODE_EXCEPTION,"新闻点击量同步OMS异常，时间：" + df.format(date) + "\n" + reqUrl + reqBody);
		}
	}
	@ResponseBody
	@RequestMapping(value = "deleteNews")
	public ResponseMessage deleteNews(HttpServletRequest request){
		String reqBody = "";
		try{
			reqBody = IOUtils.toString(request.getInputStream());
			return deleteNews(reqBody);
		}catch(Exception e){
			logger.error("删除新闻同步OMS异常\n" + SystemConstants.oms_project_url + SystemConstants.oms_deletenews_url + reqBody, e);
			return new ResponseMessage(SystemConstants.RETCODE_EXCEPTION,"删除新闻同步OMS异常\n" + SystemConstants.oms_project_url + SystemConstants.oms_deletenews_url + reqBody);
		}
		
	}
	public static ResponseMessage deleteNews(List<Long> ids){
		if(ids == null || ids.size() == 0)  return null;
		Map map = Maps.newHashMap();
		map.put("ids", ids);
		String reqBody = JsonMapper.getInstance().toJson(map);
		return deleteNews(reqBody);
	}
	public static ResponseMessage deleteNews(String reqBody){
		String reqUrl = SystemConstants.oms_project_url + SystemConstants.oms_deletenews_url;
		try{
			String resBody = HttpClientUtils.httpPost(reqUrl, reqBody);
			ResponseMessage resMsg = JSONObject.parseObject(resBody, ResponseMessage.class);
			if(!SystemConstants.RETCODE_SUCCESS.equals(resMsg.getRetCode())){
				return new ResponseMessage(resMsg.getRetCode(),"删除新闻同步OMS失败, 原因：" + resMsg.getMessage() + "\n" + reqUrl + reqBody);
			}
			return resMsg;
		}catch(Exception e){
			return new ResponseMessage(SystemConstants.RETCODE_EXCEPTION,"删除新闻同步OMS异常\n" + reqUrl + reqBody);
		}
	}
}
