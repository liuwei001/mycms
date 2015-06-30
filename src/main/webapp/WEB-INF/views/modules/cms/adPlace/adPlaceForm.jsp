<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>广告位管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					if($("#adTypeId").val() == ""){
						top.$.jBox.tip('请选择广告分类','warning');
					}else if($("#placePixelX").val() <= 0 || $("#placePixelY").val() <= 0){
						top.$.jBox.tip('广告像素应大于0','warning');
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
		<li><a href="${ctx}/cms/adPlace/">广告位列表</a></li>
		<li class="active"><a href="${ctx}/cms/adPlace/form?id=${adPlace.id}">广告位<shiro:hasPermission name="cms:adPlace:edit">${not empty adPlace.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:adPlace:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="adPlace" action="${ctx}/cms/adPlace/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">广告位名称：</label>
			<div class="controls">
				<form:input path="placeName" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">广告位位置示意图：</label>
			<div class="controls">
				<form:hidden id="placeDemoImg" path="placeDemoImg" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="placeDemoImg" type="thumb" uploadPath="/ad" selectMultiple="false" maxWidth="100" maxHeight="100"/>
<!-- 				<span class="help-inline"><font color="red">*</font> </span> -->
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否允许会员订购：</label>
			<div class="controls">
				<form:radiobuttons path="isCanOrder" items="${fns:getDictList('yes_no')}"  itemValue="value" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否限制数量：</label>
			<div class="controls">
				<form:radiobuttons path="isLimitAdNum" items="${fns:getDictList('yes_no')}"  itemValue="value" class="required" onchange="javascript:if($('input[name=\"isLimitAdNum\"]:checked').val()==1) $('#maxAdNumDiv').show();else  $('#maxAdNumDiv').hide();"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" id="maxAdNumDiv" <c:if test="${adPlace.isLimitAdNum == null || adPlace.isLimitAdNum eq 0 }"> style="display: none;"</c:if>>
			<label class="control-label">同时投放最多广告数：</label>
			<div class="controls">
				<form:input path="maxAdNum" htmlEscape="false" maxlength="18" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">广告类别：</label>
			<div class="controls">
				<form:select path="adTypeId" class="input-small">
					<c:forEach items="${addTypeList}" var="tpl">
						<option <c:if test="${tpl.id eq adPlace.adTypeId }">selected="selected"</c:if>value="${tpl.id }" >${tpl.name }</option>
					</c:forEach>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">广告位像素规格：</label>
			<div class="controls">
				<form:input path="placePixelX" htmlEscape="false" maxlength="18" class="input-small required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
				X
				<form:input path="placePixelY" htmlEscape="false" maxlength="18" class="input-small required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">价格：</label>
			<div class="controls">
				<form:input path="placePrice" htmlEscape="false" maxlength="18" class="input-xlarge  digits"/>
				<span class="help-inline"><font>0代表免费，不填写代码价格面议</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">广告位描述：</label>
			<div class="controls">
				<form:textarea path="placeDesc" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">默认广告代码：</label>
			
			<div class="controls">
				<form:textarea path="defaultAdScript" htmlEscape="false" rows="8" maxlength="200" class="input-xxlarge"/>
				<div>
					<input id="btnRun" class="btn" type="button" value="运行代码" onclick="javascript:window.showModalDialog('${ctx}/cms/adPlace/defaultAdScript?defaultAdScript='+$('#defaultAdScript').val(),'','dialogHeight:'+$('#placePixelY').val()+'px;dialogWidth:'+$('#placePixelX').val()+';status=no;location=no;');"/>
					<span class="help-inline"><font>注：当广告位下无广告时，显示此代码，支持html、css、js 如果广告位采用js调用，此处不建议使用js代码</font> </span>
				</div>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cms:adPlace:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>