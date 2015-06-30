<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>敏感词管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate({
				rules: {
					sensitivity: {
						remote: {
							 url: "${ctx}/cms/sensitivity/checkSensitivity", 
							 type: "post", 
							 dataType: "json",
							 data:  { 
								 oldSensitivity: function() {   
	                             	return $("#oldSensitivity").val();   
								 }
	                         }   
						}
					},
					replacement: {
						remote: {
							 url: "${ctx}/cms/sensitivity/checkSensitivity", 
							 type: "post", 
							 dataType: "json",
							 data:  { 
								 oldSensitivity: function() {   
	                             	return $("#oldSensitivity").val();   
								 },
								 sensitivity: function() {   
		                             	return $("#replacement").val();   
								}
	                         }   
						}
					}
				},
				messages: {
					sensitivity: {remote: "敏感词已存在"},
					replacement: {
						remote: "替换词不能为敏感词"
					}
				},
				submitHandler: function(form){
					if($("#replacement").val() == $("#sensitivity").val()){
						top.$.jBox.tip('替换词不能和敏感词相同','warning');
						return;
					}
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/cms/sensitivity/">敏感词列表</a></li>
		<li class="active"><a href="${ctx}/cms/sensitivity/form?id=${sensitivity.id}">敏感词<shiro:hasPermission name="cms:sensitivity:edit">${not empty sensitivity.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:sensitivity:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="sensitivity" action="${ctx}/cms/sensitivity/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<input type="hidden" id="oldSensitivity" value="${sensitivity.sensitivity }">
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">敏感词：</label>
			<div class="controls">
				<form:input path="sensitivity" htmlEscape="false" maxlength="10" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">替换词：</label>
			<div class="controls">
				<form:input path="replacement" htmlEscape="false" maxlength="10" class="input-xlarge"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cms:sensitivity:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>