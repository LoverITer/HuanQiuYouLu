<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	 <div  id="topnav">
		 	
		 	<img src="img/logo.png"  style="max-width: 200px;"/>
		 	
		 	<ul>
		 		<li><a href="index.html">首页</a></li>
		 		<li id="globhouse" style="position: relative;"><a href="houses" >海外地产  <span class="caret"></span></a>
		 			<div id="downmenu">
		 			   <c:forEach items="${countrys}" var="cot">
		 			     <a href="countrys?id=${cot.id}">${cot.name}</a>
		 			   </c:forEach>
		 				
		 			</div>
		 			
		 		</li>
		 		<li><a href="artlist">海外资讯</a></li>
		 		<li><a href="aboutus">关于我们</a></li>
		 		<li><a href="aboutus">联系我们</a></li>
		 	</ul>
		 	<p>
		 		<span class="glyphicon glyphicon-phone-alt"></span>  :
		 		132 9902 5577
		 	</p>
		 </div>
		 <div style="clear: both;"></div>