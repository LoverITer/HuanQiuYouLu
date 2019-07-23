<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>环球第二家园</title>

		<link rel="stylesheet" href="css/bootstrap.min.css" />
	    <link rel="stylesheet" href="css/huanqiu.css" />
	</head>
	<body>
		<div style="border-bottom: 1px #ccc solid; background: #FFF; width: 100%; z-index: 900;" id="outnav" class="full_screen">
		 <%@include file="topnav.jsp" %>
		 <div style="clear: both;"></div>
	</div>
	<!--
    	作者：langyamoren@163.com
    	时间：2018-08-14
    	描述：
    -->
    <div   id="imgadw"   style="clear: both;">
       <div class="carousel slide" id="carousel2">
                            <ol class="carousel-indicators">
                                <li data-slide-to="0" data-target="#carousel2" class="active"></li>
                                <li data-slide-to="1" data-target="#carousel2"></li>
                                <li data-slide-to="2" data-target="#carousel2" class=""></li>
                            </ol>
                            <div class="carousel-inner">
                               <c:forEach items="${focuspic}" var="focus" varStatus="aa">
                                    
	                                <div class="item <c:if test="${aa.index==0}">active</c:if>">
	                                    <img alt="image" width="100%" src="../uppics/focus/${focus.path}">
	                                    <div class="carousel-caption">
	                                       <!-- <p>This is simple caption 2</p>-->
	                                    </div>
	                                </div>
                               </c:forEach>
                  
                            </div>
                           <a data-slide="prev" href="carousel.html#carousel2" class="left carousel-control">
                                <span class="icon-prev"></span>
                            </a>
                            <a data-slide="next" href="carousel.html#carousel2" class="right carousel-control">
                                <span class="icon-next"></span>
                            </a>
                        </div>
    </div>
	<!--
    	作者：langyamoren@163.com
    	时间：2018-08-14
    	描述：广告结束
    -->
   <div id="ousfocus">
   	  <div class="us_list">
   	  	   <span class="glyphicon glyphicon-home"></span>
   	  	   <h5>100%楼盘公司直营</h5>
   	  	   <p>
   	  	   	在起飞页自助建站平台，您不需要任何编程基础，就能做出功能强大，效果出
   	  	   </p>
   	  </div>
   	  
   	  <div class="us_list">
   	  	   <span class="glyphicon glyphicon-fire"></span>
   	  	   <h5>100%楼盘公司直营</h5>
   	  	   <p>
   	  	   	在起飞页自助建站平台，您不需要任何编程基础，就能做出功能强大，效果出
   	  	   </p>
   	  </div>
   	  
   	  <div class="us_list">
   	  	   <span class="glyphicon glyphicon-leaf"></span>
   	  	   <h5>100%楼盘公司直营</h5>
   	  	   <p>
   	  	   	在起飞页自助建站平台，您不需要任何编程基础，就能做出功能强大，效果出
   	  	   </p>
   	  </div>
   	  
   	  <div class="us_list">
   	  	   <span class="glyphicon glyphicon-globe"></span>
   	  	   <h5>100%楼盘公司直营</h5>
   	  	   <p>
   	  	   	在起飞页自助建站平台，您不需要任何编程基础，就能做出功能强大，效果出
   	  	   </p>
   	  </div>
   </div>
   <!--
   	作者：langyamoren@163.com
   	时间：2018-08-14
   	描述：特点结束
   -->
   <div id="kaochantuan">
   	  <div class="bigtitle">
   	  	  <h3><span>海外</span>考察团</h3>
   	     <p>每天都期待与您一起旅行，买房</p>
   	  </div>
   	  
   	  <div  class="kaocha_row">
   	  <c:forEach items="${travels}" var="tra">
   	     <div class="kaocha_list">
   	  	  	<a href="kaocha_${tra.id}.html">
   	  	  	  <img src="${tra.pic}" width="570" height="295" />
   	  	  	  </a>
   	  	  	  <h3><a href="kaocha_${tra.id}.html">${tra.title }</a> </h3>
   	  	  	 <span>报名中</span>
   	  	  	 <ul>
   	  	  	 	<li>时间：${tra.depart}日&nbsp;&nbsp;&nbsp;&nbsp;${tra.city}出发</li>
   	  	  	 	<li>访问城市：${tra.visitcity}</li>
   	  	  	 </ul>
   	  	  	  <a href="kaocha_${tra.id}.html"  class="baomingbutn">报名参加</a>
   	  	  </div>
   	  </c:forEach>
   	  	 
   	  </div>
   	   <div class="kaocha_more" style="clear: both; text-align: center;">
   	   	 <span>咨询电话：132 9902 5577</span>
   	      <!--   <a href="#">更多旅行&gt;&gt;</a> -->
   	          
        </div>
   </div>
   
   <!--
   	作者：langyamoren@163.com
   	时间：2018-08-14
   	描述： 以下是海外购房
   -->
   
   <div style="background: #EEE; margin: 20px 0; padding: 20px;"  class="full_screen"> 
   	  <div class="bigtitle">
   	   	<h3><span>海外</span>购房</h3>
   	     <p>只为您挑选全球好房源</p>
   	   </div>
	   	<div id="haiwaigoufang">
	   	   <ul>
	   	   	 <li><a href="#" style="color:#0072E4; border-bottom: 2px #0072E4 solid;">精选</a></li>
	   	   	 
	   	   	   <c:forEach items="${countrys}" var="cot">
		 			    <li><a href="houses?cid=${cot.id}">${cot.name}</a></li>
		 	  </c:forEach>
	   	   	 <li><a href="houses">更多房源</a></li>
	   	   </ul>
	   	   <div style="clear: both; height: 15px;"></div>
	   	   <div id="house_contents">
	   	      <c:forEach items="${houses}" var="house">
	   	   	   <div class="house_list">
	   	   	   	  <a href="house_${house.id}.html">
	   	   	   	  <img src="${house.pic}" width="380" height="215" />
	   	   	   	  </a>
	   	   	   	  <p class="location"><span class="glyphicon glyphicon-map-marker"></span>${house.area}</p>
	   	   	   	  <h3><a href="housecontent?id=${house.id}">${house.name}</a></h3>
	   	   	   	  <div class="bot_kuang">
	   	   	   	  	<p>总价：<span>${house.price_rmb}万起</span></p>
	   	   	   	  	<p>${house.feature}</p>
	   	   	   	  </div>
	   	   	   	  
	   	   	   </div>
	   	   	   </c:forEach>

	   	   </div>
	   	   
	   	   <div style="clear: both;"><!--房产列表清除浮动---></div>
	   </div>
   </div>
   <!--
   	作者：langyamoren@163.com
   	时间：2018-08-14
   	描述：以下是海外咨询
   -->
   <div id="haiwaizx">
   	   <div class="bigtitle">
   	   	<h3><span>海外</span>资讯</h3>
   	     <p>实时发布海外房产资讯</p>
   	   </div>
   	   <div id="news_content">
   	   	  <div class="left">
   	   	  	  <img src="img/leftadw.jpg" />
   	   	  </div>
   	   	  <div class="right">
   	   	  
   	   	  <c:forEach items="${arts}" var="art">
   	   	            <div class="news_list">
   	   	  	    	<a href="news_${art.city_id}/news_${art.city_id}_${art.id}.html"><img src="${art.pic1}" width="160" height="100" /></a>
   	   	  	    	<span>2018-08-12</span>
   	   	  	    	<h1><a href="news_${art.city_id}/news_${art.city_id}_${art.id}.html">${art.title}</a></h1>
   	   	  	    	<p><a href="news_${art.city_id}/news_${art.city_id}_${art.id}.html">
   	   	  	    	  <c:set value="${art.content}" var="temcont" scope="request"></c:set>
   	   	  	    	  
   	   	  	    	  <%
   	   	  	    	  String temstr=(String)request.getAttribute("temcont");
   	   	  	  String txtcontent = temstr.replaceAll("</?[^>]+>", ""); //剔出<html>的标签  
   	         txtcontent = txtcontent.replaceAll("<a>\\s*|\t|\r|\n</a>", "");
   	        out.println(txtcontent);
   	   	  	    	  %>
   	   	  	    	 
   	   	  	    	</a>
   	   	  	    	</p>
   	   	  	       </div>
   	   	  </c:forEach>
   	   	  	
   	   	  </div>
   	   </div>
   </div>
   <!--
   	作者：langyamoren@163.com
   	时间：2018-08-14
   	描述：
   	成功案例
   -->
<div style="background: #EEE; margin: 20px 0; padding: 20px;"  class="full_screen">
	 <div class="bigtitle">
   	   	<h3><span>成功</span>案例</h3>
   	     <p>帮助客户成功买到理想的房子</p>
   	   </div>
   <div id="success_case">
     <c:forEach items="${success}" var="su">
   	   <div class="success_list">
	   	   
			   	   	  <div class="topimg">
				   	   	  	<img src="${su.pic1}" width="385" height="180" class="topimg"/>
				   	   	  	<div>
					   	   	  	<h5>选购项目：</h5>
					   	   	  	<h6>${su.house}</h6>
				   	   	  	</div>
			   	   	  </div>
			   	   	  <div class="personcase">
			   	   	  	 <img src="${su.pic2}" width="55" height="55"  style="border-radius: 27px; float: left;" />
			   	   	  	 <h6>
			   	   	  	 	${su.name}<br />
			   	   	  	 	${su.why}
			   	   	  	 </h6>
			   	   	  	 <p>
			   	   	  	 	${su.dis}
			   	   	  	 </p>
			   	   	  </div>
	   	   	  
   	   </div>
   	  </c:forEach>
   	     <!--  <div class="success_list">
	   	   	  <a href="#">
			   	   	  <div class="topimg">
				   	   	  	<img src="img/1-1f62gq404j2.jpg" width="385" height="180" class="topimg"/>
				   	   	  	<div>
					   	   	  	<h5>选购项目：</h5>
					   	   	  	<h6>碧桂园 森林城市</h6>
				   	   	  	</div>
			   	   	  </div>
			   	   	  <div class="personcase">
			   	   	  	 <img src="img/a1.jpg" width="55" height="55"  style="border-radius: 27px; float: left;" />
			   	   	  	 <h6>
			   	   	  	 	李先生<br />
			   	   	  	 	只为成全孩子留美就业小梦想
			   	   	  	 </h6>
			   	   	  	 <p>
			   	   	  	 	先生经营的传媒公司自成立以来，成长状况非常乐观，但企业各项缴税金额较低，世通国际专家分析后认为，W先生的公司经营
			   	   	  	 </p>
			   	   	  </div>
	   	   	  </a>
   	   </div>
   	   
   	      <div class="success_list">
	   	   	  <a href="#">
			   	   	  <div class="topimg">
				   	   	  	<img src="img/1-1f62gq404j2.jpg" width="385" height="180" class="topimg"/>
				   	   	  	<div>
					   	   	  	<h5>选购项目：</h5>
					   	   	  	<h6>碧桂园 森林城市</h6>
				   	   	  	</div>
			   	   	  </div>
			   	   	  <div class="personcase">
			   	   	  	 <img src="img/a1.jpg" width="55" height="55"  style="border-radius: 27px; float: left;" />
			   	   	  	 <h6>
			   	   	  	 	李先生<br />
			   	   	  	 	只为成全孩子留美就业小梦想
			   	   	  	 </h6>
			   	   	  	 <p>
			   	   	  	 	先生经营的传媒公司自成立以来，成长状况非常乐观，但企业各项缴税金额较低，世通国际专家分析后认为，W先生的公司经营
			   	   	  	 </p>
			   	   	  </div>
	   	   	  </a>
   	   </div> -->
   	   
   	   <div style="clear: both;"></div>
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
