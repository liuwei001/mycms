<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxView" value="${pageContext.request.contextPath}/static/views"/>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/>

<!DOCTYPE  HTML>
<html>
<head>
<meta charset="utf-8">
	<title>资讯首页-招标预告详细页</title>
	<link rel="stylesheet" type="text/css" href="${ctxView }/css/base.css" />
	<link rel="stylesheet" type="text/css" href="${ctxView }/css/bid.css" />
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
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
		<div class="location clearfix">
			<span class="localFirst">您现在的位置：</span>
			<a href="">资讯首页</a>
			<span class="localFen">></span>
			<c:if test="${type eq 0 }">
				<a href="javascript:;">招标预告</a>
			</c:if>
			<c:if test="${type eq 1 }">
				<a href="javascript:;">中标公告</a>
			</c:if>
		</div>
		<!-- 您现在的位置 end -->

		<div class="clearfix">
			<!-- 左侧 -->
			<div class="antBox">
				<dl class="antDetailsTil">
					<dt><h2>${bid.title }</h2></dt>
					<dd>
						发布时间：<c:if test="${bid.releaseDate != null }"><fmt:formatDate value="${bid.releaseDate}" pattern="yyyy-MM-dd"/></c:if>
     	  	 		<c:if test="${bid.releaseDate == null }"><fmt:formatDate value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd"/></c:if>
						&nbsp;&nbsp;&nbsp;&nbsp;来源：${bid.origin }&nbsp;&nbsp;&nbsp;&nbsp;编辑：admin&nbsp;&nbsp;&nbsp;&nbsp;浏览量：1190&nbsp;&nbsp;&nbsp;&nbsp;字体大小：<span class="littleText noAct">T</span><span class="bigText">T</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="">收藏</a>
					</dd>
				</dl>
				
				<div class="antDetailsDesc clearfix">
					<c:if test="${type eq 0 }">
					<dl class="antDetailsItems">
						<dt>招标单位：</dt>
						<dd>${bid.unit }</dd>
					</dl>
					<dl class="antDetailsItems">
						<dt>报名时间：</dt>
						<dd><fmt:formatDate value="${bid.startDate}" pattern="yyyy-MM-dd"/>&nbsp;~&nbsp;<fmt:formatDate value="${bid.endDate}" pattern="yyyy-MM-dd"/></dd>
					</dl>
					<dl class="antDetailsItems">
						<dt>地　　区：</dt>
						<dd>${bid.areaName }</dd>
					</dl>
					<dl class="antDetailsItems">
						<dt>报名联系人：</dt>
						<dd>${bid.contact }</dd>
					</dl>
					<dl class="antDetailsItems">
						<dt>联系电话：</dt>
						<dd>${bid.contactPhone }</dd>
					</dl>
					</c:if>
					<c:if test="${type eq 1 }">
					<dl class="antDetailsItems">
						<dt>中标单位：</dt>
						<dd>${bid.unit }</dd>
					</dl>
					<dl class="antDetailsItems">
						<dt>中标时间：</dt>
						<dd>${bid.startDate }</dd>
					</dl>
					<dl class="antDetailsItems">
						<dt>地　　区：</dt>
						<dd>${bid.areaName }</dd>
					</dl>
					</c:if>
				</div>
				<div class="antDetails">
					${bid.bidTxt }
				</div>
				<div class="antDetailsFoot clearfix">
<!-- 					<dl class="antDetailsTag"> -->
<!-- 						<dt>文章标签：</dt> -->
<!-- 						<dd> -->
<!-- 							<div><a href="">LED 照明</a></div> -->
<!-- 							<div><a href="">照明建材</a></div> -->
<!-- 						</dd> -->
<!-- 					</dl> -->
					<!-- 分享代码 -->
					<div class="antDetailsShare">
						<div class="fl">分享到：</div>
						<div class="bdsharebuttonbox fr"><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_more" data-cmd="more"></a></div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
					</div>
					<!-- 分享代码 end -->
				</div>
			</div>
			<!-- 右侧 -->
			<div class="antrg" >
             <img src="${ctxView }/images/zbyg.jpg" style="display: block; margin:0 auto;" />
			</div>
		</div>
		<!-- 您还可以找 -->
		<div class="proReco">
			<dl class="proRecoDl clearfix">
				<dt>您还可以找：</dt>
				<dd>
					<a href="javascript:;">各种进口大理石</a>
					<a href="javascript:;">金碧辉煌大理石</a>
					<a href="javascript:;">外墙大理石</a>
					<a href="javascript:;">绿色大理石</a>
					<a href="javascript:;">石料大理石</a>
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
       $(".antDetails .antDetails_row_2").css("font-size","16px");
        $(this).addClass("noAct").siblings(".littleText").removeClass("noAct");

      })


      $("dl dd .littleText").click(function(){
        $(".antDetails .antDetails_row_2").css("font-size","14px");
         $(this).addClass("noAct").siblings(".bigText").removeClass("noAct");

      })
})
</script>
</html>