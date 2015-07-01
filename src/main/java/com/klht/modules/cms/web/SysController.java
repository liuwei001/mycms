/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.klht.common.web.BaseController;
import com.klht.modules.cms.service.SysService;
import com.klht.modules.cms.vo.AreaVO;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2015年5月19日      vmp         Create
 * ****************************************************************************
 * </pre>
 * @author vmp
 * @since 1.0
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/sys")
public class SysController extends BaseController{
	@Autowired
	private SysService sysService;
	@ResponseBody
	@RequestMapping(value = "area/findByParent")
	public List findByParent(String parentId, Model model) {
		AreaVO area = new AreaVO();
		area.setParentId(parentId);
		return sysService.findArea(area);
	}
}
