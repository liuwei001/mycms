<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>广告位管理</title>
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
			
			$("#searchForm #status option:eq(1)").remove();
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
		function batPublish() {
			if($("#listForm input[name='ids'][st='2']:checked").length ==0){
				top.$.jBox.tip("请选择已送审的广告");
				return;
			}
			$("#listForm input[name='ids'][st='3']:checked").attr("checked",false);
			loading('正在提交，请稍等...');
	    	$("#listForm").attr("action", "${ctx}/cms/advert/audit?status=3");
	    	$("#listForm").submit();
    	}
		function batRefuse() {
			if($("#listForm input[name='ids'][st='2']:checked").length ==0){
				top.$.jBox.tip("请选择已送审的广告");
				return;
			}
			$("#listForm input[name='ids'][st='3']:checked").attr("checked",false);
			loading('正在提交，请稍等...');
	    	$("#listForm").attr("action", "${ctx}/cms/advert/audit?status=4");
	    	$("#listForm").submit();
    	}
		function batOffline() {
			if($("#listForm input[name='ids'][st='3']:checked").length ==0){
				top.$.jBox.tip("请选择已发布的广告");
				return;
			}
			$("#listForm input[name='ids'][st='2']:checked").attr("checked",false);
			loading('正在提交，请稍等...');
	    	$("#listForm").attr("action", "${ctx}/cms/advert/audit?status=5");
	    	$("#listForm").submit();
    	}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/advert/auditList">广告列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="advert" action="${ctx}/cms/advert/auditList" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
<!-- 		<div> -->
		<label>广告名称：</label><form:input path="adName" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
		<label>审核状态：</label>
		<form:select path="status" class="input-small">
			<form:option value="-1">全部</form:option>
			<form:options items="${fns:getDictList('cms_audit_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
		</form:select>&nbsp;
		<label>来源：</label>
		<form:select path="type" class="input-small" onchange="if(this.value == 1) $('#vipNameSpan').show(); else $('#vipNameSpan').hide();">
			<form:option value="-1">全部</form:option>
			<form:option value="0">自主广告</form:option>
			<form:option value="1">会员广告</form:option>
		</form:select>&nbsp;
		<span id="vipNameSpan" <c:if test="${adName.type ne 1}">style="display:none;"</c:if> >
		<label>会员名：</label><form:input path="vipName" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
		</span>
<!-- 		</div> -->
<!-- 		<div style="margin-top:8px;"> -->
		<label>投放周期：&nbsp;</label><input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${advert.beginDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			<label>&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${advert.endDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>&nbsp;&nbsp;
		<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
<!-- 		</div> -->
	</form:form>
	<sys:message content="${message}"/>
	<form id="listForm" method="post">
		<shiro:hasPermission name="cms:bid:edit">
			<div style="margin-left: 10px; margin-bottom: 10px;">
				<input id="btnAudit" class="btn btn-primary" type="button" onclick="return confirmx('确定要批量发布吗？', batPublish);" value="批量发布"/>
				<input id="btnDelete" class="btn btn-primary" type="button" onclick="return confirmx('确定要批量拒绝吗？', batRefuse);" value="批量拒绝"/>
				<input id="btnDelete" class="btn btn-primary" type="button" onclick="return confirmx('确定要批量下线吗？', batOffline);" value="批量下线"/>
			</div>
		</shiro:hasPermission>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
				<shiro:hasPermission name="cms:advert:edit">
					<th style="text-align: center; "><input type="checkbox" id="checkAll" onclick="selectAll();"></th>
				</shiro:hasPermission>
				<th>广告名称</th>
				<th>广告位</th>
				<th>广告类型</th>
				<th>开始日期</th>
				<th>结束日期</th>
				<th>广告来源</th><th>审核状态</th><th>操作</th></tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="tpl">
				<tr>
					<shiro:hasPermission name="cms:advert:edit">
							<td style="text-align: center; ">
							<c:if test="${tpl.status eq 2 or tpl.status eq 3}">
								<input type="checkbox" value="${tpl.id}" name="ids" st = "${tpl.status}">
							</c:if>
						</td>
					</shiro:hasPermission>
					<td>${tpl.adName}</td>
					<td>${tpl.adPlaceName}</td>
					<td>${tpl.adTypeName}</td>
					<td><fmt:formatDate value="${tpl.adStartTm}" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${tpl.adEndTm}" pattern="yyyy-MM-dd"/></td>
					<td>
						<c:choose>
						    <c:when test="${tpl.type eq 0}">自主广告</c:when>
						    <c:when test="${tpl.type eq 1}">会员广告</c:when>
						</c:choose>
					</td>
					<td>
						${fns:getDictLabel(tpl.status, "cms_audit_status", "")}
					</td>
					<td>
						<a href="">预览</a>
						<shiro:hasPermission name="cms:advert:edit">
							<c:choose>
							     <c:when test="${tpl.status eq 2}">
							    	<a href="${ctx}/cms/advert/audit?ids=${tpl.id}&status=3" onclick="return confirmx('确定要发布吗？', this.href)">发布</a>
									<a href="${ctx}/cms/advert/audit?ids=${tpl.id}&status=4" onclick="return confirmx('确定要拒绝吗？', this.href)">拒绝</a>
									<span>下线</span>
								</c:when>
								<c:when test="${tpl.status eq 3}">
									<span style="padding-right:4px;">发布</span><span>拒绝</span>
									<a href="${ctx}/cms/advert/audit?ids=${tpl.id}&status=5" onclick="return confirmx('确定要下线吗？', this.href)">下线</a>
								</c:when>
							    <c:otherwise>
							    	<span style="padding-right:4px;">发布</span><span style="padding-right:4px;">拒绝</span><span>下线</span>
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