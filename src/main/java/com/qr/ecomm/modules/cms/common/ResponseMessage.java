package com.qr.ecomm.modules.cms.common;


/**
 * http请求响应对象统一格式，响应时将会被转换成json格式返回
 * 描述：
 *
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2015年4月29日      vmp         Create
 * ****************************************************************************
 * </pre>
 * @author vmp
 * @since 1.0
 */
public class ResponseMessage {

	/**
	 * 返回编码
	 */
	private String retCode; 

	/**
	 * 返回信息
	 */
	private String message;
	
	/**
	 * 响应对象
	 */
	private Object result;
	
	public ResponseMessage(){}
	
	public ResponseMessage(String retCode, String message){
		this.retCode = retCode;
		this.message = message;
	}
	
	public String getRetCode() {
		return retCode;
	}

	public void setRetCode(String retCode) {
		this.retCode = retCode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getResult() {
		return result;
	}

	public void setResult(Object result) {
		this.result = result;
	}

}
