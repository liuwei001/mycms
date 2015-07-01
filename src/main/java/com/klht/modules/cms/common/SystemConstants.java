/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.common;

import com.klht.common.config.Global;

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
public class SystemConstants {
	/**接口返回格式定义**/
	public static final String RETCODE_SUCCESS = "000000";
	
	public static final String RETCODE_EXCEPTION = "111111";
	
	public static final String RETCODE_NAME = "retCode";
	
	public static final String RETCODE_RESULT = "result";
	
	/** oms接口路径**/
	public static final String oms_project_url = Global.getConfig("oms.project.url");
	
	public static final String oms_importnews_url = "/importnews";
	public static final String oms_updatenewsviews_url = "/updatenewsviews";
	public static final String oms_deletenews_url = "/deletenews";
}
