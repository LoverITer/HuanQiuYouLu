<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>环球第二家园</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
	    <link rel="stylesheet" href="css/huanqiu.css" />
	    <style type="text/css">
	    	#news_content{ width: 1200px; margin: 0 auto; padding: 30px; border: 1px #F2F2F2 solid;}
	    	#news_content img{ max-width: 1000px;}
	    	
	    	#news_content h1{ line-height: 50px; font-size: 24px; font-weight: bold; color: #333;}
	    	#news_content h6{ line-height: 50px; font-size: 14px; color: #555; border-bottom: 1px #ccc dashed;}
	    	#news_content .contents{ font-size: 16px; line-height: 35px;}
	    </style>
	</head>
	<body>
		<div style="border-bottom: 1px #ccc solid; background: #FFF; width: 100%; z-index: 900;" id="outnav">
			
		 <%@include file="topnav.jsp" %>
	</div>
	<!--
    	作者：langyamoren@163.com
    	时间：2018-08-14
    	描述：
    -->
    <!--
    	作者：langyamoren@163.com
    	时间：2018-08-15
    	描述：图片 banner
    -->
	<div id="new_banner">
		<img src="img/kaochabanner.jpg" width="100%" />
	</div>
	<!--
    	作者：langyamoren@163.com
    	时间：2018-08-15
    	描述：面包导航
    -->
	<div  style="height: 40px; background: #F2F2F2;">
		<div style="width: 1200px; margin: 0 auto;">
			 <ol class="pathnav">
			  <li><a href="#">首页</a></li>
			  <li><a href="#">海外考察</a></li>
			  <li>&nbsp;${travel.title}</li>
			</ol>
			<div style="clear: both;"></div>
		</div>
	</div>
	<!--
    	作者：langyamoren@163.com
    	时间：2018-08-15
    	描述：文章内容
    -->
	<div id="news_content">
		<h1>${travel.title}</h1>
		<h6><b>出发地：</b>${travel.city } &nbsp; &nbsp;<b>考察城市：</b>${travel.visitcity } &nbsp; &nbsp;<b>出发时间：</b>${travel.depart}</h6>
		
		<div class="contents">
			${travel.content}
		</div>
	</div>
	
		  
     <!--
 	作者：langyamoren@163.com
 	时间：2018-08-14
 	描述：页脚
 -->
<%@include file="foot.jsp" %>
	</body>
</html>
