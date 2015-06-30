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
		function toTopicSelect(){
			$('#contentId').val("");
			if($("#listForm input[name='ids']:checked").length ==0){
				top.$.jBox.tip("请选择新闻");
				return;
			}
			$.jBox(html, { title: '加入专题', submit: toTopic });
		}
		var html = "<div style='padding:10px;'>请选择专题内部分类：" +
			"<select name='topicInnerChnlId' id='topicInnerChnlId'>"+
				"<option value=''>请选择</option>"+
				"<c:forEach items='${topicInnerChnls}' var='tpl'>"+
					"<option value='${tpl.id }'>${tpl.name }</option>"+
				"</c:forEach>"+
			"</select></div>";
		var toTopic = function (v, h, f) {
// 		    if (f.topicInnerChnlId == '') {
// 		        $.jBox.tip("请选择专题内部分类。", 'error', {});
// 		        return false;
// 		    }
		    $("#topicInnerChnlId").val(f.topicInnerChnlId);
			$("#listForm").attr("action","${ctx}/cms/topic/toTopic");
			$("#listForm").submit();
		    return true;
		};
		
		function back(){
			parent.location='${ctx}/cms/topic/topicContentList?topicId=${topicId}&func=1';
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/topic/contentList?channelId=${channelId}&topicId=${topicId}">新闻列表</a></li>
		<li><a href="javascript:back();">返回专题新闻列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="content" action="${ctx}/cms/topic/contentList?channelId=${channelId}&topicId=${topicId}" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
<!-- 		<div> -->
			<label>新闻标题：</label><form:input path="title" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
			<label>创建时间：&nbsp;</label><input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${content.beginDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			<label>&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${content.endDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>&nbsp;&nbsp;
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
	</form:form>
	<sys:message content="${message}"/>
	<form id="listForm" method="post">
		<input id="channelId" name="channelId" type="hidden" value="${channelId}"/>
		<input id="topicId" name="topicId" type="hidden" value="${topicId}"/>
		<input id="contentId" name="contentId" type="hidden"/>
		<input id="topicInnerChnlId" name="topicInnerChnlId" type="hidden"/>
		<shiro:hasPermission name="cms:bid:edit">
			<div style="margin-left: 10px; margin-bottom: 10px;">
				<input id="btnAudit" class="btn btn-primary" type="button" onclick="toTopicSelect();" value="批量加入专题"/>
			</div>
		</shiro:hasPermission>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead><tr>
				<shiro:hasPermission name="cms:topic:edit">
					<th style="text-align: center; "><input type="checkbox" id="checkAll" onclick="selectAll();"></th>
				</shiro:hasPermission><th>新闻标题</th>
			<th>审核状态</th>
			<th>新闻来源</th><th>创建时间</th><th>操作</th></tr></thead>
			<tbody>
			<c:forEach items="${page.list}" var="tpl">
				<tr>
					<shiro:hasPermission name="cms:topic:edit">
						<td style="text-align: center; ">
<%-- 							<c:if test="${tpl.status eq 1 or tpl.status eq 4}"> --%>
								<input type="checkbox" value="${tpl.id}" name="ids">
<%-- 							</c:if> --%>
						</td>
					</shiro:hasPermission>
					<td>${tpl.title}</td>
					<td>${fns:getDictLabel(tpl.status, "cms_audit_status", "")}</td>
					<td>${tpl.origin}</td>
					<td><fmt:formatDate value="${tpl.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>
						<a href="${ctx}/cms/content/view?id=${tpl.id}" target="_blank">预览</a>
						<shiro:hasPermission name="cms:topic:edit">
	<%-- 						<a href="${ctx}/cms/topic/toTopic?contentId=${tpl.id}&topicId=${topicId}" onclick="return confirmx('确定要加入专题吗？', this.href)">加入专题</a> --%>
							<a href="javascript:;" onclick="javascript:$('#contentId').val('${tpl.id}');$.jBox(html, { title: '加入专题', submit: toTopic });">加入专题</a>
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