<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>标书管理</title>
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
				top.$.jBox.tip("请选择标书");
				return;
			}
			loading('正在提交，请稍等...');
	    	$("#listForm").attr("action", "${ctx}/cms/bid/delete");
	    	$("#listForm").submit();
		}
		function batAudit() {
			if($("#listForm input[name='ids']:checked").length ==0){
				top.$.jBox.tip("请选择标书");
				return;
			}
			loading('正在提交，请稍等...');
	    	$("#listForm").attr("action", "${ctx}/cms/bid/toAudit");
	    	$("#listForm").submit();
    	}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/bid/">标书列表</a></li>
		<shiro:hasPermission name="cms:bid:edit"><li><a href="${ctx}/cms/bid/form">标书添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="bid" action="${ctx}/cms/bid/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
			<label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="100" class="input-medium"/>
			<label>审核状态：</label>
			<form:select path="status" class="input-small">
				<form:option value="-1">全部</form:option>
				<form:options items="${fns:getDictList('cms_audit_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</form:select>&nbsp;
			<label>创建日期：&nbsp;</label><input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${bid.beginDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			<label>&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${bid.endDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>&nbsp;&nbsp;
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
	</form:form>
	<sys:message content="${message}"/>
	<form id="listForm" method="post">
		<shiro:hasPermission name="cms:bid:edit">
			<div style="margin-left: 10px; margin-bottom: 10px;">
				<input id="btnAudit" class="btn btn-primary" type="button" onclick="return confirmx('确定要批量送审吗？', batAudit);" value="批量送审"/>
				<input id="btnDelete" class="btn btn-primary" type="button" onclick="return confirmx('确定要批量删除吗？', batDelete);" value="批量删除"/>
			</div>
		</shiro:hasPermission>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead><tr>
				<shiro:hasPermission name="cms:bid:edit">
					<th style="text-align: center; "><input type="checkbox" id="checkAll" onclick="selectAll();"></th>
				</shiro:hasPermission>
				<th>标题</th><th>单位</th><th>来源</th><th>审核状态</th><th>创建日期</th><th>操作</th></tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="bid">
				<tr>
					<shiro:hasPermission name="cms:bid:edit">
						<td style="text-align: center; ">
							<c:if test="${bid.status eq 1 or bid.status eq 4 or bid.status eq 5}">
								<input type="checkbox" value="${bid.id}" name="ids">
							</c:if>
						</td>
					</shiro:hasPermission>
					<td style="max-width:450px; text-overflow: ellipsis;white-space: nowrap; overflow: hidden;" title="${bid.title}">
						${bid.title}
					</td>
					<td>
						${bid.unit}
					</td>
					<td>
						${bid.origin}
					</td>
					<td>${fns:getDictLabel(bid.status, "cms_audit_status", "")}</td>
					<td>
						<fmt:formatDate value="${bid.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
						<a href="${ctx}/cms/bid/view?id=${bid.id}" target="_blank">预览</a>
						<shiro:hasPermission name="cms:bid:edit">
							<c:choose>
							    <c:when test="${bid.status eq 1 or bid.status eq 4 or bid.status eq 5}">
									<a href="${ctx}/cms/bid/toAudit?ids=${bid.id}" onclick="return confirmx('确定要送审吗？', this.href)">送审</a>
									<a href="${ctx}/cms/bid/form?id=${bid.id}">修改</a>
									<a href="${ctx}/cms/bid/delete?ids=${bid.id}" onclick="return confirmx('确认要删除该标书吗？', this.href)">删除</a>
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