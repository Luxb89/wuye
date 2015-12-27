<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="jsp/mobile/static/css/template/reset.css?2014-03-07-1" media="all" />

		<link rel="stylesheet" type="text/css" href="jsp/mobile/static/css/template/snower.css?2014-03-07-1" media="all" />

		<link rel="stylesheet" type="text/css" href="jsp/mobile/static/css/template/common.css?2014-03-07-1" media="all" />
		
<link rel="stylesheet" type="text/css" href="jsp/mobile/static/css/template/home-19.css?2014-03-07-1" media="all" />
		
<link rel="stylesheet" type="text/css" href="jsp/mobile/static/css/template/home-menu-2.css?2014-03-07-1" media="all" />

		<script type="text/javascript" src="jsp/mobile/static/src/template/maivl.js?2014-03-07-1"></script>

		<script type="text/javascript" src="jsp/mobile/static/src/jQuery.js?2014-03-07-1"></script>
		
<script type="text/javascript" src="jsp/mobile/static/src/template/swipe.js?2014-03-07-1"></script>
		
<script type="text/javascript" src="jsp/mobile/static/src/template/zepto.js?2014-03-07-1"></script>
		
<title>业主用户主菜单菜单</title>
		<meta name="Keywords" content="微网站模板,微官网模板,微信网站模板,微信微官网,手机网站模板" />
        <meta name="Description" content="模板之家提供微网站模板,微官网模板,微信网站模板下载和学习" />
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
		<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">        
        <!-- Mobile Devices Support @begin -->
            <meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
            <meta content="no-cache,must-revalidate" http-equiv="Cache-Control">
            <meta content="no-cache" http-equiv="pragma">
            <meta content="0" http-equiv="expires">
            <meta content="telephone=no, address=no" name="format-detection">
            <meta name="apple-mobile-web-app-capable" content="yes" /> <!-- apple devices fullscreen -->
            <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
        <!-- Mobile Devices Support @end -->
        <link rel="shortcut icon" href="static/img/favicon.ico" />
    </head>
    <body onselectstart="return true;" ondragstart="return false;">
        
<link rel="stylesheet" type="text/css" href="wm-xin-a/font-awesome.css?v=2014032314" media="all" />

<div class="body">
		<!--
	幻灯片管理
	-->
	<div style="-webkit-transform:translate3d(0,0,0);">
		<div id="banner_box" class="box_swipe">
			<ul>
									<li>
												<a onClick="return false;">
																<img src="jsp/mobile/img/static/70/68/52/image/20131206/20131206112457_17865.jpg" alt="1" style="width:100%;" />
								</a>
					</li>
									<li>
												<a onClick="return false;">
																<img src="jsp/mobile/img/static/70/68/52/image/20131206/20131206112511_46655.jpg" alt="2" style="width:100%;" />
								</a>
					</li>
									<li>
												<a onClick="return false;">
																<img src="jsp/mobile/img/static/70/68/52/image/20131206/20131206112526_12821.jpg" alt="3" style="width:100%;" />
								</a>
					</li>
									<li>
												<a onClick="return false;">
																<img src="jsp/mobile/img/static/70/68/52/image/20131206/20131206112540_36636.jpg" alt="4" style="width:100%;" />
								</a>
					</li>
									<li>
												<a onClick="return false;">
																<img src="jsp/mobile/img/static/70/68/52/image/20131206/20131206112553_48561.jpg" alt="5" style="width:100%;" />
								</a>
					</li>
									<li>
												<a onClick="return false;">
																<img src="jsp/mobile/img/static/70/68/52/image/20131206/20131206112606_68393.jpg" alt="6" style="width:100%;" />
								</a>
					</li>
									<li>
												<a onClick="return false;">
																<img src="jsp/mobile/img/static/70/68/52/image/20131206/20131206112619_85732.jpg" alt="7" style="width:100%;" />
								</a>
					</li>
							</ul>
			<ol>
									<li class="on"></li>
									<li ></li>
									<li ></li>
									<li ></li>
									<li ></li>
									<li ></li>
									<li ></li>
							</ol>
		</div>
	</div>
		<script>
		$(function(){
			new Swipe(document.getElementById('banner_box'), {
				speed:500,
				auto:3000,
				callback: function(){
					var lis = $(this.element).next("ol").children();
					lis.removeClass("on").eq(this.index).addClass("on");
				}
			});
		});
	</script>
<br/><header>
        <div class="snower">
            <script type="text/javascript"></script>
            <script type="text/javascript" src="static/src/template/snower.js"></script>
        </div>
    </header>             <section>
            <a href="tel:027-65681888" class="link_tel icon-phone">027-65681888</a>
        </section>
        		<!--
		用户分类管理
		-->
		<section>
            <ul class="list_ul">
                                    <li>
													<a href="index_xc.html">
													<figure>
								<div>
									<img src="jsp/mobile/img/static/70/68/52/image/20131223/20131223144806_92304.jpg" />
								</div>
								<figcaption>
									缴费查询									<p>缴费查询</p>
								</figcaption>
							</figure>
                        </a>
                    </li>
                                    <li>
													<a href="car_try.html">
													<figure>
								<div>
									<img src="jsp/mobile/img/static/70/68/52/image/20131204/20131204111443_16383.jpg" />
								</div>
								<figcaption>
									意见建议									<p>意见建议</p>
								</figcaption>
							</figure>
                        </a>
                    </li>
                                    <li>
													<a href="car_surprise.html">
													<figure>
								<div>
									<img src="jsp/mobile/img/static/70/68/52/image/20131220/20131220171802_13989.jpg" />
								</div>
								<figcaption>
									自助抄表									<p>自助抄表</p>
								</figcaption>
							</figure>
                        </a>
                    </li>
                                    <li>
													<a href="car_try.html">
													<figure>
								<div>
									<img src="jsp/mobile/img/static/70/68/52/image/20131206/20131206165645_50337.jpg" />
								</div>
								<figcaption>
									售后预约									<p>售后预约</p>
								</figcaption>
							</figure>
                        </a>
                    </li>
                                    <li>
													<a href="car_know_detail.html">
													<figure>
								<div>
									<img src="jsp/mobile/img/static/70/68/52/image/20131220/20131220134758_94272.jpg" />
								</div>
								<figcaption>
									用车常识									<p>用车常识</p>
								</figcaption>
							</figure>
                        </a>
                    </li>
                            </div>
        </section>
    </div>

<!--
导航菜单
   后台设置的快捷菜单
-->
			<!-- 				<div class="top_bar footer_bar" style="-webkit-transform:translate3d(0,0,0)">
			<nav>
				<ul class="top_menu">
					<li onClick="location.reload();"><span></span></li>首页：刷新
																<li>
															<a href="tel:027-65681888">
									<span class="icon-phone"></span><label class="homemenu_text">电话</label>
								</a>
													</li>
														</ul>
			</nav>
		</div> -->
	
<!--
分享前控制
-->
	<script type="text/javascript">
		window.shareData = {
			"imgUrl": "img/static/70/68/52/image/20131128/20131128103949_89475.jpg",
			"timeLineLink": "weisite/home?pid=24137&bid=32449&wechatid=fromUsername&wxref=mp.weixin.qq.com",
			"sendFriendLink": "weisite/home?pid=24137&bid=32449&wechatid=fromUsername&wxref=mp.weixin.qq.com",
			"weiboLink": "weisite/home?pid=24137&bid=32449&wechatid=fromUsername&wxref=mp.weixin.qq.com",
			"tTitle": "欢迎进入微官网",
			"tContent": "威汉微官网,欢迎进入。",
			"fTitle": "欢迎进入微官网",
			"fContent": "汽车微官网,欢迎进入。",
			"wContent": "汽车微官网,欢迎进入。"
		};
			</script>
        			<footer style="overflow:visible;">
				<div class="weimob-copyright" style="padding-bottom:50px;">
					<a href="weisite/home?pid=24137&bid=32449&wechatid=fromUsername&wxref=mp.weixin.qq.com">© 汽车行业微官网</a>
				</div>
									<span class="weimob-support" style="display:none;">©模板之家</span>
							</footer>
				<div mark="stat_code" style="width:0px; height:0px; display:none;">
					</div>
	</body>
		<script type="text/javascript">
function getShareApiRouter(){
	var str_domain = location.href.split('',4)[2];
	var tj_domain = '127.0.0.1';
	switch(str_domain){
		case 'www.js-css.cn':
			tj_domain = 'tj.js-css.cn';
			break;
		case '112.124.28.82':
			tj_domain = '112.124.28.82:400';
			break;
	}
	return tj_domain;
}
if(typeof(window.shareData) == 'undefined'){
	window.shareData = {
				"imgUrl": "", 
		"timeLineLink": "weisite/home?pid=24137&bid=32449&wechatid=fromUsername&_tj_pid=24137&_tt=2",
		"sendFriendLink": "weisite/home?pid=24137&bid=32449&wechatid=fromUsername&_tj_pid=24137&_tt=2",
		"weiboLink": "weisite/home?pid=24137&bid=32449&wechatid=fromUsername&_tj_pid=24137&_tt=2",
		"tTitle": document.title,
		"tContent": document.title,
		"fTitle": document.title,
		"fContent": document.title,
		"wContent": document.title
	}
}
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {	 
	// 发送给好友
	WeixinJSBridge.on('menu:share:appmessage', function (argv) {
		WeixinJSBridge.invoke('sendAppMessage', { 
			"img_url": window.shareData.imgUrl,
			"img_width": "640",
			"img_height": "640",
			"link": window.shareData.sendFriendLink,
			"desc": window.shareData.fContent,
			"title": window.shareData.fTitle
		}, function (res) {
			weimobAfterShare("",window.shareData.sendFriendLink,'appmessage');
			_report('send_msg', res.err_msg);
		})
	});

	// 分享到朋友圈
	WeixinJSBridge.on('menu:share:timeline', function (argv) {
		WeixinJSBridge.invoke('shareTimeline', {
			"img_url": window.shareData.imgUrl,
			"img_width": "640",
			"img_height": "640",
			"link": window.shareData.timeLineLink,
			"desc": window.shareData.tContent,
			"title": window.shareData.tTitle
		}, function (res) {
						//weimobAfterShare("",window.shareData.timeLineLink,'timeline');
			_report('timeline', res.err_msg);
		});
	});

	// 分享到微博
	WeixinJSBridge.on('menu:share:weibo', function (argv) {
		WeixinJSBridge.invoke('shareWeibo', {
			"content": window.shareData.wContent,
			"url": window.shareData.weiboLink
		}, function (res) {
			weimobAfterShare("",window.shareData.weiboLink,'weibo');
			_report('weibo', res.err_msg);
		});
	});
}, false);
</script>
</body>
</html>		