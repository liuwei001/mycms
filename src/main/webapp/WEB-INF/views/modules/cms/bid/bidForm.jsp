<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>标书管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src='${ctxStatic}/jsrender/jsrender.min.js'></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					if (CKEDITOR.instances.bidTxt.getData()==""){
                        top.$.jBox.tip('请填写标书内容','warning');
                        return;
                    }
					if($("#type").val() == 0){
						if($("#endDate").val() == ""){
							top.$.jBox.tip('请填写结束日期','warning');
							$("#endDate").focus();
	                        return;
						}
						if($("#startDate").val() > $("#endDate").val()){
							top.$.jBox.tip('开始日期不能大于结束日期','warning');
							$("#endDate").focus();
	                        return;
						}
					}
					var isPhone = /^([0-9]{3,4}-)?[0-9]{7,8}$/;
				    var isMob= /^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/;
				    var contactPhone = $("#contactPhone").val();
				    if(!(isPhone.test(contactPhone) || isMob.test(contactPhone))){
				    	top.$.jBox.tip('请输入正确的联系电话','warning');
						$("#contactPhone").focus();
                        return;
				    }
				    
					loading('正在提交，请稍等...');
					form.submit();
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
			
			if("${bid.type}" != ""){
				changeType(${bid.type});
			}
			
			areaSelect("1");
			if("${bid.areaId}" != ""){
				$("#areaId").val("${bid.areaId}");
			}
		});
		
		function changeType(val){
			if(val == 0){
				$("#endDateSpan").show();
			}else if(val == 1){
				$("#endDateSpan").hide();
				$("#endDate").val("");
			}
		}
		function areaSelect(parentId){
			var selectId = "areaId";
			jQuery.ajax( {  
		        type : 'GET',  
		        async: false,
		        contentType : 'application/json',  
		        url : '${ctx}/cms/sys/area/findByParent?parentId='+parentId,  
		        dataType : 'json',  
		        success : function(data) {
					if(data.length == 0) return;
					var json = {"selectId" : selectId, "list" : data};
		        	$("#"+selectId+"Span").html($("#selectTemplate").render(json));
		        	return true;
		        },  
		        error : function() {  
		          alert("area error")  
		        }  
		      });
			return false;
		}
	</script>
	<script type="text/template" id="selectTemplate">
		<select id="{{:selectId}}" name ="{{:selectId}}" class="input-small"">
			<option value="" val="">请选择</option>
			{{for list}}
				<option value="{{:code}}">{{:name}}</option>
			{{/for}}
		</select>
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/cms/bid/">标书列表</a></li>
		<li class="active"><a href="${ctx}/cms/bid/form?id=${bid.id}">标书<shiro:hasPermission name="cms:bid:edit">${not empty bid.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:bid:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="bid" action="${ctx}/cms/bid/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="status"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">地区：</label>
			<div class="controls">
<%-- 				<sys:treeselect id="area" name="area.id" value="${bid.area.id}" labelName="area.name" labelValue="${bid.area.name}" --%>
<%-- 					title="区域" url="/sys/area/treeData" cssClass="input-xlarge" allowClear="true"/> --%>
				<span id = "areaIdSpan">
				</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">行业：</label>
			<div class="controls">
				<form:select path="tradeId" class="input-xlarge">
					<form:option value="">请选择</form:option>
					<form:options items="${fns:getDictList('cms_content_extchnl')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">类型：</label>
			<div class="controls">
				<form:select path="type" class="input-xlarge required" onchange="changeType(this.value)">
					<form:options items="${fns:getDictList('cms_bid_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">日期：</label>
			<div class="controls">
				<input id="startDate" name="startDate" class="input-mini Wdate required"
				value="<fmt:formatDate value="${bid.startDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				
				<span id="endDateSpan">
					&nbsp;~&nbsp;
					<input id="endDate" name="endDate" class="input-mini Wdate"
					value="<fmt:formatDate value="${bid.endDate}" pattern="yyyy-MM-dd"/>"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				</span>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">单位：</label>
			<div class="controls">
				<form:input path="unit" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">来源：</label>
			<div class="controls">
				<form:input path="origin" htmlEscape="false" maxlength="20" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系人：</label>
			<div class="controls">
				<form:input path="contact" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话：</label>
			<div class="controls">
				<form:input path="contactPhone" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">描述：</label>
			<div class="controls">
				<form:textarea path="description" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标书内容:</label>
			<div class="controls">
				<form:textarea id="bidTxt" htmlEscape="true" path="bidTxt" rows="4" maxlength="200" class="input-xxlarge"/>
				<sys:ckeditor replace="bidTxt" uploadPath="/bid" />
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cms:bid:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>