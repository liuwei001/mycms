<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>敏感词管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnImport").click(function(){
				$.jBox($("#importBox").html(), {title:"导入数据", buttons:{"关闭":true}, 
					bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
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
        function subDelete() {
    		var checklist = document.getElementsByName("ids");
    		var url= document.forms[1].action;
    		var ids = [];
    		var j = 0;
    		for (var i = 0; i < checklist.length; i++) {
    			if (checklist[i].checked) {
    				ids.push(checklist[i].value);
    				j++;
    			}
    		}
    		if (j == 0) {
    			alert("请至少选择一条数据");
    			return;
    		} else {
    			confirmx("是否要批量删除这"+j+"条数据？",url + "subDelete?ids="+ids.join());
    		}
    	}
	</script>
</head>
<body>
<div id="importBox" class="hide">
		<form id="importForm" action="${ctx}/cms/sensitivity/import" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，请稍等...');"><br/>
			<input id="uploadFile" name="file" type="file" style="width:330px"/><br/><br/>　　
			<input id="btnImportSubmit" class="btn btn-primary" type="submit" value="导 入"/>
			<a href="${ctx}/cms/sensitivity/import/template">下载模板</a>
		</form>
	</div>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/sensitivity/">敏感词列表</a></li>
		<shiro:hasPermission name="cms:sensitivity:edit"><li><a href="${ctx}/cms/sensitivity/form">敏感词添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="sensitivity" action="${ctx}/cms/sensitivity/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		
		<ul class="ul-form">
			<li>敏感词：
				<form:input path="sensitivity" htmlEscape="false" maxlength="30" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<br /><br />
			<li><input id="btnImport" class="btn btn-primary" type="button" value="批量导入"/></li>
			<li class="btns"><input id="btn" class="btn btn-primary" type="button" onclick="subDelete()" value="批量删除"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th width="40px" style="padding-left: 30px;"><input type="checkbox" id="checkAll" onclick="selectAll();"></th>
				<th>敏感词</th>
				<th>替换词</th>
				<th>修改日期</th>
				<shiro:hasPermission name="cms:sensitivity:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sensitivity">
			<tr>
			<td style="padding-left: 30px;"><input type="checkbox" value="${sensitivity.id}" name="ids"></td>
				<td><a href="${ctx}/cms/sensitivity/form?id=${sensitivity.id}">
					${sensitivity.sensitivity}
				</a></td>
				<td>
					${sensitivity.replacement}
				</td>
				<td>
					<fmt:formatDate value="${sensitivity.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="cms:sensitivity:edit"><td>
    				<a href="${ctx}/cms/sensitivity/form?id=${sensitivity.id}">修改</a>
					<a href="${ctx}/cms/sensitivity/delete?id=${sensitivity.id}" onclick="return confirmx('确认要删除该敏感词吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>