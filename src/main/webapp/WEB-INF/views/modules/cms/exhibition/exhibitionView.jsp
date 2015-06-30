<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxView" value="${pageContext.request.contextPath}/static/views"/>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>展会-详情页</title>
	<link rel="stylesheet" type="text/css" href="${ctxView }/css/base.css" />
	<link rel="stylesheet" type="text/css" href="${ctxView }/css/exhibition.css" />
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var channelPath = "${exhibition.channelPathName}";
			if(channelPath != ""){
				var paths = channelPath.split(" -- ");
				for(var i = 1; i < paths.length; i++){
					$("#location").append("<span class='localFen'>></span><a href='javascript:;'>"+paths[i]+"</a>");
					
					if(i == paths.length -1)
						$("#channelName").html(paths[i]);
				}
			}
		});
	</script>
</head>
<body>
	<!--top-->
    <div class="hearder" >
    	<div class="w">
    		<img src="${ctxView }/images/top.png"/>
    	</div>
    </div>
	<!-- top end -->
	<div class="w">
		<!-- 您现在的位置 -->
		<div class="location clearfix" id="location">
			<span class="localFirst">您现在的位置：</span>
			<a href="javascript:;">建材展会</a>
		</div>
		<!-- 您现在的位置 end -->

		<div class="clearfix">
			<!-- 左侧 -->
			<div class="antBox">
				<dl class="antDetailsTil">
					<dd><h2>${exhibition.title }</h2></dd>
					<dd>
						发布时间：
						<c:if test="${exhibition.releaseDate != null }"><fmt:formatDate value="${exhibition.releaseDate}" pattern="yyyy-MM-dd"/></c:if>
     	  	 		<c:if test="${exhibition.releaseDate == null }"><fmt:formatDate value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd"/></c:if>
						&nbsp;&nbsp;&nbsp;&nbsp;来源：品材汇&nbsp;&nbsp;&nbsp;&nbsp;编辑：admin&nbsp;&nbsp;&nbsp;&nbsp;浏览量：1190&nbsp;&nbsp;&nbsp;&nbsp;字体大小：<span class="littleText noAct">T</span><span class="bigText">T</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="">收藏</a>
					</dd>
				</dl>
				<div class="antDetailsDesc">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td width="50%" valign="top"><b>展会类型：</b><span id="channelName"></span></td>
								<td width="50%" valign="top"><b>起止时间：</b><fmt:formatDate value="${exhibition.startDate}" pattern="yyyy-MM-dd"/>&nbsp;~&nbsp;<fmt:formatDate value="${exhibition.endDate}" pattern="yyyy-MM-dd"/></td>
							</tr>
							<tr>
								<td width="50%" valign="top"><b>展会地址：</b><c:if test="${exhibition.cityName != '' }">${exhibition.cityName }</c:if><c:if test="${exhibition.cityName == null || exhibition.cityName == '' }">${exhibition.countryName }</c:if></td>
								<td width="50%" valign="top"><b>展馆名称：</b>${exhibition.pavilionName }</td>
							</tr>
							<tr>
								<td width="50%" valign="top"><b>主办单位：</b>${exhibition.hostCompany }</td>
								<c:if test="exhibition.holdCompany != ''"><td width="50%" valign="top"><b>协办单位：</b> ${exhibition.holdCompany }</td></c:if>
							</tr>
							<tr>
								<td width="50%" valign="top"><b>联系人：</b>${exhibition.contact }</td>
								<td width="50%" valign="top"><b>联系电话：</b>${exhibition.contactPhone }</td>
							</tr>
							<tr>
								<c:if test="exhibition.official != ''"><td width="50%" valign="top"><b>看展上报名地址：</b><span class="bdexSpan">${exhibition.official }</span></td></c:if>
								<td width="50%" valign="top"><b>展会状态：</b><span class="bdexSpan"><c:if test="${exhibition.dateStatus eq 0 }">正在进行中</c:if><c:if test="${exhibition.dateStatus eq 1 }">未开始</c:if><c:if test="${exhibition.dateStatus eq 2 }">已结束</c:if></span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="antDetails">
					${exhibition.exhibitionTxt }

				</div>
				<div class="antDetailsFoot clearfix">
<!-- 					<ul class="bdexPage fl"> -->
<!-- 						<li><a href="" class="act">上一篇  :  广东全容电子商务有限公司</a></li> -->
<!-- 						<li><a href="">下一篇  :  广东全容电子商务有限公司</a></li> -->
<!-- 					</ul> -->
<!-- 					分享代码 -->
					<div class="antDetailsShare">
						<div class="fl">分享到：</div>
						<div class="bdsharebuttonbox fr"><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_more" data-cmd="more"></a></div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
					</div>
<!-- 					分享代码 end -->
				</div>
			</div>
			<!-- 左侧 end -->
			<!-- 右侧 -->
			<div class="bdshowRg bdexRg" >
               <img src="${ctxView }/images/zhxq.jpg" style="display: block; margin:0 auto;" />
			</div>
		</div>
		<!-- 您还可以找 -->
		<div class="proReco">
			<dl class="proRecoDl clearfix">
				<dt>您还可以找：</dt>
				<dd>
					<a href="">各种进口大理石</a>
					<a href="">金碧辉煌大理石</a>
					<a href="">外墙大理石</a>
					<a href="">绿色大理石</a>
					<a href="">石料大理石</a>
				</dd>
			</dl>
		</div>
	   <!-- 热门推荐 -->
		<div class="w" style="margin:10px auto 10px auto;">
	       <img src="${ctxView }/images/adBt.png">
		</div> 
		<!-- 热门推荐 -->
	</div>
	

	<!-- footer 尾部部  -->
	<div style="height:324px; width:100%; background:#f2f2f2;">
		<div  class="w"><img src="${ctxView }/images/footer.png "style="margin 0 auto; "/> </div>
	</div>
	<!--  footer尾部部 end-->
</body>
<script type="text/javascript">
   $(function(){
	   $("dl dd .bigText").click(function(){
	        $(".antDetails p").css("font-size","16px");
	        $(this).addClass("noAct").siblings(".littleText").removeClass("noAct");

	      })


	      $("dl dd .littleText").click(function(){
	        $(".antDetails p").css("font-size","14px");
	         $(this).addClass("noAct").siblings(".bigText").removeClass("noAct");

	      })
   })

 </script>
</html>