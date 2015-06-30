<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品分类管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate({
				submitHandler: function(form){
					if($("#topicChnlId").val() == ""){
						top.$.jBox.tip('请选专题分类','warning');
					}else if (CKEDITOR.instances.description.getData()==""){
                        top.$.jBox.tip('请填写专题说明','warning');
                    }else{
                    	$('#btnSubmit').attr('disabled',true);
						loading('正在提交，请稍等...');
						form.submit();
					}
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/cms/topic/list">专题列表</a></li>
		<li class="active"><a href="${ctx}/cms/topic/form?id=${topic.id}">专题<shiro:hasPermission name="cms:topic:edit">${not empty topic.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:topic:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="topic" action="${ctx}/cms/topic/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="status"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">专题所属分类:</label>
			<div class="controls">
				<sys:treeselect id="topicChnl" name="topicChnlId" value="${topic.topicChnlId}" labelName="topicChnlName" labelValue="${topic.topicChnlName}"
					title="专题分类" url="/cms/topic/treeData" notAllowSelectRoot = "true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">专题标题:</label>
			<div class="controls">
				<form:input path="topicTitle" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">专题图片:</label>
			<div class="controls">
 				<form:hidden id="topicImg" path="topicImg" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="topicImg" type="thumb" uploadPath="/topic" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">内部分类:</label>
			<div class="controls">
				<div id="innerDiv" style="width:270px;">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>分类名</th>
								<shiro:hasPermission name="cms:topic:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="topicInnerChnlList">
						</tbody>
						<shiro:hasPermission name="cms:topic:edit"><tfoot>
							<tr><td colspan="4"><a href="javascript:" onclick="addRow('#topicInnerChnlList', topicInnerChnlListRowIdx, topicInnerChnlListTpl);topicInnerChnlListRowIdx = topicInnerChnlListRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="topicInnerChnlListTpl">
						<tr id="topicInnerChnlListList{{idx}}">
							<td class="hide">
								<input id="topicInnerChnlList{{idx}}_id" name="topicInnerChnlList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="topicInnerChnlList{{idx}}_delFlag" name="topicInnerChnlList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="topicInnerChnlList{{idx}}_name" name="topicInnerChnlList[{{idx}}].name" type="text" value="{{row.name}}" maxlength="10" class="input-small "/>
							</td>
							<shiro:hasPermission name="cms:topic:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#topicInnerChnlList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>
					</script>
					<script type="text/javascript">
						var topicInnerChnlListRowIdx = 0, topicInnerChnlListTpl = $("#topicInnerChnlListTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(topic.topicInnerChnlList)};
							for (var i=0; i<data.length; i++){
								addRow('#topicInnerChnlList', topicInnerChnlListRowIdx, topicInnerChnlListTpl, data[i]);
								topicInnerChnlListRowIdx = topicInnerChnlListRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">专题标签:</label>
			<div class="controls">
				<form:input path="tags" htmlEscape="false" maxlength="50" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">专题描述:</label>
			<div class="controls">
				<form:textarea id="description" htmlEscape="true" path="description" rows="4" maxlength="200" class="input-xxlarge"/>
				<sys:ckeditor replace="description" uploadPath="/topic" />
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cms:topic:edit">
				<input type="hidden" id="audit" name="audit" value="0"/>
				<input id="btnSubmit" class="btn btn-primary" type="button" value="保 存" onclick="javascript:$('#audit').val('0');$('#inputForm').submit();"/>&nbsp;
<!-- 				<input id="btnAudit" class="btn btn-primary" type="button" value="送审" onclick="javascript:$('#audit').val('1');$('#inputForm').submit();$('#btnAudit').attr('disabled',true);"/>&nbsp; -->
			</shiro:hasPermission>
			<input id="btnView" class="btn btn-primary" type="button" value="预览" onclick=""/>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>