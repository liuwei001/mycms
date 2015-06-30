<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>广告管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					if($("#adPlaceId").val() == ""){
						top.$.jBox.tip('请选择广告位','warning');
						return;
					}
					var isUrl =  /^((https?|ftp|news):\/\/)?([a-z]([a-z0-9\-]*[\.。])+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)|(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))(\/[a-z0-9_\-\.~]+)*(\/([a-z0-9_\-\.]*)(\?[a-z0-9+_\-\.%=&]*)?)?(#[a-z][a-z0-9_]*)?$/;
				    var adUrl = $("#adUrl").val();
				    if(adUrl != "" && !isUrl.test(adUrl)){
				    	top.$.jBox.tip('请输入正确的官方网站','warning');
						$("#adUrl").focus();
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
		});
		function adPlaceSelect(){
			$.jBox.open("iframe:${ctx}/cms/advert/placeList", "选择广告位", $(top.document).width()-420,$(top.document).height()-320, {
				buttons:{}
// 				buttons:{"确定":"ok","关闭":true}
// 					,
// 					submit:function(v, h, f){
// 						if (v=="ok"){
// 							var adPlace = h.find("iframe")[0].contentWindow.adPlace;
// 							$("#adPlaceId").val(adPlace.id);
// 							$("#adPlaceName").val(adPlace.name);
// 							$("#adTypeId").val(adPlace.typeId);
// 							$("#adTypeName").val(adPlace.typeName);
// 							$("#placePixelX").val(adPlace.pixelX);
// 							$("#placePixelY").val(adPlace.pixelY);
// 						}
// 					}
				}
			);
		}
		function addPlace(adPlace){
			$("#adPlaceId").val(adPlace.id);
			$("#adPlaceName").val(adPlace.name);
			$("#adTypeId").val(adPlace.typeId);
			$("#adTypeName").val(adPlace.typeName);
			$("#placePixelX").val(adPlace.pixelX);
			$("#placePixelY").val(adPlace.pixelY);
		}
		function addMoth(now,month) {
	        if (month != "" && month.length > 0 && !isNaN(month)) {
	            var arr = now.split("-");
	            var y = parseInt(arr[0]);
	            var m = parseInt(arr[1]);
	            var d = parseInt(arr[2]);
	            m += parseInt(month);
	            if (m > 12) {
	                //y = parseInt(y + (m-12) / 12);    
	                y = parseInt(y + m / 12);
	                m = m % 12;
	            }
	            if(d > 28){
	            	d = month_day(y,m);
	            }
	            if(m < 10) m = "0" + m;
	            if(d < 10) d = "0" + d;
	            var newDate = y + "-" + m + "-" + d;
	            return newDate;
	        }
	    }
		function month_day(year,month){
			var day = 0;
			switch(month){
				case 1:
				case 3:
				case 5:
				case 7:
				case 8:
				case 10:
				case 12: day = 31; break;
				case 4:
				case 6:
				case 9:
				case 11: day = 30; break;
				case 2:
					if (isPN(year,month)) {
						day = 28;
	                } else {
	                	day = 29;
	                }
					break;
			}
			return day;
		}
	    function isPN(year,month) {
	        if (year % 100 == 0 && year % 400 == 0) {
	            return true;
	        }
	        if (year % 100 != 0 && year % 4 == 0){
	            return true;
	        }
	        return false;
	    }
		function channgeAdValidPeriod(){
			var startTm = $("#adStartTm").val();
			var m = $("#adValidPeriod").val();
			if(m <= 0){ 
				$("#adEndTm").val("");
				return;
			}
			var endTime = addMoth(startTm,m);
			$("#adEndTm").val(endTime);
		}
// 		jQuery.fn.removeSelected = function() {
// 		    this.val("");
// 		};
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/cms/advert/">广告列表</a></li>
		<li class="active"><a href="${ctx}/cms/advert/form?id=${advert.id}">广告<shiro:hasPermission name="cms:advert:edit">${not empty advert.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:advert:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="advert" action="${ctx}/cms/advert/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="status"/>
		<form:hidden path="type" value="0"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">广告名称：</label>
			<div class="controls">
				<form:input path="adName" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属广告位：</label>
			<div class="controls">
				<form:hidden path="adPlaceId"/>
				<input id="adPlaceName" name="adPlaceName" value="${advert.adPlaceName }" readonly="readonly" maxlength="100" class="input-xlarge"/>
				<input id="btnCancel" class="btn" type="button" value="选择" onclick="adPlaceSelect();"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">广告类型：</label>
			<div class="controls">
				<form:hidden path="adTypeId"/>
				<input id="adTypeName" name="adTypeName" value="${advert.adTypeName}" readonly="readonly" maxlength="100" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">广告像素规格：</label>
			<div class="controls">
				<input id="placePixelX" name="placePixelX" value="${advert.placePixelX }" maxlength="18" class="input-small digits required"/>
				X
				<input id="placePixelY" name="placePixelY" value="${advert.placePixelY }" maxlength="18" class="input-small digits required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">广告实体：</label>
			<div class="controls">
				<form:hidden id="adContent" path="adContent" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<sys:ckfinder input="adContent" type="thumb" uploadPath="/ad" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">广告链接地址：</label>
			<div class="controls">
				<form:input path="adUrl" htmlEscape="false" maxlength="100" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">广告生效日期：</label>
			<div class="controls">
				<input id="adStartTm" name="adStartTm" class="input-mini Wdate required"
				value="<fmt:formatDate value="${advert.adStartTm}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false}); $('#adEndTm').val('');$('#adValidPeriod option:first').attr('selected', 'selected');"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">购买时长：</label>
			<div class="controls">
				<form:select path="adValidPeriod" class="input-small required" onchange="channgeAdValidPeriod()">
					<option id="adValidPeriodNull" value="-1">请选择</option>
					<form:options items="${fns:getDictList('cms_advert_buy_time')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">广告失效日期：</label>
			<div class="controls">
				<input id="adEndTm" name="adEndTm" class="input-mini Wdate required"  readonly="readonly"
				value="<fmt:formatDate value="${advert.adEndTm}" pattern="yyyy-MM-dd"/>"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">排序：</label>
			<div class="controls">
				<form:input path="sort" maxlength="18" class="input-small digits required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">其他说明:</label>
			<div class="controls">
				<form:textarea path="adDesc" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cms:adPlace:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>