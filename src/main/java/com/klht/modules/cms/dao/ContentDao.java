/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.klht.modules.cms.dao;

import java.util.List;
import java.util.Map;

import com.klht.common.persistence.annotation.LongMyBatisDao;
import com.klht.common.persistence.longid.LCrudDao;
import com.klht.modules.cms.entity.Content;
import com.klht.modules.cms.entity.ContentTxt;
import com.klht.modules.cms.entity.Tag;
import com.klht.modules.cms.vo.ContentViewVO;
import com.klht.modules.cms.vo.ImportNewsVO;
import com.klht.modules.cms.vo.TreeVO;

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
