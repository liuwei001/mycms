<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>栏目管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#treeTable").treeTable({expandLevel : 2});
		});
    	function updateSort() {
//     		$("#listForm input[name='sorts']").each(function(){
//     			if($(this).val() > 100){
//     				top.$.jBox.tip('分类排序不能大于100','warning');
//     				$(this).focus();
//     				return;
//     			}
//     		});
//     		return;
			loading('正在提交，请稍等...');
	    	$("#listForm").attr("action", "${ctx}/cms/classify/updateSort?type=${type}");
	    	$("#listForm").submit();
    	}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/classify/list?type=${type}">${rootName}分类列表</a></li>
		<shiro:hasPermission name="cms:classify:edit"><li><a href="${ctx}/cms/classify/form?type=${type}">${rootName}分类添加</a></li></shiro:hasPermission>
	</ul>
	<%-- <form:form id="searchForm" modelAttribute="classify" action="${ctx}/cms/classify/list" method="post" class="breadcrumb form-search">
			<label>分类类型：</label>
			<form:select path="type" class="input-small">
				<form:options items="${fns:getDictList('cms_classify_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</form:select>
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
	</form:form> --%>
	<sys:message content="${message}"/>
	<form id="listForm" method="post">
		<table id="treeTable" class="table table-striped table-bordered table-condensed">
			<tr>
				<th>分类名</th>
				<th>分类编码</th>
				<th style="text-align:center;">分类排序</th>
				<th>是否显示</th>
				<th>访问路径</th>
				<th>备注</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${list}" var="tpl">
				<tr id="${tpl.id}" pId="${tpl.parentId ne '0'?tpl.parentId:'0'}">
					<td>${tpl.name}</td>
					<td>${tpl.code}</td>
					<td style="text-align:center;">
						<shiro:hasPermission name="cms:classify:edit">
							<input type="hidden" name="ids" value="${tpl.id}"/>
							<input name="sorts" type="text" value="${tpl.sort}" style="width:50px;margin:0;padding:0;text-align:center;">
						</shiro:hasPermission><shiro:lacksPermission name="cms:classify:edit">
							${tpl.sort}
						</shiro:lacksPermission>
					</td>
					<td>${fns:getDictLabel(tpl.isShow, "yes_no", "")}</td>
					<td>${tpl.pathName}</td>
					<td>${tpl.remarks}</td>
					<td>
						<shiro:hasPermission name="cms:classify:edit">
							<a href="${ctx}/cms/classify/form?id=${tpl.id}&type=${type}">修改</a>
							<a href="${ctx}/cms/classify/delete?id=${tpl.id}&type=${type}" onclick="return confirmx('要删除该分类及所有子分类，并删除该分类及所有子分类下所有${rootName}吗？', this.href)">删除</a>
<%-- 							<c:if test="${tpl.classifyLevel <= 2 }"> --%>
								<a href="${ctx}/cms/classify/addlow?id=${tpl.id}&type=${type}">添加下级分类</a>
<%-- 							</c:if> --%>
<%-- 							<c:if test="${tpl.classifyLevel == 3 }"> --%>
<%-- 								<a href="${ctx}/cms/classify/addsame?id=${tpl.id}&isFloor=${isFloor}">添加同级分类</a> --%>
<%-- 							</c:if> --%>
						</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach>
		</table>
		<shiro:hasPermission name="cms:classify:edit"><div class="form-actions pagination-left">
			<input id="btnSubmit" class="btn btn-primary" type="button" value="保存排序" onclick="updateSort();"/>
		</div></shiro:hasPermission>
	</form>
</body>
</html>