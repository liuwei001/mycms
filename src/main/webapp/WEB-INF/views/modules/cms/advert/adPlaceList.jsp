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
		var adPlace = new Object();
		function selectAdPlace(id,name,typeId,typeName,pixelX,pixelY){
			adPlace.id = id;
			adPlace.name = name;
			adPlace.typeId = typeId;
			adPlace.typeName = typeName;
			adPlace.pixelX = pixelX;
			adPlace.pixelY = pixelY;
// 			$("#contentTable a").html("加入广告位");
// 			$("#contentTable #selectAdPlace"+id).html("<span style='color:red;'>已选定</span>");
			window.parent.addPlace(adPlace);
			window.parent.$.jBox.close(true);
// 			alert(top.$.jBox.getBox().find("button[value='ok']"));
// 			top.$.jBox.getBox().find("button[value='ok']").trigger("click");
		}
	</script>
</head>
<body>
<!-- 	<ul class="nav nav-tabs"> -->
<%-- 		<li class="active"><a href="${ctx}/cms/adPlace/">广告位列表</a></li> --%>
<!-- 	</ul> -->
	<form:form id="searchForm" modelAttribute="adPlace" action="${ctx}/cms/advert/placeList" method="post" class="breadcrumb form-search">
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
<%-- 			<form:options items="${fns:getDictList('cms_content_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/> --%>
		</form:select>&nbsp;
		<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr><th>广告位编码</th>
			<th>广告位名称</th>
			<th>广告类型</th>
			<th>像素规格（PX）</th>
			<th>价格（元/月）</th><th>已发布数/广告总数</th><th>操作</th></tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tpl">
			<tr>
				<td>${tpl.id}</td>
				<td>${tpl.placeName}</td>
				<td>
					${tpl.adTypeName}
				</td>
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
					<a href="javascript:;" id="selectAdPlace${tpl.id }" onclick="selectAdPlace('${tpl.id}','${tpl.placeName}','${tpl.adTypeId }','${tpl.adTypeName}','${tpl.placePixelX}','${tpl.placePixelY}');">加入广告位</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>