/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.common.filter;

import com.qr.ecomm.common.utils.CacheUtils;

import net.sf.ehcache.CacheManager;
import net.sf.ehcache.constructs.web.filter.SimplePageCachingFilter;

/**
 * 页面高速缓存过滤器
 * @author qr
 * @version 2013-8-5
 */
public class PageCachingFilter extends SimplePageCachingFilter {

	@Override
	protected CacheManager getCacheManager() {
		return CacheUtils.getCacheManager();
	}
	
}
