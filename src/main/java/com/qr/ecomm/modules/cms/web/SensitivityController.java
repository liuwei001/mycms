/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.qr.ecomm.common.beanvalidator.BeanValidators;
import com.qr.ecomm.common.config.Global;
import com.qr.ecomm.common.persistence.Page;
import com.qr.ecomm.common.utils.StringUtils;
import com.qr.ecomm.common.utils.excel.ExportExcel;
import com.qr.ecomm.common.utils.excel.ImportExcel;
import com.qr.ecomm.common.web.BaseController;
import com.qr.ecomm.modules.cms.entity.Classify;
import com.qr.ecomm.modules.cms.entity.Sensitivity;
import com.qr.ecomm.modules.cms.service.SensitivityService;

/**
 * 敏感词Controller
 * @author yy
 * @version 2015-05-05
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/sensitivity")
public class SensitivityController extends BaseController {

	@Autowired
	private SensitivityService sensitivityService;
	
	@ModelAttribute
	public Sensitivity get(@RequestParam(required=false) Long id) {
		Sensitivity entity = null;
		if (id!=null){
			entity = sensitivityService.get(id);
		}
		if (entity == null){
			entity = new Sensitivity();
		}
		return entity;
	}
	
	@RequiresPermissions("cms:sensitivity:view")
	@RequestMapping(value = {"list", ""})
	public String list(Sensitivity sensitivity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Sensitivity> page = sensitivityService.findPage(new Page<Sensitivity>(request, response), sensitivity); 
		model.addAttribute("page", page);
		return "modules/cms/sensitivity/sensitivityList";
	}

	@RequiresPermissions("cms:sensitivity:view")
	@RequestMapping(value = "form")
	public String form(Sensitivity sensitivity, Model model) {
		model.addAttribute("sensitivity", sensitivity);
		return "modules/cms/sensitivity/sensitivityForm";
	}

	@RequiresPermissions("cms:sensitivity:edit")
	@RequestMapping(value = "save")
	public String save(Sensitivity sensitivity, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sensitivity)){
			return form(sensitivity, model);
		}
		sensitivityService.save(sensitivity);
		addMessage(redirectAttributes, "保存敏感词成功");
		return "redirect:"+Global.getAdminPath()+"/cms/sensitivity/?repage";
	}
	
	@RequiresPermissions("cms:sensitivity:edit")
	@RequestMapping(value = "delete")
	public String delete(Sensitivity sensitivity, RedirectAttributes redirectAttributes) {
		sensitivityService.delete(sensitivity);
		addMessage(redirectAttributes, "删除敏感词成功");
		return "redirect:"+Global.getAdminPath()+"/cms/sensitivity/?repage";
	}
	
	@RequiresPermissions("cms:sensitivity:edit")
	@RequestMapping(value = "subDelete")
	public String subDelete(String ids, RedirectAttributes redirectAttributes) {
		String[] idList = ids.split(",");
		sensitivityService.delete(idList);
		addMessage(redirectAttributes, "删除"+idList.length+"个敏感词成功");
		return "redirect:"+Global.getAdminPath()+"/cms/sensitivity/?repage";
	}
	@ResponseBody
	@RequiresPermissions("cms:sensitivity:edit")
	@RequestMapping(value = "checkSensitivity")
	public String checkSensitivity(String sensitivity,String oldSensitivity){
		if(StringUtils.isEmpty(sensitivity)) return "false";
		if(StringUtils.isEmpty(oldSensitivity)){
			if(sensitivityService.checkName(sensitivity))
				return "false";
		}else{
			if(oldSensitivity.equals(sensitivity)) return "true";
			if(sensitivityService.checkName(sensitivity))
				return "false";
		}
		return "true";
	}
//********************************************************************************************************************	
		/**
		 * 导入
		 * @param file
		 * @param redirectAttributes
		 * @return
		 */
		@RequiresPermissions("cms:sensitivity:edit")
	    @RequestMapping(value = "import", method=RequestMethod.POST)
	    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
			try {
				int successNum = 0;
				int failureNum = 0;
				StringBuilder failureMsg = new StringBuilder();
				ImportExcel ei = new ImportExcel(file, 1, 0);
				List<Sensitivity> list = ei.getDataList(Sensitivity.class);
				for (Sensitivity sensitivity  : list){
					try{
						if (!sensitivityService.checkName(sensitivity.getSensitivity())){
							BeanValidators.validateWithException(validator, sensitivity);
							sensitivityService.save(sensitivity);
							successNum++;
						}else{
							failureMsg.append("<br/>敏感词 "+sensitivity.getSensitivity()+" 已存在; ");
							failureNum++;
						}
					}catch(ConstraintViolationException ex){
						failureMsg.append("<br/>敏感词 "+sensitivity.getSensitivity()+" 导入失败：");
						List<String> messageList = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
						for (String message : messageList){
							failureMsg.append(message+"; ");
							failureNum++;
						}
					}catch (Exception ex) {
						failureMsg.append("<br/>敏感词 "+sensitivity.getSensitivity()+" 导入失败："+ex.getMessage());
					}
				}
				if (failureNum>0){
					failureMsg.insert(0, "，失败 "+failureNum+" 条敏感词，导入信息如下：");
				}
				addMessage(redirectAttributes, "已成功导入 "+successNum+" 条敏感词"+failureMsg);
			} catch (Exception e) {
				addMessage(redirectAttributes, "导入敏感词失败！失败信息："+e.getMessage());
			}
			return "redirect:" + Global.getAdminPath() + "/cms/sensitivity/?repage";
	    }
		
		/**
		 * 下载导入用户数据模板
		 * @param response
		 * @param redirectAttributes
		 * @return
		 */
		@RequiresPermissions("cms:sensitivity:edit")
	    @RequestMapping(value = "import/template")
	    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
			try {
	            String fileName = "敏感词模板.xlsx";
	    		List<Sensitivity> list = Lists.newArrayList();
//	    		new ExportExcel("用户数据", CmsTbSensitivity.class, 2).setDataList(list).write(response, fileName).dispose();
	    		new ExportExcel("敏感词", Sensitivity.class, 2).write(response, fileName).dispose();
	    		return null;
			} catch (Exception e) {
				e.printStackTrace();
				addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
			}
//			return "redirect:" + Global.getAdminPath() + "/cms/sensitivity/?repage";
			return null;
	    }
}