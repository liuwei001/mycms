<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品分类管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				rules: {
					code: {
						remote: {
							 url: "${ctx}/cms/classify/checkCode", 
							 type: "post", 
							 dataType: "json",
							 data:  { 
								 oldCode: function() {   
	                             	return $("#oldCode").val();   
								 }, 
							     type: function(){
								 	return $("#type").val();
							     }
	                         }   
						}
					},
					name: {
						remote: {
							 url: "${ctx}/cms/classify/checkName", 
							 type: "post", 
							 dataType: "json",
							 data:  { 
								 oldName: function() {   
	                             	return $("#oldName").val();   
								 }, 
							     type: function(){
								 	return $("#type").val();
							     }
	                         }   
						}
					}
// 					,sort:{
// 						max:100
// 					}
				},
				messages: {
					code: {remote: "分类编码已存在"},
					name: {remote: "分类名称已存在"}
// 					,sort:{max : "排序不能大于100"}
				},
				submitHandler: function(form){
					if($("#parentId").val() == ""){
						top.$.jBox.tip('请选择上级分类','warning');
					}else{
						loading('正在提交，请稍等...');
						form.submit();
					}
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
		<li><a href="${ctx}/cms/classify?type=${type}">${rootName}分类列表</a></li>
		<li class="active"><a href="${ctx}/cms/classify/form?id=${classify.id}&type=${type}">${rootName}分类<shiro:hasPermission name="cms:classify:edit">${not empty classify.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:classify:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="classify" action="${ctx}/cms/classify/save?type=${type}" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="type"/>
		<input type="hidden" id="oldCode" value="${classify.code }">
		<input type="hidden" id="oldName" value="${classify.name }">
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">分类名:</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上级分类:</label>
			<div class="controls">
                <sys:treeselect id="parent" name="parentId" value="${classify.parentId}" labelName="parentName" labelValue="${classify.parentName}"
					title="上级分类"  url="/cms/classify/treeData?type=${type}" extId="${classify.id}"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">分类编码:</label>
			<div class="controls">
				<form:input path="code" htmlEscape="false" maxlength="8" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">分类排序:</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="50" class="input-xlarge digits required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">关键字:</label>
			<div class="controls">
				<form:input path="keywords" htmlEscape="false" maxlength="10" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否显示:</label>
			<div class="controls">
				<form:radiobuttons path="isShow" items="${fns:getDictList('yes_no')}"  itemValue="value" class="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注:</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cms:classify:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>