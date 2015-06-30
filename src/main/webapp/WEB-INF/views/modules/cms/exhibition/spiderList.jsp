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
		function batDelete(){
			if($("#listForm input[name='ids']:checked").length ==0){
				top.$.jBox.tip("请选择展会");
				return;
			}
			loading('正在提交，请稍等...');
	    	$("#listForm").attr("action", "${ctx}/cms/exhibition/delete?channelId=${channelId}&type=1");
	    	$("#listForm").submit();
		}
		function batAudit() {
			if($("#listForm input[name='ids']:checked").length ==0){
				top.$.jBox.tip("请选择展会");
				return;
			}
			loading('正在提交，请稍等...');
	    	$("#listForm").attr("action", "${ctx}/cms/exhibition/toAudit?channelId=${channelId}&type=1");
	    	$("#listForm").submit();
    	}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/exhibition/spiderList">展会列表</a></li>
<%-- 		<shiro:hasPermission name="cms:exhibition:edit"> --%>
<%-- 			<li><a href="${ctx}/cms/exhibition/spiderForm">展会添加</a></li> --%>
<%-- 		</shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="exhibition" action="${ctx}/cms/exhibition/spiderList" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
<!-- 		<div> -->
			<label>展会标题：</label><form:input path="title" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
			<label>审核状态：</label>
			<form:select path="status" class="input-small">
				<form:option value="-1">全部</form:option>
				<form:options items="${fns:getDictList('cms_audit_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</form:select>&nbsp;
		</div>
<!-- 		<div style="margin-top:8px;"> -->
			<label>展会日期：&nbsp;</label><input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${exhibition.beginDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			<label>&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${exhibition.endDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>&nbsp;&nbsp;
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
<!-- 		</div> -->
	</form:form>
	<sys:message content="${message}"/>
	<form id="listForm" method="post">
		<shiro:hasPermission name="cms:exhibition:edit">
			<div style="margin-left: 10px; margin-bottom: 10px;">
				<input id="btnAudit" class="btn btn-primary" type="button" onclick="return confirmx('确定要批量送审吗？', batAudit);" value="批量送审"/>
				<input id="btnDelete" class="btn btn-primary" type="button" onclick="return confirmx('确定要批量删除吗？', batDelete);" value="批量删除"/>
			</div>
		</shiro:hasPermission>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead><tr>
				<shiro:hasPermission name="cms:exhibition:edit">
					<th style="text-align: center; "><input type="checkbox" id="checkAll" onclick="selectAll();"></th>
				</shiro:hasPermission>
			<th>展会标题</th>
			<th>审核状态</th>
			<th>开始日期</th><th>结束日期</th><th>操作</th></tr></thead>
			<tbody>
			<c:forEach items="${page.list}" var="tpl">
				<tr>
					<shiro:hasPermission name="cms:exhibition:edit">
						<td style="text-align: center; ">
							<c:if test="${tpl.status eq 1 or tpl.status eq 4 or tpl.status eq 5}">
								<input type="checkbox" value="${tpl.id}" name="ids">
							</c:if>
						</td>
					</shiro:hasPermission>
					<td>${tpl.title}</td>
					<td>
	 					${fns:getDictLabel(tpl.status, "cms_audit_status", "")}
					</td>
					<td><fmt:formatDate value="${tpl.startDate}" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${tpl.endDate}" pattern="yyyy-MM-dd"/></td>
					<td>
						<a href="${ctx}/cms/exhibition/view?id=${tpl.id}" target="_blank">预览</a>
						<shiro:hasPermission name="cms:exhibition:edit">
							<c:choose>
							    <c:when test="${tpl.status eq 1 or tpl.status eq 4 or tpl.status eq 5}">
										<a href="${ctx}/cms/exhibition/toAudit?ids=${tpl.id}&type=1" onclick="return confirmx('确定要送审吗？', this.href)">送审</a>
										<a href="${ctx}/cms/exhibition/spiderForm?id=${tpl.id}">修改</a>
										<a href="${ctx}/cms/exhibition/delete?ids=${tpl.id}&type=1" onclick="return confirmx('要删除该新闻吗？', this.href)">删除</a>
								</c:when>
							    <c:otherwise>
							    	<span style="padding-right:4px;">送审</span><span style="padding-right:4px;">修改</span><span>删除</span>
							    </c:otherwise>
							</c:choose>
						</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</form>
	<div class="pagination">${page}</div>
</body>
</html>