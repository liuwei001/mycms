/* 
 * Copyright (c) 2015, QUANRONG E-COMMDERCE LTD. All rights reserved.
 */
package com.qr.ecomm.common.supcan.freeform;

import com.qr.ecomm.common.supcan.common.Common;
import com.qr.ecomm.common.supcan.common.properties.Properties;
import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 硕正FreeForm
 * @author WangZhen
 * @version 2013-11-04
 */
@XStreamAlias("FreeForm")
public class FreeForm extends Common {

	public FreeForm() {
		super();
	}
	
	public FreeForm(Properties properties) {
		this();
		this.properties = properties;
	}
	
}
