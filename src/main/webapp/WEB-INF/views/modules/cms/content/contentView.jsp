<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctxView"
	value="${pageContext.request.contextPath}/static/views" />
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static" />

<!DOCTYPE  HTML>
<html>
<head>
<meta charset="utf-8">

<title>资讯首页-资讯列表页-资讯详情</title>
<link rel="stylesheet" type="text/css" href="${ctxView }/css/ui.min.css" />
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				var channelPath = "${content.channelPathName}";
				if (channelPath != "") {
					var paths = channelPath.split(" -- ");
					for (var i = 1; i < paths.length; i++) {
						$("#location").append(
								"<span class='localFen'>></span><a href='javascript:;'>"
										+ paths[i] + "</a>");
					}
				}
			});
</script>
</head>
<body>
	<nav class="navbar navbar-default">
		<!-- header start -->
		<div class="container nav-header">
			<div class="col-lg-4 col-xs-5">
				<img class="img-responsive" src="${ctxView }/img/logo.png" alt="">
			</div>
			<div class="col-lg-4 col-xs-6 phone pull-right">
				<span>全国服务热线：</span>
				<h3>4000-189-628</h3>
			</div>
		</div>
		<div class="menu">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<div class="col-xs-8">
						<a class="navbar-brand" href="#"><img class="img-responsive"
							src="${ctxView }/img/logo.png" alt=""></a>
					</div>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="index.html">网站首页</a></li>
						<li class="active"><a href="info.html">资讯中心</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							href="product.html">产品中心</a>
							<ul class="dropdown-menu">
								<li><a href="http://11.htyundai.com" target="_blank">网贷系统</a></li>
								<li><a href="">众筹系统</a></li>
								<li><a href="http://credit.htyundai.com" target="_blank">小贷系统</a></li>
								<li><a href="">配资系统</a></li>
								<li><a href="">跨境电商</a></li>
							</ul></li>
						<li><a href="case.html">成功案例</a></li>
						<li><a href="support.html">服务支持</a></li>
						<li><a href="http://www.klht-tech.com/?cat=27"
							target="_blank">关于我们</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- header -->
	</nav>
	<div class="container-fluid page-head">
		<div class="row">
			<img class="img-maxwidth" src="${ctxView }/img/info-banner.jpg"
				alt="">
		</div>
	</div>

	<!-- top end -->
	<div class="container section-mg">
		<div class="row">
			<div class="col-lg-8 news-tab" role="tabpanel">
				<!-- Nav tabs -->
				<div>当前位置：资讯中心 > 公司新闻</div>

				<!-- Tab panes -->
				<div class="tab-content news">
					<div role="tabpanel" class="tab-pane active" id="home">
						<div class="fl wrapLeft">
							<div class="infoTitle">
								<h2>${content.title }</h2>
								<dl>
									<dd>
										<c:if test="${content.releaseDate != null }">
											<fmt:formatDate value="${content.releaseDate}"
												pattern="yyyy-MM-dd" />
										</c:if>
										<c:if test="${content.releaseDate == null }">
											<fmt:formatDate value="<%=new java.util.Date()%>"
												pattern="yyyy-MM-dd" />
										</c:if>
									</dd>
									<dd>来源 : ${content.origin }</dd>
									<dd>编辑 : ${content.author }</dd>
									<dd>浏览量 : xxxx</dd>
									<dd>
										字体大小 : <span class="littleText noAct">T</span><span
											class="bigText">T</span>
									</dd>
									<dd>
										<a href="">收藏</a>
									</dd>
									<dd>
										<!--  分享代码 -->
										<div id="fenXiang">
											<div class="bdsharebuttonbox">
												<span class="fen" style="float: left">分享到：</span> <a
													href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a
													href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a
													href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a
													href="#" class="bds_renren" data-cmd="renren"
													title="分享到人人网"></a><a href="#" class="bds_more"
													data-cmd="more"></a>
											</div>
											<script>
												window._bd_share_config = {
													"common" : {
														"bdSnsKey" : {},
														"bdText" : "",
														"bdMini" : "2",
														"bdMiniList" : false,
														"bdPic" : "",
														"bdStyle" : "0",
														"bdSize" : "16"
													},
													"share" : {}
												};
												with (document)
													0[(getElementsByTagName('head')[0] || body)
															.appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='
															+ ~(-new Date() / 36e5)];
											</script>
										</div>

										<!-- 分享代码 end -->
									</dd>

								</dl>
							</div>
							<c:if
								test="${content.description != null && content.description != ''}">
								<div class="infoContent">${content.description}</div>
							</c:if>
							<div class="infoContentTwo">${content.contentTxt }</div>

						</div>
					</div>
				</div>
				<!-- nav tab end -->
			</div>
			<div class="col-lg-4">
				<div class="info-case">
					<h4 class="main-header">
						客户<strong>案例</strong> CASE
					</h4>
					<ul>
						<li><img class="img-maxwidth" src="${ctxView }/img/case.png"
							alt=""></li>
						<li><img class="img-maxwidth" src="${ctxView }/img/case2.png"
							alt=""></li>
						<li><img class="img-maxwidth" src="${ctxView }/img/case3.png"
							alt=""></li>
						<li><img class="img-maxwidth" src="${ctxView }/img/case4.png"
							alt=""></li>
						<li><img class="img-maxwidth" src="${ctxView }/img/case5.png"
							alt=""></li>
						<li><img class="img-maxwidth" src="${ctxView }/img/case6.png"
							alt=""></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<footer class="main-footer">
		<!-- footer start -->
		<h5>网站地图</h5>
		<div class="container sm-block-3">
			<div class="row">
				<div class="col-md-2 col-xs-4">
					<dl>
						<dt>
							<a href="">网站首页</a>
						</dt>
					</dl>
				</div>
				<div class="col-md-2 col-xs-4">
					<dl>
						<dt>
							<a href="">成功案例</a>
						</dt>
						<dd>
							<a href="">银行</a>
						</dd>
						<dd>
							<a href="">保险</a>
						</dd>
						<dd>
							<a href="">金融.电商</a>
						</dd>
					</dl>
				</div>
				<div class="col-md-2 col-xs-4">
					<dl>
						<dt>
							<a href="">解决方案</a>
						</dt>
						<dd>
							<a href="">银行</a>
						</dd>
						<dd>
							<a href="">互联网</a>
						</dd>
					</dl>
				</div>
				<div class="col-md-2 col-xs-4">
					<dl>
						<dt>
							<a href="">企业文化</a>
						</dt>
						<dd>
							<a href="">公司理念</a>
						</dd>
						<dd>
							<a href="">人才培训</a>
						</dd>
						<dd>
							<a href="">成长之旅</a>
						</dd>
					</dl>
				</div>
				<div class="col-md-2 col-xs-4">
					<dl>
						<dt>
							<a href="">如何购买</a>
						</dt>
					</dl>
				</div>
				<div class="col-md-2 col-xs-4">
					<dl>
						<dt>
							<a href="http://www.klht-tech.com/?cat=27" target="_blank">关于我们</a>
						</dt>
						<dd>
							<a href="http://www.klht-tech.com/?cat=34" target="_blank">资质荣誉</a>
						</dd>
						<dd>
							<a href="http://www.klht-tech.com/?cat=28" target="_blank">联系我们</a>
						</dd>
						<dd>
							<a href="http://www.klht-tech.com/?cat=30" target="_blank">诚聘英才</a>
						</dd>
					</dl>
				</div>
			</div>
		</div>
		<div class="cp">
			<div>
				公司地址：深圳市高新技术产业园中区M3栋509 <span>邮编：518052</span>
			</div>
			<div>
				<span>电话：0755-21618957 21613834</span> <span>传真：0755-26738213</span>
				<span>全国统一咨询热线：4000-189-628</span>
			</div>
			<div>
				<a href="">2013-2015 科联汇通版权所有 粤ICP备13071908号-2</a>
			</div>
		</div>
		<!-- footer end -->
	</footer>
</body>
<script type="text/javascript">
	$(function() {

		$(".infoTitle dl dd .bigText").click(
				function() {
					$(".wrapLeft .infoContent,.wrapLeft .infoContentTwo").css(
							"font-size", "16px");
					$(this).addClass("noAct").siblings(".littleText")
							.removeClass("noAct");

				})

		$(".infoTitle dl dd .littleText").click(
				function() {
					$(".wrapLeft .infoContent,.wrapLeft .infoContentTwo").css(
							"font-size", "14px");
					$(this).addClass("noAct").siblings(".bigText").removeClass(
							"noAct");

				})

	})
</script>

</html>