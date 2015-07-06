<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxView" value="${pageContext.request.contextPath}/static/views"/>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/>

<!DOCTYPE  HTML>
<html>
<head>
<meta charset="utf-8">

	<title>资讯首页-资讯列表页-资讯详情</title>
	<link rel="stylesheet" type="text/css" href="${ctxView }/css/base.css" />
	<link rel="stylesheet" type="text/css" href="${ctxView }/css/newList.css" />
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var channelPath = "${content.channelPathName}";
			if(channelPath != ""){
				var paths = channelPath.split(" -- ");
				for(var i = 1; i < paths.length; i++){
					$("#location").append("<span class='localFen'>></span><a href='javascript:;'>"+paths[i]+"</a>");
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
	<!-- 中间内容 -->
	<div class="w">
		<!-- 您现在的位置 -->
		<div class="location clearfix" id = "location">
			<span class="localFirst">您现在的位置：</span>
			<a href="javascript:;">咨询首页</a>
<!-- 			<span class="localFen">></span> -->
<!-- 			<a href="">企业新闻</a> -->
<!-- 			<span class="localFen">></span> -->
<!-- 			<a href="">浙江新海藻泥”帮</a> -->
		</div>
		<!-- 您现在的位置 end -->
     <div class="wrap">
     	<div class="fl wrapLeft">
     	  <div class="infoTitle">
     	  	 <h2>${content.title }</h2>
     	  	 <dl>
     	  	 	<dd>
     	  	 		<c:if test="${content.releaseDate != null }"><fmt:formatDate value="${content.releaseDate}" pattern="yyyy-MM-dd"/></c:if>
     	  	 		<c:if test="${content.releaseDate == null }"><fmt:formatDate value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd"/></c:if>
     	  	 	</dd>
     	  	 	<dd>来源 : ${content.origin } </dd>
     	  	 	<dd>编辑 : ${content.author } </dd>
     	  	 	<dd>浏览量 : xxxx </dd>
     	  	 	<dd>字体大小 : <span class="littleText noAct">T</span><span class="bigText">T</span></dd>
     	  	 	<dd><a href="">收藏</a></dd>
     	  	 	<dd>
     	  	 	<!--  分享代码 -->
				<div id="fenXiang"  >
					<div class="bdsharebuttonbox" > <span class="fen" style="float: left">分享到：</span> <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_more" data-cmd="more"></a></div>
				<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
				</div>

 				<!-- 分享代码 end -->
			 </dd>

     	  	 </dl>
     	  </div>
     	  <c:if test="${content.description != null && content.description != ''}">
     	  <div class="infoContent">
     	  	${content.description}
     	  </div>
     	  </c:if>
     	  <div class="infoContentTwo">
	     	  	${content.contentTxt }
     	  	    <div class="side">
     	  	    	负责声明：品材汇网上刊登之所以有信息不声明或保证其内容之正确性或可靠性；您于此接受并认信赖任何信息所生之风险应自行承担。品材汇，有权但无此义务，改善或更正所刊登信息任何时候部分之错误或疏忽。
     	  	    </div>
<!--      	  	    <div class="page"> -->
<!--      	  	    	<a href="" class="uppag">上一篇：深圳全容电商</a> -->
<!--      	  	    	<a href="">下一篇：建材拍卖展会</a> -->
<!--      	  	    </div> -->
				<div class="read">
     	  	    	<p class="readT">延伸阅读</p>
     	  	    	<ol class="readOther">
     	  	    		<li>
     	  	    			<a href="javascript:;"><i>></i>中国智能卫浴标准即将出台</a>
     	  	    			<a href="javascript:;"><i>></i>中国智能卫浴标准即将出台</a>
     	  	    		</li>
     	  	    		<li>
     	  	    			<a href="javascript:;"><i>></i>中国智能卫浴标准即将出台</a>
     	  	    			<a href="javascript:;"><i>></i>中国智能卫浴标准即将出台</a>
     	  	    		</li>
     	  	    		<li>
     	  	    			<a href="javascript:;"><i>></i>中国智能卫浴标准即将出台</a>
     	  	    			<a href="javascript:;"><i>></i>中国智能卫浴标准即将出台</a>
     	  	    		</li>
     	  	    		<li>
     	  	    			<a href="javascript:;"><i>></i>中国智能卫浴标准即将出台</a>
     	  	    			<a href="javascript:;"><i>></i>中国智能卫浴标准即将出台</a>
     	  	    		</li>
     	  	    	</ol>
     	  	    </div>
     	  	    
     	  </div>
     	  
     	</div>

  	    <div class="fr wrapRight" style="width:324px;">
     	
            <img src="${ctxView }/images/left.png">

     	</div>     	

     </div>
	</div>
	<!-- 中间内容 end -->
<!-- 热门推荐 -->
	<div class="w" style="margin:10px auto 10px auto;">
       <img src="${ctxView }/images/adBt.png">
	</div> 
	<!-- 热门推荐 -->
	
	<!-- footer 尾部部  -->
	<div style="height:324px; width:100%; background:#f2f2f2;">
		<div  class="w"><img src="${ctxView }/images/footer.png "style="margin 0 auto; "/> </div>
	</div>
	<!--  footer尾部部 end-->
</body>
	<script type="text/javascript">
	$(function(){

      $(".infoTitle dl dd .bigText").click(function(){
        $(".wrapLeft .infoContent,.wrapLeft .infoContentTwo").css("font-size","16px");
        $(this).addClass("noAct").siblings(".littleText").removeClass("noAct");

      })


      $(".infoTitle dl dd .littleText").click(function(){
        $(".wrapLeft .infoContent,.wrapLeft .infoContentTwo").css("font-size","14px");
         $(this).addClass("noAct").siblings(".bigText").removeClass("noAct");

      })

	})
</script>

</html>