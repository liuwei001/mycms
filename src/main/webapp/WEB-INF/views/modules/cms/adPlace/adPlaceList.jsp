<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>广告位管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
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
				top.$.jBox.tip("请选择广告位");
				return;
			}
			loading('正在提交，请稍等...');
	    	$("#listForm").attr("action", "${ctx}/cms/adPlace/delete");
	    	$("#listForm").submit();
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/adPlace/">广告位列表</a></li>
		<shiro:hasPermission name="cms:adPlace:edit"><li><a href="${ctx}/cms/adPlace/form">广告位添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="adPlace" action="${ctx}/cms/adPlace/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>广告位名称：</label><form:input path="placeName" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
		<label>广告类型：</label>
		<form:select path="adTypeId" class="input-small">
			<form:option value="-1">全部</form:option>
			<c:forEach items="${addTypeList}" var="tpl">
				<option <c:if test="${tpl.id eq adPlace.adTypeId }">selected="selected"</c:if>value="${tpl.id }" >${tpl.name }</option>
			</c:forEach>
		</form:select>&nbsp;
		<label>价格：</label>
		<form:select path="placePrice" class="input-small">
			<form:option value="-2">全部</form:option>
			<form:option value="-1">面议</form:option>
			<form:option value="0">免费</form:option>
			<form:option value="1">收费</form:option>
		</form:select>&nbsp;
		<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
	</form:form>
	<sys:message content="${message}"/>
	<form id="listForm" method="post">
		<shiro:hasPermission name="cms:adPlace:edit">
			<div style="margin-left: 10px; margin-bottom: 10px;">
				<input id="btnDelete" class="btn btn-primary" type="button" onclick="return confirmx('确定要批量删除吗？', batDelete);" value="批量删除"/>
			</div>
			</shiro:hasPermission>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
				<shiro:hasPermission name="cms:adPlace:edit">
					<th style="text-align: center; "><input type="checkbox" id="checkAll" onclick="selectAll();"></th>
				</shiro:hasPermission>
				<th>广告位编码</th>
				<th>广告位名称</th>
				<th>广告类型</th>
				<th>像素规格（PX）</th>
				<th>价格（元/月）</th><th>已发布数/广告总数</th><th>操作</th></tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="tpl">
				<tr>
					<shiro:hasPermission name="cms:adPlace:edit">
							<td style="text-align: center; ">
								<input type="checkbox" value="${tpl.id}" name="ids">
							</td>
						</shiro:hasPermission>
					<td>${tpl.id}</td>
					<td>${tpl.placeName}</td>
					<td>${tpl.adTypeName}</td>
					<td>${tpl.placePixelX}&nbsp;X&nbsp;${tpl.placePixelY}</td>
					<td>
						<c:choose>
						    <c:when test="${tpl.placePrice == null or tpl.placePrice eq -1}">面议</c:when>
						    <c:when test="${tpl.placePrice eq 0}">免费</c:when>
						    <c:otherwise>${tpl.placePrice}</c:otherwise>
						</c:choose>
					</td>
					<td>${tpl.releaseAdCount}/${tpl.totalAdCount}</td>
					<td>
						<a href="${ctx}/cms/adPlace/adList?adPlaceId=${tpl.id}">广告列表</a>
						<shiro:hasPermission name="cms:adPlace:edit">	
		    				<a href="${ctx}/cms/adPlace/form?id=${tpl.id}">修改</a>
							<a href="${ctx}/cms/adPlace/delete?ids=${tpl.id}" onclick="return confirmx('确认要删除该广告位吗？', this.href)">删除</a>
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