/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.common.utils.os;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2015年5月13日      xzyeah         Create
 * ****************************************************************************
 * </pre>
 * @author xzyeah
 * @since 1.0
 */
/**
 * 平台
 * @author isea533
 */
public enum EPlatform {
	Any("any"),
	Linux("Linux"),
	Mac_OS("Mac OS"),
	Mac_OS_X("Mac OS X"),
	Windows("Windows"),
	OS2("OS/2"),
	Solaris("Solaris"),
	SunOS("SunOS"),
	MPEiX("MPE/iX"),
	HP_UX("HP-UX"),
	AIX("AIX"),
	OS390("OS/390"),
	FreeBSD("FreeBSD"),
	Irix("Irix"),
	Digital_Unix("Digital Unix"),
	NetWare_411("NetWare"),
	OSF1("OSF1"),
	OpenVMS("OpenVMS"),
	Others("Others");
	
	private EPlatform(String desc){
		this.description = desc;
	}
	
	public String toString(){
		return description;
	}
	
	private String description;
}
