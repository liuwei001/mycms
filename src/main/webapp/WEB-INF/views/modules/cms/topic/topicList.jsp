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
				top.$.jBox.tip("请选择专题");
				return;
			}
			loading('正在提交，请稍等...');
	    	$("#listForm").attr("action", "${ctx}/cms/topic/delete");
	    	$("#listForm").submit();
		}
		function batToAudit() {
			if($("#listForm input[name='ids']:checked").length ==0){
				top.$.jBox.tip("请选择专题");
				return;
			}
			loading('正在提交，请稍等...');
	    	$("#listForm").attr("action", "${ctx}/cms/topic/toAudit");
	    	$("#listForm").submit();
    	}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/topic/list">专题列表</a></li>
		<shiro:hasPermission name="cms:topic:edit">
			<li><a href="${ctx}/cms/topic/form">专题添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="topic" action="${ctx}/cms/topic/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
<!-- 		<div> -->
			<label>专题标题：</label><form:input path="topicTitle" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
			<label>专题分类：</label>
			<sys:treeselect id="topicChnl" name="topicChnlId" value="${topic.topicChnlId}" labelName="topicChnlName" labelValue="${topic.topicChnlName}"
					title="专题分类" url="/cms/topic/treeData" cssClass="input-small" allowClear="true"/>&nbsp;
			<label>审核状态：</label>
			<form:select path="status" class="input-small">
				<form:option value="-1">全部</form:option>
				<form:options items="${fns:getDictList('cms_audit_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</form:select>&nbsp;
<!-- 		</div> -->
<!-- 		<div style="margin-top:8px;"> -->
			<label>创建日期：&nbsp;</label><input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${topic.beginDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			<label>&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${topic.endDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>&nbsp;&nbsp;
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
<!-- 		</div> -->
	</form:form>
	<sys:message content="${message}"/>
	<form id="listForm" method="post">
		<shiro:hasPermission name="cms:bid:edit">
			<div style="margin-left: 10px; margin-bottom: 10px;">
				<input id="btnAudit" class="btn btn-primary" type="button" onclick="return confirmx('确定要批量送审吗？', batToAudit);" value="批量送审"/>
				<input id="btnDelete" class="btn btn-primary" type="button" onclick="return confirmx('确定要批量删除吗？', batDelete);" value="批量删除"/>
			</div>
		</shiro:hasPermission>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead><tr>
				<shiro:hasPermission name="cms:topic:edit">
					<th style="text-align: center; "><input type="checkbox" id="checkAll" onclick="selectAll();"></th>
				</shiro:hasPermission>
				<th>专题标题</th>
			<th>专题分类</th>
			<th>新闻数量</th>
			<th>审核状态</th>
			<th>创建人</th><th>创建日期</th><th>操作</th></tr></thead>
			<tbody>
			<c:forEach items="${page.list}" var="tpl">
				<tr>
					<shiro:hasPermission name="cms:topic:edit">
						<td style="text-align: center; ">
							<c:if test="${tpl.status eq 1 or tpl.status eq 4 or tpl.status eq 5}">
								<input type="checkbox" value="${tpl.id}" name="ids">
							</c:if>
						</td>
					</shiro:hasPermission>
					<td>${tpl.topicTitle}</td>
					<td>${tpl.topicChnlName}</td>
					<td>${tpl.contentNum}</td>
					<td>
						${fns:getDictLabel(tpl.status, "cms_audit_status", "")}
					</td>
					<td>${tpl.createBy.name}</td>
					<td><fmt:formatDate value="${tpl.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>
						<a href="">预览</a>
						
						<shiro:hasPermission name="cms:topic:edit">
							<c:choose>
							    <c:when test="${tpl.status eq 1 or tpl.status eq 4 or tpl.status eq 5}">
							    		<a href="${ctx}/cms/topic/topicContentList?topicId=${tpl.id}&func=1">新闻列表</a>
										<a href="${ctx}/cms/topic/toAudit?ids=${tpl.id}" onclick="return confirmx('确定要送审吗？', this.href)">送审</a>
										<a href="${ctx}/cms/topic/form?id=${tpl.id}">修改</a>
										<a href="${ctx}/cms/topic/delete?ids=${tpl.id}" onclick="return confirmx('要删除该新闻吗？', this.href)">删除</a>
								</c:when>
							    <c:otherwise>
							    	<a href="${ctx}/cms/topic/topicContentList?topicId=${tpl.id}&func=3">新闻列表</a>
							    	<span style="padding-right:4px;">送审</span><span style="padding-right:4px;">修改</span><span>删除</span>
							    </c:otherwise>
							</c:choose>
						</shiro:hasPermission>
						<shiro:lacksPermission name="cms:topic:edit">
							<a href="${ctx}/cms/topic/topicContentList?topicId=${tpl.id}&func=3">新闻列表</a>
						</shiro:lacksPermission>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</form>
	<div class="pagination">${page}</div>
</body>
</html>