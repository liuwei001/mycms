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
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/adPlace/adList?adPlaceId=${adPlaceId}">广告列表</a></li>
		<li><a href="${ctx}/cms/adPlace/list/">返回广告位列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="advert" action="${ctx}/cms/adPlace/adList?adPlaceId=${adPlaceId}" method="post" class="breadcrumb form-search">
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
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr><th>广告名称</th>
			<th>广告类型</th>
			<th>开始日期</th>
			<th>结束日期</th>
			<th>广告来源</th><th>审核状态</th><th>操作</th></tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tpl">
			<tr>
				<td>${tpl.adName}</td>
				<td>${tpl.adTypeName}</td>
				<td><fmt:formatDate value="${tpl.adStartTm}" type="both"/></td>
				<td><fmt:formatDate value="${tpl.adEndTm}" type="both"/></td>
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
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>