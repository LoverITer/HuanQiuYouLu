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
	    	#searchcond{ width: 100%; background: #F4F4F4; }
	    	#searchcond #innersearch{ width: 1200px; margin: 0 auto;  height: 145px;}
	    	#searchcond #innersearch #searchcond_det{ clear: both; padding-left: 10px; font-size: 12px;}
	    	#searchcond #innersearch #searchcond_det p{ line-height:24px; }
	    	#searchcond #innersearch #searchcond_det p a{ margin: 0 10px; color: #333; text-decoration: none;}
	    	#searchcond #innersearch #searchcond_det p a:hover{ text-decoration: underline;}
	    	#searchcond #innersearch #searchcond_det p a.alllink{ font-weight: bold; color: #0072E4;}
	    	
	    	#housesearch_list{ width: 1200px; margin: 0 auto;}
	    	#housesearch_list h6{ border-bottom:1px #ccc dashed; line-height: 40px; padding-left: 20px;}
	    	
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
     <div   id="imgadw"   style="clear: both;  width: 100%;">
       <div class="carousel slide" id="carousel2" ">
                            <ol class="carousel-indicators">
                                <li data-slide-to="0" data-target="#carousel2" class="active"></li>
                                <li data-slide-to="1" data-target="#carousel2"></li>
                                <li data-slide-to="2" data-target="#carousel2" class=""></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img alt="image"  class="img-responsive"  src="img/banneradw.jpg">
                                    <div class="carousel-caption">
                                        <!--<p>This is simple caption 1</p>-->
                                    </div>
                                </div>
                                <div class="item ">
                                    <img alt="image"  class="img-responsive"   src="img/banneradw.jpg">
                                    <div class="carousel-caption">
                                       <!-- <p>This is simple caption 2</p>-->
                                    </div>
                                </div>
                                <div class="item">
                                    <img alt="image"  class="img-responsive"   src="img/banneradw.jpg">
                                    <div class="carousel-caption">
                                       <!-- <p>This is simple caption 3</p>-->
                                    </div>
                                </div>
                            </div>
                      <!--     <a data-slide="prev" href="carousel.html#carousel2" class="left carousel-control">
                                <span class="icon-prev"></span>
                            </a>
                            <a data-slide="next" href="carousel.html#carousel2" class="right carousel-control">
                                <span class="icon-next"></span>
                            </a>-->
                        </div>
    </div>
	<!--
    	作者：langyamoren@163.com
    	时间：2018-08-14
    	描述：广告结束
    -->
    <div id="searchcond">
    	<div id="innersearch">
			<ol class="pathnav">
			  <li><a href="index.html">首页</a></li>
			  <li><a href="houses">海外房产</a></li>
			  <li>海外房产</li>
			</ol>
			<div  id="searchcond_det">
			   <p><b>热门国家:</b><a href="#" class="alllink">全部</a>
			     <c:forEach items="${countrys}" var="cot">
		 			     <a href="houses?cid=${cot.id}">${cot.name}</a>
		 			   </c:forEach>
			   </p>
			   <p><b>房屋总价:</b><a href="#" class="alllink">全部</a><a href="#">50万以下</a><a href="#">50-100万</a><a href="#">100-200万</a><a href="#">200-300万</a><a href="#">200-300万</a><a href="#">200-300万</a><a href="#">200-300万</a></p>
			   <p><b>置业目的:</b><a href="#" class="alllink">全部</a><a href="#">投资</a><a href="#">教育</a><a href="#">自住</a><a href="#">养老</a></p>
			   <p><b>物业类型:</b><a href="#" class="alllink">全部</a><a href="#">独栋别墅</a><a href="#">联排别墅</a><a href="#">公寓</a><a href="#">土地</a></p>
			</div>
    	</div>
    </div>
    
    <div id="housesearch_list">
        	<h6><c:if test="${not empty country}"><b>${country.name}</b></c:if>找到${pd.totalCount}套符合要求的房源</h6>
        	
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
										         <a href="houses?cid=${country.id}&pageNo=${pd.pageNo-1}" aria-label="Previous">
										      </c:when>
										      <c:otherwise>
										       <a href="houses?cid=${country.id}&pageNo=1" aria-label="Previous">
										      </c:otherwise>
										    </c:choose>
										     
										        <span aria-hidden="true">上一页</span>
										      </a>
										    </li>
										    <c:forEach begin="${pd.start}" end="${pd.end}" var="ss">
										     <li><a href="houses?cid=${country.id}&pageNo=${ss}">${ss}</a></li>
										    </c:forEach>

										    <li>
										      
										       <c:choose>
										      <c:when test="${(pd.pageNo+1)<pd.totalPage }">
										        <a href="houses?cid=${country.id}&pageNo=${pd.pageNo+1}" aria-label="Next">
										      </c:when>
										      <c:otherwise>
										      <a href="houses?cid=${country.id}&pageNo=${pd.totalPage}" aria-label="Next">
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
	</body>
</html>
