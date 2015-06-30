/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.service;

import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;
import com.qr.ecomm.common.service.CrudService;
import com.qr.ecomm.common.service.LCrudService;
import com.qr.ecomm.common.utils.StringUtils;
import com.qr.ecomm.modules.cms.dao.ClassifyDao;
import com.qr.ecomm.modules.cms.entity.Classify;

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
@Service
@Transactional(readOnly = true)
public class ClassifyService extends LCrudService<ClassifyDao, Classify>{
	@Transactional(readOnly = false)
	public void saveOrUpdate(Classify classify) {
		if (classify.getId() == null) {
			classify.preInsert();
			dao.insert(classify);
			classifyPathIdAndName(classify);
			dao.update(classify);
		} else {
			classifyPathIdAndName(classify);
			classify.preUpdate();
			dao.update(classify);
		}
		
	}
	public void delete(Classify classify){
		super.delete(classify);
		switch(classify.getType()){
			case Classify.TYPE_CONTENT:
				dao.deleteContent(classify.getId()); break;
			case Classify.TYPE_TOPIC:
				dao.deleteTopic(classify.getId()); break;
			case Classify.TYPE_EXHIBITION:
				dao.deleteExhibition(classify.getId()); break;
			case Classify.TYPE_ADVERT:
				dao.deleteAdvert(classify.getId());
				dao.deleteAdPlace(classify.getId());
				break;
		}
	}
	private void classifyPathIdAndName(Classify classify){
		String id = "";
		String name = "";
		Long superId = classify.getParentId();
		while(superId != null && superId != 0){
			Classify gc = dao.get(superId);
			if(gc == null) break;
			id = gc.getId() + "/" + id;
			name = gc.getName() + "/" + name;
			superId = gc.getParentId();
		}
		id = id + classify.getId();
		name = name + classify.getName();
		if(StringUtils.isNotEmpty(id))
			classify.setPathId(id);
		if(StringUtils.isNotEmpty(name))
			classify.setPathName(name);
	}
	public void updateSort(String id, String sort){
		Map<String, String> map = Maps.newHashMap();
		map.put("id", id);
		map.put("sort", sort);
		dao.updateSort(map);
	}
}
