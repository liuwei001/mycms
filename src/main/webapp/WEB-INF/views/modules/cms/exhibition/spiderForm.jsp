<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品分类管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src='${ctxStatic}/jsrender/jsrender.min.js'></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate({
				submitHandler: function(form){
					if ($("#channelId").val() == ""){
                        top.$.jBox.tip('请选择展会分类','warning');
                        return;
                    }
					if (CKEDITOR.instances.exhibitionTxt.getData()==""){
                        top.$.jBox.tip('请填写展会说明','warning');
                        return;
                    }
					if($("#countryId").val() == ""){
                    	top.$.jBox.tip('请选择国家','warning');
                    	return;
                    }else if($("#countryId").val() == "A008600"){
                    	if($("#provinceId").val()==""){
			                top.$.jBox.tip('请选择省','warning');
			                return;
			            }else if ($("#cityId").val()==""){
			                top.$.jBox.tip('请选择市','warning');
			                return;
			            }else if($('#address').val() == ""){
			            	top.$.jBox.tip('请填写地址','warning');
			            	$('#address').focus();
			            	return;
			            }
                    }
					if($("#startDate").val() > $("#endDate").val()){
                    	top.$.jBox.tip('展会开始日期不能大于结束日期','warning');
		                return;
                    }
					var isPhone = /^([0-9]{3,4}-)?[0-9]{7,8}$/;
				    var isMob= /^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/;
				    var contactPhone = $("#contactPhone").val();
				    if(!(isPhone.test(contactPhone) || isMob.test(contactPhone))){
				    	top.$.jBox.tip('请输入正确的联系电话','warning');
						$("#contactPhone").focus();
                        return;
				    }
				    var qq = $("#qq").val();
				    if(qq != ""){
				    	var isQQ = /^\d{5,10}$/;
				    	if(!isQQ.test(qq)){
				    		top.$.jBox.tip('请输入正确的商务qq号','warning');
							$("#qq").focus();
	                        return;
				    	}
				    }
				    var isUrl =  /^((https?|ftp|news):\/\/)?([a-z]([a-z0-9\-]*[\.。])+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)|(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))(\/[a-z0-9_\-\.~]+)*(\/([a-z0-9_\-\.]*)(\?[a-z0-9+_\-\.%=&]*)?)?(#[a-z][a-z0-9_]*)?$/;
				    var official = $("#official").val();
				    if(official != "" && !isUrl.test(official)){
				    	top.$.jBox.tip('请输入正确的官方网站','warning');
						$("#official").focus();
                        return;
				    }
				    
					if($("#inputForm").attr("target") != "_blank"){
						loading('正在提交，请稍等...');
						$('#btnSubmit').attr('disabled',true);
						$('#btnAudit').attr('disabled',true);
						$("#startDate").val($("#startDate").val() + " 00:00:00");
					    $("#endDate").val($("#endDate").val() + " 23:59:59");
					}
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
			areaSelect("0",1);
			if("${exhibition.countryId}" != ""){
				$("#countryId").val("${exhibition.countryId}");
			}
			if("${exhibition.provinceId}" != ""){
				areaSelect(findIdByCode("countryId","${exhibition.countryId}"),2);
				$("#provinceId").val("${exhibition.provinceId}");
			}
			if("${exhibition.cityId}" != ""){
				areaSelect(findIdByCode("provinceId","${exhibition.provinceId}"),3);
				$("#cityId").val("${exhibition.cityId}");
			}
			if("${exhibition.address}" != ""){
				areaSelect(findIdByCode("cityId","${exhibition.cityId}"),4);
				$("#address").val("${exhibition.address}");
			}
		});
		function findIdByCode(selectId, code){
			return $("#" + selectId).find("option:selected").attr("val")
		}
		function area(selectId, lowId){
			areaSelect($("#" + selectId).find("option:selected").attr("val"),  lowId);
		}
		function areaSelect(parentId, lowId){
			var selectId = "";
			var value = "";
			if(lowId == 1) {
				selectId = "countryId";
			}else if(lowId == 2) {
				selectId = "provinceId";
				$("#provinceIdSpan").html("<input name='provinceId' type='hidden' value=''>");
				$("#cityIdSpan").html("<input name='cityId' type='hidden' value=''>");
				$("#addressSpan").hide();
				$("#address").val("");
// 				if(parentId != "1") return;
			}else if(lowId == 3) {
				selectId = "cityId";
				$("#cityIdSpan").html("<input name='cityId' type='hidden' value=''>");
				$("#addressSpan").hide();
				$("#address").val("");
			}else if(lowId == 4){ 
				$("#addressSpan").show();
				$("#address").val("");
			}
			if(parentId == ""){ 
				$("#addressSpan").hide();
				$("#address").val("");
				return false;
			}
			jQuery.ajax( {  
		        type : 'GET',  
		        async: false,
		        contentType : 'application/json',  
		        url : '${ctx}/cms/sys/area/findByParent?parentId='+parentId,  
		        dataType : 'json',  
		        success : function(data) {
					if(data.length == 0) return;
					var json = {"selectId" : selectId, "list" : data, "lowId": lowId + 1};
		        	$("#"+selectId+"Span").html($("#selectTemplate").render(json));
		        	return true;
		        },  
		        error : function() {  
		          alert("area error")  
		        }  
		      });
			return false;
		}
		function view(){
			$("#inputForm").attr("action", "${ctx}/cms/exhibition/view?chanId=${chanId}");
			$("#inputForm").attr("target","_blank");
			$("#inputForm").submit();
			
			$("#inputForm").attr("action", "${ctx}/cms/exhibition/save?chanId=${chanId}");
			$("#inputForm").attr("target","");
		}
	</script>
	<script type="text/template" id="selectTemplate">
		<select id="{{:selectId}}" name ="{{:selectId}}" class="input-small" onchange="area('{{:selectId}}',{{:lowId}})">
			<option value="" val="">请选择</option>
			{{for list}}
				<option value="{{:code}}" val="{{:id}}">{{:name}}</option>
			{{/for}}
		</select>
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/cms/exhibition/spiderList">展会列表</a></li>
		<li class="active"><a href="${ctx}/cms/exhibition/spiderForm?id=${exhibition.id}">展会<shiro:hasPermission name="cms:exhibition:edit">${not empty exhibition.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:exhibition:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="exhibition" action="${ctx}/cms/exhibition/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="type" value="1"/>
		<form:hidden path="status"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">展会所属分类:</label>
			<div class="controls">
				<sys:treeselect id="channel" name="channelId" value="${exhibition.channelId}" labelName="channelName" labelValue="${exhibition.channelPathName}"
					title="新闻分类" url="/cms/exhibition/treeData" notAllowSelectRoot = "true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">展会标题:</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">展会图片:</label>
			<div class="controls">
 				<form:hidden id="exhibitionImg" path="exhibitionImg" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="exhibitionImg" type="thumb" uploadPath="/exhibition" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">展会开始日期:</label>
			<div class="controls">
				<input id="startDate" name="startDate" class="input-mini Wdate required"
				value="<fmt:formatDate value="${exhibition.startDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">展会结束日期:</label>
			<div class="controls">
				<input id="endDate" name="endDate" class="input-mini Wdate required"
				value="<fmt:formatDate value="${exhibition.endDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">展馆名称:</label>
			<div class="controls">
				<form:input path="pavilionName" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">展馆地址:</label>
			<div class="controls">
				<span id = "countryIdSpan">
<%-- 				<form:select path="countryId" class="input-small required" onchange="areaSelect(this.value,'provinceId');areaSelect('','cityId');"> --%>
<!-- 					<option value="">请选择</option> -->
<%-- 				</form:select> --%>
				</span>
				<span id = "provinceIdSpan">
<%-- 				<form:select path="provinceId" class="input-small" onchange="areaSelect(this.value,'cityId')"> --%>
<!-- 					<option value="">请选择</option> -->
<%-- 				</form:select> --%>
				</span>
				<span id = "cityIdSpan">
<%-- 				<form:select path="cityId" class="input-small"> --%>
<!-- 					<option value="">请选择</option> -->
<%-- 				</form:select> --%>
				</span>
				<span id = "addressSpan" style="display: none;">
				<form:input path="address" htmlEscape="false" maxlength="100" class="input-xlarge"/>
				</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">展会简介:</label>
			<div class="controls">
				<form:textarea path="description" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">展会说明:</label>
			<div class="controls">
				<form:textarea id="exhibitionTxt" htmlEscape="true" path="exhibitionTxt" rows="4" maxlength="200" class="input-xxlarge"/>
				<sys:ckeditor replace="exhibitionTxt" uploadPath="/exhibition" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">主办单位:</label>
			<div class="controls">
				<form:input path="hostCompany" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">承办单位:</label>
			<div class="controls">
				<form:input path="holdCompany" htmlEscape="false" maxlength="50" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">官方网站:</label>
			<div class="controls">
				<form:input path="official" htmlEscape="false" maxlength="50" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系人:</label>
			<div class="controls">
				<form:input path="contact" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话:</label>
			<div class="controls">
				<form:input path="contactPhone" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">座机:</label>
			<div class="controls">
				<form:input path="officePhone" htmlEscape="false" maxlength="50" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮箱:</label>
			<div class="controls">
				<form:input path="mailbox" htmlEscape="false" maxlength="50" class="input-xlarge email"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">传真:</label>
			<div class="controls">
				<form:input path="fax" htmlEscape="false" maxlength="50" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商务QQ:</label>
			<div class="controls">
				<form:input path="qq" htmlEscape="false" maxlength="50" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">通讯地址:</label>
			<div class="controls">
				<form:input path="contactAddress" htmlEscape="false" maxlength="50" class="input-xlarge"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cms:exhibition:edit">
				<input type="hidden" id="audit" name="audit" value="0"/>
				<input id="btnSubmit" class="btn btn-primary" type="button" value="保 存" onclick="javascript:$('#audit').val('0');$('#inputForm').submit();"/>&nbsp;
				<input id="btnAudit" class="btn btn-primary" type="button" value="送审" onclick="javascript:$('#audit').val('1');$('#inputForm').submit();"/>&nbsp;
			</shiro:hasPermission>
			<input id="btnView" class="btn btn-primary" type="button" value="预览" onclick="view()"/>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>