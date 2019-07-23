<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	    	#news_content h6{ line-height: 50px; font-size: 14px; color: #666; border-bottom: 1px #ccc solid}
	    	#news_content .contents{ font-size: 16px; line-height: 40px; }
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
		<img src="img/news_banner.jpg" width="100%" />
	</div>
	<!--
    	作者：langyamoren@163.com
    	时间：2018-08-15
    	描述：面包导航
    -->
	<div  style="height: 40px; background: #F2F2F2;">
		<div style="width: 1200px; margin: 0 auto;">
			 <ol class="pathnav">
			  <li><a href="index.html">首页</a></li>
			  <li><a href="artlist">海外资讯</a></li>
			  <li>关于我们</li>
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
		 <div style="flot:left;">
		 西安科创房地产营销策划有限公司<br/>
陕西棕榈海岸置业有限公司<br/><br/>

打造“环球第二家园”旅居地产第一品牌；<br/>
总部设在西安，下设事业推广部和网络开发运营推广部；<br/>
西安科创成立于2015.3月；<br/>
陕西棕榈成立于2016.3月；<br/>
2016年销售额8千万，2017年销售额3.8亿，2018年1-8月销售额6.5亿；<br/>
现有员工人数220多人；<br/>
云南昆明和海南海口营销分公司2017年9月成立并运营；<br/>
河南新乡分公司2018年6月成立并运营；<br/>
陕西延安，四川南充，辽宁丹东，江苏连云港，各省样板分公司筹备中；<br/>
</div>
  <img src="imgus/pic01.jpg" style="float:left; width:30%;height:30%;margin:25px;"/>
  <img src="imgus/pic02.jpg" style="float:left; width:30%;height:30%;margin:25px;"/>

<div style="clear: both;"></div>
<div style="flot:left;">
我们是一家旅居地产综合服务提供商，致力于为客户提供最完善的投资咨询服务，一站式服务，打造旅居地产第一品牌“环球第二家园”，为成功人士规划全球资产，做每个人都能买得起的好房子。<br/>
选择一个居所，静、可聆听己心！动、则尽阅繁华，匠心精筑，第二家园给心一个归宿...<br/>
我们一直渴望着，老了之后我们一起远离都市的喧嚣，<br/>
去往我们一直向往的城市购买或是建造一座小院。<br/>
小院周边没有车水马龙，更没有闪烁的霓虹；<br/>
也不会再有那朝九晚五，<br/>
也看不到那些行色焦虑的匆匆人群。<br/>
心若没有栖息的地方，<br/>
到哪里都是在流浪。<br/>
寻一方庭院，<br/>
过第二人生。<br/>
得第二家园，<br/>
享幸福人生。<br/>
		 </div>
		 <img src="imgus/pic03.jpg" style="float:left;margin:25px; width:25%;height:25%;"/>
		 <img src="imgus/pic04.jpg" style="float:left;margin:25px; width:25%;height:25%;"/>
		 <img src="imgus/pic05.jpg" style="float:left;margin:25px; width:25%;height:25%;"/>
	</div>
	<div style="clear:both;"></div>
		  
     <!--
 	作者：langyamoren@163.com
 	时间：2018-08-14
 	描述：页脚
 -->
<%@include file="foot.jsp" %>
	</body>
</html>
