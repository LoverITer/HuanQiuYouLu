<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>环球第二家园-国家</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
	    <link rel="stylesheet" href="css/huanqiu.css" />
	    <style type="text/css">
	    	
	    	#country_top_pic{ width: 1200px; margin: 0 auto;}
	    	#country_top_pic .c_left{ width: 760px; height: 510px; float: left; }
	    	#country_top_pic .c_right{ width: 430px; height: 510px; float: right; background: url(${country.pic}) no-repeat;}
	    	#country_top_pic .c_right #country_desc{width: 430px; height: 510px;  background: rgba(0,0,0,.6);}
	    	#country_top_pic .c_right #country_desc h1{ border-bottom: 1px #FFF solid; line-height: 60px; letter-spacing: 5PX; color: #FFF; font-family:"zhonghei","微软雅黑"; font-size: 30px; padding-top: 30px; padding-left: 25px;}
	        #country_top_pic .c_right #country_desc h1 small{ margin-left: 20px; color: #FFF; letter-spacing: 5px; font-size: 24px;}
	        #country_top_pic .c_right #country_desc  ol { padding-left: 50px; padding-top: 30px;   overflow: hidden; }
	         #country_top_pic .c_right #country_desc  ol li{ color: #FFF; font-size: 18px; margin-bottom: 10px;  line-height: 40px; counter-increment: list; position: relative; }
	         #country_top_pic .c_right #country_desc  ol li:before{ content:"("counter(list)"):"; position: absolute; left: -40px;}
	         
	         
	         #house_zhinan{width: 1200px; margin: 10px auto;}
	         #house_zhinan #zhinan_menu{ border-bottom: 1px #F4F4F4 solid; height: 40px;}
	         #house_zhinan #zhinan_menu li{ float: left;}
	         #house_zhinan #zhinan_menu li a{ display: block; height: 40px; line-height: 40px; text-decoration: none; color: #333; background: #F4F4F4; padding: 0 20px;}
	         #house_zhinan #zhinan_menu li a:hover{ background: orangered; color: #FFF; position: relative;}
	         #house_zhinan #zhinan_menu li a:hover:after{ content: ""; border: 6px #000 solid; border-color: rgba(0,0,0,0); border-top:6px orangered solid; position: absolute; top: 100%;  left: 40%;}
	         
	         #house_zhinan #zhinan_menu li a.act{ background: orangered; color: #FFF; position: relative;}
	         #house_zhinan #zhinan_menu li a.act:after{ content: ""; border: 6px #000 solid; border-color: rgba(0,0,0,0); border-top:6px orangered solid; position: absolute; top: 100%;  left: 40%;}
	    
	    
	         #house_zhinan #zhinan_block{ margin-top: 15px;}
	         #house_zhinan #zhinan_block .zhinan_list{ width: 580px; height: 110px; position: relative;  float: left; margin-right: 20px; margin-bottom: 20px;}
	         #house_zhinan #zhinan_block .zhinan_list img{ position:absolute; left:0; top:0;width: 130px; height: 110px;}
	         #house_zhinan #zhinan_block .zhinan_list h3{ position:absolute; left:140px; top:5px; font-size: 16px; font-weight: bold; width: 430px; overflow: hidden;white-space: nowrap;text-overflow: ellipsis; }
	         #house_zhinan #zhinan_block .zhinan_list h3 a{ text-decoration: none; color: #333;}
	         #house_zhinan #zhinan_block .zhinan_list h3 a:hover{ text-decoration: underline;}
	         #house_zhinan #zhinan_block .zhinan_list p{ position: absolute; left: 140px; top: 35px; width: 430px; height: 50px; overflow: hidden; font-size: 12px;text-overflow: ellipsis;  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;}
  #house_zhinan #zhinan_block .zhinan_list label{position: absolute; left: 480px; top: 86px;  font-size: 12px; color: #666;}
  
  
  /*房子列表*/
 #housesearch_list{ width: 1200px; margin: 0 auto;}
	    	#housesearch_list h5{ border-bottom:1px #ccc dashed; font-size: 20px; line-height: 40px; padding-left: 20px;}
	    	#housesearch_list h5 a{ margin-left: 20px; font-size: 14px; color: #333; text-decoration: none;}
	    	#housesearch_list h5 a:hover{ text-decoration: underline;}
	    	
	    	#housesearch_list .houselist_v{ width: 1200px; height: 240px; }
	    	#housesearch_list .houselist_v:hover{ padding-left: 20px; background:  #F4F4F4;}
	    	#housesearch_list .houselist_v .left{ width: 300px; height: 240px; float: left;}
	    	#housesearch_list .houselist_v .right{ width: 880px; height: 240px;  float: left; position: relative;}
	    	
	    	#housesearch_list .houselist_v .left img{  width: 280px; height: 200px; margin-top: 20px;}
	    	
	    	#housesearch_list .houselist_v .right h1{ position: absolute; left: 0; top: 18px; font-size: 24px; line-height: 25px; font-weight: bold;}
	    	#housesearch_list .houselist_v .right h1 a{ color: #555; text-decoration: none;}
	    	#housesearch_list .houselist_v .right h1 a:hover{ text-decoration: underline;}
	    	#housesearch_list .houselist_v .right p.tedian{ position: absolute; left: 0; top: 60px; font-size: 14px;  color: #444;}
	    	#housesearch_list .houselist_v .right p.weizhi{ position: absolute; left: 0px; top: 110px; font-size: 12px; color: #666; }
	    	#housesearch_list .houselist_v .right p.jiazhi{ position: absolute; left: 0; top: 150px; font-size: 14px; }
	    	#housesearch_list .houselist_v .right p.jiazhi>span{ font-weight: bold; color: #F00;}
	    	#housesearch_list .houselist_v .right p.focustedian{ position: absolute; left: 0; top: 190px; font-size: 12px;}
	    	#housesearch_list .houselist_v .right p.focustedian>span{ border: 1px #CCC solid; margin-right: 15px; border-radius: 12px; padding: 3px 10px; background: #FFF;}
	    	#housesearch_list .houselist_v .right p.price{ text-align: center; font-size: 20px; font-weight: bold; color: #FF0000; position: absolute; left: 660px; top: 80px;}
	        #housesearch_list .houselist_v .right p.price span{ font-size: 16px; font-weight: 500; color: #999;}
	        #housesearch_list .houselist_v .right a.housedetil{ position: absolute; left: 670px; top: 185px; display: block; padding: 10px 25px; border-radius: 10px; background: orangered; color: #FFF; text-decoration: none; letter-spacing: 5px;}
	        #housesearch_list .houselist_v .right a.housedetil:hover{ background: #FF724F;}
	        
	        
	        #house_02,#house_03{ display: none;}
	   
	    </style>
	</head>
	<body>
		<div style="border-bottom: 1px #ccc solid; background: #FFF; width: 100%; z-index: 900;" id="outnav">
			
		 <%@include file="topnav.jsp" %>
	</div>
	<!--
    	作者：langyamoren@163.com
    	时间：2018-08-14
    	描述：以下是国家的轮播图
    -->
    
    <div style="width: 100%; background: #EEE;">
    	<div id="country_top_pic">
    		<div class="c_left">
    			 <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
  <c:forEach items="${cityspic}" var="cpic" varStatus="aa">
		  <div class="item <c:if test="${aa.index==0}">active</c:if>">
		      <img src="../uppics/citys/${cpic.path}" alt="${cpic.dis}"  width="760" height="510"/>
		      <div class="carousel-caption">
		         <!--...-->
		      </div>
		    </div>
  </c:forEach>

  </div>

</div>
    			
    		</div><!--end left-->
    		<div class="c_right">
    			<div id="country_desc">
    				<h1>${country.name}<small>投资优势：</small></h1>
    				
    				${country.dis}
    				
    			</div>
    			
    		</div><!--end right-->
    		<div  style="clear: both;"></div>
    	</div>
    </div>
    
    <div style="clear: both;"></div>
    
    <!--
    	作者：langyamoren@163.com
    	时间：2018-08-17
    	描述：购房指南
    -->
    
    <div id="house_zhinan">
    	 <ul id="zhinan_menu">
    	 	<li><a data-ids="#house_01" href="#" class="act">购房指南</a></li>
    	 	<li><a data-ids="#house_02"  href="#" >生活百科</a></li>
    	 	<li><a data-ids="#house_03"  href="#" >最新资讯</a></li>
    	 </ul>
    	 <div style="clear: both;"></div>
    	 <div id="zhinan_block">
    	 	  <div id="house_01">
    	 	     <c:forEach items="${arts1}" var="art">
		    	 	 <div class="zhinan_list">
		    	 	  	 <a href="news_${art.city_id}/news_${art.city_id}_${art.id}.html"><img src="${art.pic1}"/></a>
		    	 	  	 <h3><a href="news_${art.city_id}/news_${art.city_id}_${art.id}.html">${art.title}</a></h3>
		    	 	  	 <p>	 
		    	 	  	  <c:set value="${art.content}" var="temcont" scope="request"></c:set>
   	   	  	    	  
   	   	  	    	  <%
   	   	  	    	  String temstr=(String)request.getAttribute("temcont");
   	   	  	  String txtcontent = temstr.replaceAll("</?[^>]+>", ""); //剔出<html>的标签  
   	         txtcontent = txtcontent.replaceAll("<a>\\s*|\t|\r|\n</a>", "");
   	        out.println(txtcontent);
   	   	  	    	  %>
   	   	  	    	 </p>
		    	 	  	 <label><fmt:formatDate pattern="yyyy-MM-dd" value="${art.ctimes}" /></label>
		    	 	  </div>
		    	 </c:forEach>
		    	 	
    	 	  </div>
    	 	  
    	 	   <div id="house_02">
		    	 	   <c:forEach items="${arts2}" var="art">
		    	 	 <div class="zhinan_list">
		    	 	  	 <a href="news_${art.city_id}/news_${art.city_id}_${art.id}.html"><img src="${art.pic1}"/></a>
		    	 	  	 <h3><a href="news_${art.city_id}/news_${art.city_id}_${art.id}.html">${art.title}</a></h3>
		    	 	  	 <p>  <c:set value="${art.content}" var="temcont" scope="request"></c:set>
   	   	  	    	  
   	   	  	    	  <%
   	   	  	    	  String temstr=(String)request.getAttribute("temcont");
   	   	  	  String txtcontent = temstr.replaceAll("</?[^>]+>", ""); //剔出<html>的标签  
   	         txtcontent = txtcontent.replaceAll("<a>\\s*|\t|\r|\n</a>", "");
   	        out.println(txtcontent);
   	   	  	    	  %></p>
		    	 	  	 <label><fmt:formatDate pattern="yyyy-MM-dd" value="${art.ctimes}" /></label>
		    	 	  </div>
		    	 </c:forEach>
    	 	  </div>
    	 	  
    	 	   <div id="house_03">
		    	 	   <c:forEach items="${arts3}" var="art">
		    	 	 <div class="zhinan_list">
		    	 	  	 <a href="news_${art.city_id}/news_${art.city_id}_${art.id}.html"><img src="${art.pic1}" /></a>
		    	 	  	 <h3><a href="news_${art.city_id}/news_${art.city_id}_${art.id}.html">${art.title}</a></h3>
		    	 	  	 <p>  <c:set value="${art.content}" var="temcont" scope="request"></c:set>
   	   	  	    	  
   	   	  	    	  <%
   	   	  	    	  String temstr=(String)request.getAttribute("temcont");
   	   	  	  String txtcontent = temstr.replaceAll("</?[^>]+>", ""); //剔出<html>的标签  
   	         txtcontent = txtcontent.replaceAll("<a>\\s*|\t|\r|\n</a>", "");
   	        out.println(txtcontent);
   	   	  	    	  %></p>
		    	 	  	 <label><fmt:formatDate pattern="yyyy-MM-dd" value="${art.ctimes}" /></label>
		    	 	  </div>
		    	 </c:forEach>
    	 	  </div>
    	 </div><!--end zhinan_block-->
    	
    </div>
    
    
    <div style="width: 1200px; margin: 25px auto;">
    	<img src="img/step5.jpg" />
    </div>
    <!--
    	作者：langyamoren@163.com
    	时间：2018-08-17
    	描述:以下是房列表
    -->
    
     <div id="housesearch_list">
        	<h5>${country.name}精选房源：
        	<c:forEach items="${citys}" var="ct">
        	 <a href="#">${ct.name}</a>
        	
        	</c:forEach>
        	</h5>
        	<c:forEach items="${pd.list}" var="hs">
        	<div class="houselist_v">
	        		<div class="left">
	        			<a href="house_${hs.id}.html"><img src="${hs.pic}" border="0" /></a>
	        		</div>
	        		<div class="right">
	        			<h1><a href="house_${hs.id}.html">${hs.name}</a></h1>
	        			<p class="tedian">${hs.feature}</p>
	        			<p class="weizhi"><span class="glyphicon glyphicon-map-marker"></span>${hs.area}</p>
	        			<p class="jiazhi">
	        				${hs.huxing} | ${hs.propertys} | 首付比例<span> ${hs.payment}%</span>
	        			</p>
	        			<p class="focustedian">
	        			<c:set var="string2" value="${fn:split(hs.types, ',')}" />
	        			<c:forEach items="${string2}" var="tt">
	        				<span>${tt}</span>
                        </c:forEach>
	        			</p>
	        			<p class="price">
	        				￥${hs.price_rmb}万
	        				<br />
	        				<span>${hs.price_other}</span>
	        			</p>
	        			<a href="house_${hs.id}.html" class="housedetil">查看详情</a>
	        		</div>
        	</div>
        	</c:forEach>

        	
        	
        	<div>
					<nav> 
										  <ul class="pagination" >
										    <li>
										 
										    <c:choose>
										      <c:when test="${(pd.pageNo-1)>0 }">
										         <a href="countrys?id=${country.id}&pageNo=${pd.pageNo-1}" aria-label="Previous">
										      </c:when>
										      <c:otherwise>
										       <a href="countrys?id=${country.id}&pageNo=1" aria-label="Previous">
										      </c:otherwise>
										    </c:choose>
										     
										        <span aria-hidden="true">上一页</span>
										      </a>
										    </li>
										    <c:forEach begin="${pd.start}" end="${pd.end}" var="ss">
										     <li><a href="countrys?id=${country.id}&pageNo=${ss}">${ss}</a></li>
										    </c:forEach>

										    <li>
										      
										       <c:choose>
										      <c:when test="${(pd.pageNo+1)<pd.totalPage }">
										        <a href="countrys?id=${country.id}&pageNo=${pd.pageNo+1}" aria-label="Next">
										      </c:when>
										      <c:otherwise>
										      <a href="countrys?id=${country.id}&pageNo=${pd.totalPage}" aria-label="Next">
										      </c:otherwise>
										    </c:choose>
										      
										        <span aria-hidden="true">下一页</span>
										      </a>
										    </li>
										  </ul>
					</nav>
        	</div>
        	
    </div>
    
    
    
    
    
    
     <!--
 	作者：langyamoren@163.com
 	时间：2018-08-14
 	描述：页脚
 -->
 <%@include file="foot.jsp" %>
	   <script type="text/javascript">
	   	$(function(){
	   		  
	   		  $("#zhinan_menu a").each(function(){
	   		  	   $(this).mouseover(function(){
	   		  	   	   $("#zhinan_menu a").removeClass("act");
	   		  	   	   $(this).addClass("act");
	   		  	   });
	   		  	   
	   		  	   $(this).click(function(){
	   		  	   	   $("#house_01,#house_02,#house_03").hide();
	   		  	   	   var idname=$(this).data("ids");
	   		  	   	   $(idname).show();
	   		  	   	
	   		  	   });
	   		  	
	   		  });
	   	});
	   	
	   </script>
	</body>
</html>
