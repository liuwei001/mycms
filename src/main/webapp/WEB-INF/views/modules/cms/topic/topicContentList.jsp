<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>分类属性管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#searchForm").validate({
				submitHandler: function(form){
					if ($("#beginDate").val() != '' && $("#endDate").val() != '' && $("#beginDate").val() > $("#endDate").val()){
	                    top.$.jBox.tip('开始日期不能大于结束日期','warning');
	                    return;
	                }
					if($("#beginDate").val() != '')
						$("#beginDate").val($("#beginDate").val() + " 00:00:00");
					if($("#endDate").val() != '')
						$("#endDate").val($("#endDate").val() + " 23:59:59");
					form.submit();
				}
			});
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		function selectAll(){
	    	var checklist=document.getElementsByName("ids");
	       	if (document.getElementById("checkAll").checked) {
	   			for (var i = 0; i < checklist.length; i++) {
	   				checklist[i].checked = 1;
	   			}
	   		} else {
	   			for (var j = 0; j < checklist.length; j++) {
	   				checklist[j].checked = 0;
	   			}
	   		}
	    }
		function topicContentDelete(){
			if($("#listForm input[name='ids']:checked").length ==0){
				top.$.jBox.tip("请选择新闻");
				return;
			}
			loading('正在提交，请稍等...');
	    	$("#listForm").attr("action", "${ctx}/cms/topic/topicContentDelete?topicId=${topicId}");
	    	$("#listForm").submit();
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<c:if test="${func != null && func == '1' }">
			<li class="active"><a href="${ctx}/cms/topic/topicContentList?topicId=${topicId}&func=1">专题新闻列表</a></li>
			<shiro:hasPermission name="cms:topic:edit">
				<li><a href="${ctx}/cms/topic/contentForm?topicId=${topicId}">专题新闻添加</a></li>
				<li><a href="${ctx}/cms/topic/contentIndex?topicId=${topicId}">添加现有新闻</a></li>
			</shiro:hasPermission>
			<li><a href="${ctx}/cms/topic/list">返回专题列表</a></li>
		</c:if>
		<c:if test="${func != null && func == '2' }">
			<li class="active"><a href="${ctx}/cms/topic/topicContentList?topicId=${topicId}&func=2">专题新闻列表</a></li>
			<li><a href="${ctx}/cms/topic/auditList">返回专题列表</a></li>	
		</c:if>
		<c:if test="${func != null && func == '3' }">
			<li class="active"><a href="${ctx}/cms/topic/topicContentList?topicId=${topicId}&func=3">专题新闻列表</a></li>
			<li><a href="${ctx}/cms/topic/list">返回专题列表</a></li>
		</c:if>
	</ul>
	<form:form id="searchForm" modelAttribute="topicContent" action="${ctx}/cms/topic/topicContentList?topicId=${topicId}&func=${func }" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
			<label>新闻标题：</label><form:input path="contentTitle" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
			<label>专题内部分类：</label>
			<select name="topicInnerChnlId" class="input-small">
				<option value="-1">全部</option>
				<c:forEach items="${topicInnerChnls}" var="tpl">
					<option value="${tpl.id }" <c:if test="${tpl.id eq topicContent.topicInnerChnlId }">selected="selected"</c:if>>${tpl.name }</option>
				</c:forEach>
			</select>&nbsp;
			<label>添加日期：&nbsp;</label><input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${topicContent.beginDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			<label>&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${topicContent.endDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>&nbsp;&nbsp;
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
	</form:form>
	<sys:message content="${message}"/>
	<form id="listForm" method="post">
		<c:if test="${func != null && func == '1' }">
		<shiro:hasPermission name="cms:bid:edit">
			<div style="margin-left: 10px; margin-bottom: 10px;">
				<input id="btnDelete" class="btn btn-primary" type="button" onclick="return confirmx('确定要批量移除吗？', topicContentDelete);" value="批量移除"/>
			</div>
		</shiro:hasPermission>
		</c:if>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead><tr>
			<c:if test="${func != null && func == '1' }">
				<shiro:hasPermission name="cms:topic:edit">
					<th style="text-align: center; "><input type="checkbox" id="checkAll" onclick="selectAll();"></th>
				</shiro:hasPermission>
			</c:if>
				<th>新闻标题</th>
			<th>专题内部分类</th>
			<th>添加日期</th>
			<th>操作</th></tr></thead>
			<tbody>
			<c:forEach items="${page.list}" var="tpl">
				<tr>
					<c:if test="${func != null && func == '1' }">
					<shiro:hasPermission name="cms:topic:edit">
						<td style="text-align: center; ">
<%-- 							<c:if test="${tpl.status eq 1 or tpl.status eq 4}"> --%>
								<input type="checkbox" value="${tpl.contentId}" name="ids">
<%-- 							</c:if> --%>
						</td>
					</shiro:hasPermission>
					</c:if>
					<td>${tpl.contentTitle}</td>
					<td>${tpl.topicInnerChnlName}</td>
					<td><fmt:formatDate value="${tpl.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>
						<a href="${ctx}/cms/content/view?id=${tpl.contentId}" target="_blank">预览</a>
						<c:if test="${func != null && func == '1' }">
							<shiro:hasPermission name="cms:topic:edit">
								<a href="${ctx}/cms/topic/topicContentDelete?ids=${tpl.contentId}&topicId=${topicId}" onclick="return confirmx('要移除该新闻吗？', this.href)">移除</a>
								<c:if test="${tpl.channelId eq -1 }">
									<a href="${ctx}/cms/topic/contentForm?contentId=${tpl.contentId}&topicId=${topicId}">修改</a>
								</c:if>
							</shiro:hasPermission>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</form>
	<div class="pagination">${page}</div>
</body>
</html>