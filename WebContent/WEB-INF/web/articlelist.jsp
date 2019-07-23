<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>环球第二家园-海外房产</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
	    <link rel="stylesheet" href="css/huanqiu.css" />
	    <style type="text/css">
	           #news_block{ width: 1200px; margin: 0 auto;}
	           
	           #news_block ul.country_menu{ list-style: none;}
	            #news_block ul.country_menu li{ float: left; margin-right: 1px;}
	            #news_block ul.country_menu li a{ display: block; line-height: 25px; padding: 6px 20px; color: #000000; background: #F4F4F4; text-decoration: none;}
	            #news_block ul.country_menu li a:hover{ border-bottom: 2px #0072E4 solid; color:#0072E4 ;}
	            #news_block ul.country_menu li:first-of-type a{border-bottom: 2px #0072E4 solid; color:#0072E4 ;}
	            
	           #news_block  #news_list_block{ margin-top: 10px;}
	           #news_block  #news_list_block .left{width: 880px; float: left;  height: 1000px;}
	           #news_block  #news_list_block .right{width: 300px; float: right;  height: 1000px;}
	           
	          #news_block  #news_list_block .left .news_list{width: 880px; height: 125px; margin-bottom: 20px;}
	          #news_block  #news_list_block .left .news_list:hover{ padding-left: 10px; background: #F7F7F7;}
	          #news_block  #news_list_block .left .news_list img{ float: left; width: 200px; height: 125px; margin-right: 10px;}
	           #news_block  #news_list_block .left .news_list div{ float: left; width: 640px; height: 125px;}
	           #news_block  #news_list_block .left .news_list div h1 { line-height: 18px;}
	           #news_block  #news_list_block .left .news_list div h1 a{ font-size: 18px; font-weight: bold; text-decoration: none; color: #333;}
	             #news_block  #news_list_block .left .news_list div h1 a:hover{text-decoration: underline;}
	             #news_block  #news_list_block .left .news_list div p{ margin-top: 15px; height: 76px; width: 640px; overflow: hidden; font-size: 12px; line-height: 24px; 
	             text-overflow: ellipsis;  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;}
  #news_block  #news_list_block .left .news_list div p a{ text-decoration: none; color: #666;}
  
  
   #news_block  #news_list_block .right h3{ font-size: 18px; line-height: 40px; border-bottom: 2px #F1F1F1 solid; padding-left: 10px;}
   #news_block  #news_list_block .right ul{ list-style: none; padding-left: 10px; margin-top: 10px;}
   #news_block  #news_list_block .right ul li{ border-bottom: 1px #CCC dashed; counter-increment: list;  line-height: 40px;  overflow: hidden; text-overflow: ellipsis; white-space:nowrap; }
   
   #news_block  #news_list_block .right ul li a{ font-size:12px;  color: #333; text-decoration: none; }
  #news_block  #news_list_block .right ul li:before{margin-right: 10px; content: counter(list);  padding: 0 5px; font-size: 12px; border-radius:3px; background: #ff0000; color: #FFF; }
   #news_block  #news_list_block .right ul li a:hover{ text-decoration: underline;}
	    </style>
	</head>
	<body>
		<div style="border-bottom: 1px #ccc solid; background: #FFF; width: 100%; z-index: 900;" id="outnav">
			
		 <%@include file="topnav.jsp" %>
	</div>
	<!--
    	作者：langyamoren@163.com
    	时间：2018-08-15
    	描述：图片 banner
    -->
	<div id="new_banner">
		<img src="img/news_banner.jpg" width="100%" />
	</div>
	
	<div id="news_block">
		   <ol class="pathnav">
			  <li><a href="index.html">首页</a></li>
			  <li><a href="artlist">海外资讯</a></li>
			  <li>资讯列表</li>
			</ol>
			<div style="clear: both;"></div>

			<ul class="country_menu">
				<li><a href="#">全部</a></li>
				  <c:forEach items="${countrys}" var="cot">
		 			     <li><a href="artlist?cid=${cot.id}">${cot.name}</a></li>
		 			   </c:forEach>
				
			</ul>
			
			<div style="clear: both;"></div>
			
			<div id="news_list_block">
				  <div class="left">
				    	<c:forEach items="${pd.list}" var="ars">
						  	  <div class="news_list">
						  	  	   <a href="news_${ars.city_id}/news_${ars.city_id}_${ars.id}.html"><img src="${ars.pic1}" width="200" height="125" /></a>
						  	  	   <div>
						  	  	   	  <h1><a href="news_${ars.city_id}/news_${ars.city_id}_${ars.id}.html">${ars.title}</a></h1>
						  	  	   	  <p><a href="news_${ars.city_id}/news_${ars.city_id}_${ars.id}.html">
						  	  	   	  <c:set value="${ars.content}" var="temcont" scope="request"></c:set>
   	   	  	    	  
   	   	  	    	  <%
   	   	  	    	  String temstr=(String)request.getAttribute("temcont");
   	   	  	  String txtcontent = temstr.replaceAll("</?[^>]+>", ""); //剔出<html>的标签  
   	         txtcontent = txtcontent.replaceAll("<a>\\s*|\t|\r|\n</a>", "");
   	        out.println(txtcontent);
   	   	  	    	  %>
						  	  	   	  </a></p>
						  	  	   </div>
						  	  	   
						  	  </div>
				  	  </c:forEach>
				 
				  	  
				  	  
				  	  
				  </div><!--left end-->
				  <div class="right">
					  	 <!-- <h3>热点关注</h3>
					  	 <ul>
					  	 	<li><a href="news_content.html">全程在线化！有路创造房产交易新模式！创造房产交易新模式！</a></li>
					  	 	<li><a href="news_content.html">全程在线化！有路创造房产交易新模式！</a></li>
					  	 	<li><a href="news_content.html">全程在线化！有路创造房产交易新模式！</a></li>
					  	 	<li><a href="news_content.html">全程在线化！有路创造房产交易新模式！</a></li>
					  	 	<li><a href="news_content.html">全程在线化！有路创造房产交易新模式！</a></li>
					  	 	<li><a href="news_content.html">全程在线化！有路创造房产交易新模式！</a></li>
					  	 	<li><a href="news_content.html">全程在线化！有路创造房产交易新模式！</a></li>
					  	 	<li><a href="news_content.html">全程在线化！有路创造房产交易新模式！</a></li>
					  	 	<li><a href="news_content.html">全程在线化！有路创造房产交易新模式！</a></li>
					  	 	<li><a href="news_content.html">全程在线化！有路创造房产交易新模式！</a></li>
					  	 </ul>
					  	 <div style="clear: both;"></div> -->
					  	 <div>
					  	 	<img src="img/news_adwlist.jpg" />
					  	 		<img src="img/news_adwlist.jpg" />
					  	 </div>
				  </div><!--right end--->
				   <div style="clear: both;"></div>
				   <!--分页-->
				   <div>
				   	<nav> 
										  <ul class="pagination" >
										    <li>
										 
										    <c:choose>
										      <c:when test="${(pd.pageNo-1)>0 }">
										         <a href="artlist?cid=${cid}&pageNo=${pd.pageNo-1}" aria-label="Previous">
										      </c:when>
										      <c:otherwise>
										       <a href="artlist?cid=${cid}&pageNo=1" aria-label="Previous">
										      </c:otherwise>
										    </c:choose>
										     
										        <span aria-hidden="true">上一页</span>
										      </a>
										    </li>
										    <c:forEach begin="${pd.start}" end="${pd.end}" var="ss">
										     <li><a href="artlist?cid=${cid}&pageNo=${ss}">${ss}</a></li>
										    </c:forEach>

										    <li>
										      
										       <c:choose>
										      <c:when test="${(pd.pageNo+1)<pd.totalPage }">
										        <a href="artlist?cid=${cid}&pageNo=${pd.pageNo+1}" aria-label="Next">
										      </c:when>
										      <c:otherwise>
										      <a href="artlist?cid=${cid}&pageNo=${pd.totalPage}" aria-label="Next">
										      </c:otherwise>
										    </c:choose>
										      
										        <span aria-hidden="true">下一页</span>
										      </a>
										    </li>
										  </ul>
					</nav>
				   </div>
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
