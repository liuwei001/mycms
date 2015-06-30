/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.modules.cms.dao;

import java.util.List;
import java.util.Map;

import com.qr.ecomm.common.persistence.annotation.LongMyBatisDao;
import com.qr.ecomm.common.persistence.longid.LCrudDao;
import com.qr.ecomm.modules.cms.entity.Content;
import com.qr.ecomm.modules.cms.entity.ContentTxt;
import com.qr.ecomm.modules.cms.entity.Tag;
import com.qr.ecomm.modules.cms.vo.ContentViewVO;
import com.qr.ecomm.modules.cms.vo.ImportNewsVO;
import com.qr.ecomm.modules.cms.vo.TreeVO;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2015年4月29日     xc         Create
 * ****************************************************************************
 * </pre>
 * @author xc
 * @since 1.0
 */
@LongMyBatisDao
public interface ContentDao extends LCrudDao<Content>{
	public void updateStatus(Map  map);
	
//	public List findChannelList();
//	public TreeVO findChannel(Long channelId);
	
	public ContentTxt selectContentTxt(Long contentId);
	public void insertContentTxt(ContentTxt contentTxt);
	public void updateContentTxt(ContentTxt contentTxt);
	
	public Tag selectTag(String tagName);
	public void insertTag(Tag tag);
	
	public void deleteContentTag(Long contentId);
	public void insertContentTag(Map map);
	
	public List<Content> findAuditList(Content content);
	
	public List<ImportNewsVO> selectImportNews(Map map);
	public List<ContentViewVO> selectNewsViews();
}
