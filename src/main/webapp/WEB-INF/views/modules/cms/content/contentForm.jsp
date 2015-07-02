<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品分类管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate({
				submitHandler: function(form){
					if (CKEDITOR.instances.contentTxt.getData()==""){
                        top.$.jBox.tip('请填写新闻内容','warning');
                        return;
                    }
					var isUrl =  /^((https?|ftp|news):\/\/)?([a-z]([a-z0-9\-]*[\.。])+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)|(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))(\/[a-z0-9_\-\.~]+)*(\/([a-z0-9_\-\.]*)(\?[a-z0-9+_\-\.%=&]*)?)?(#[a-z][a-z0-9_]*)?$/;
				    var originUrl = $("#originUrl").val();
				    if(originUrl != "" && !isUrl.test(originUrl)){
				    	top.$.jBox.tip('请输入正确的来源url','warning');
						$("#originUrl").focus();
                        return;
				    }
					
                   	if($("#inputForm").attr("target") != "_blank"){
						loading('正在提交，请稍等...');
						$('#btnSubmit').attr('disabled',true);
						$('#btnAudit').attr('disabled',true);
                   	}
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
		function view(){
			$("#inputForm").attr("action", "${ctx}/cms/content/view?chanId=${chanId}");
			$("#inputForm").attr("target","_blank");
			$("#inputForm").submit();
			
			$("#inputForm").attr("action", "${ctx}/cms/content/save?chanId=${chanId}");
			$("#inputForm").attr("target","");
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/cms/content/list?chanId=${chanId}">新闻列表</a></li>
		<li class="active"><a href="${ctx}/cms/content/form?id=${content.id}&chanId=${chanId}">新闻<shiro:hasPermission name="cms:content:edit">${not empty content.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:content:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="content" action="${ctx}/cms/content/save?chanId=${chanId}" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="channelId" value="${channelId }"/>
		<form:hidden path="type" value="0"/>
		<form:hidden path="status"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">新闻所属分类:</label>
			<div class="controls">
				<label style="padding-top:3px;">${content.channelPathName }</label>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">新闻辅类:</label>
			<div class="controls">
				<form:select path="extChnlId" class="input-xlarge">
					<form:option value="">请选择</form:option>
					<form:options items="${fns:getDictList('cms_content_extchnl')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">新闻标题:</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>			
		</div>
		
		<div class="control-group">
			<label class="control-label">新闻副标题:</label>
			<div class="controls">
				<form:input path="shortTitle" htmlEscape="false" maxlength="30" class="input-xlarge"/>				
			</div>			
		</div>		
		<div class="control-group">
			<label class="control-label">标题图片:</label>
			<div class="controls">
 				<form:hidden id="titleImg" path="titleImg" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="titleImg" type="thumb" uploadPath="/content" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">新闻作者:</label>
			<div class="controls">
				<form:input path="author" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label ">新闻来源:</label>
			<div class="controls ">
				<form:input path="origin" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
		<label class="control-label">来源URL:</label>
			<div class="controls ">
				<form:input path="originUrl" htmlEscape="false" maxlength="100" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">新闻标签:</label>
			<div class="controls">
				<form:input path="tags" htmlEscape="false" maxlength="50" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否推荐:</label>
			<div class="controls">
				<form:radiobuttons path="isRecommand" items="${fns:getDictList('yes_no')}"  itemValue="value" class="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">新闻简介:</label>
			<div class="controls">
				<form:textarea path="description" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">新闻内容:</label>
			<div class="controls">
				<form:textarea id="contentTxt" htmlEscape="true" path="contentTxt" rows="4" maxlength="200" class="input-xxlarge"/>
				<sys:ckeditor replace="contentTxt" uploadPath="/content" />
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cms:content:edit">
				<input type="hidden" id="audit" name="audit" value="0"/>
				<input id="btnSubmit" class="btn btn-primary" type="button" value="保 存" onclick="javascript:$('#audit').val('0');$('#inputForm').submit();"/>&nbsp;
				<input id="btnAudit" class="btn btn-primary" type="button" value="送审" onclick="javascript:$('#audit').val('1');$('#inputForm').submit();"/>&nbsp;
			</shiro:hasPermission>
			<input id="btnView" class="btn btn-primary" type="button" value="预览" onclick="view()"/>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>