<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*,com.hq.bean.*" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>楼盘相册管理</title>
		 <meta name="viewport" content="width=device-width, initial-scale=1.0">
		 <%@include file="header.jsp" %>
    <link href="adminres/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="adminres/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="adminres/css/animate.css" rel="stylesheet">
    <link href="adminres/css/style.css?v=4.1.0" rel="stylesheet">
    <style type="text/css">
    	.country_names{ list-style: none; padding: 0; margin: 0; }
    	.country_names li{ float: left; }
    	.country_names  li a{ color: #333; text-decoration: none; line-height: 30px; padding: 5px 10px;}
    	.country_names  li a:hover{ text-decoration: underline;}
    	
    	#pic_lists{}
    	#pic_lists .pic_item{ float: left; margin: 10px; width: 184px; height: 129px; border: 1px #CCC solid; position: relative;}
    	#pic_lists .pic_item img{ position: absolute; left: 2px; top: 2px; width: 178px; height: 124px;}
    	#pic_lists .pic_item p{ position: absolute; left:2px; top: 102px;width: 178px; height:24px; color: white; background: rgba(0,0,0,0.6); line-height: 24px;}
        #pic_lists .pic_item div{ position: absolute; right: 10px; top:6px; line-height: 30px;}
    </style>
	</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
               
                    <div class="ibox-title">
                        <h5>楼盘相册管理
                               <small style="font-size: 12px; font-weight: bold; margin-left: 30px;">${house.name}</small>
                        </h5>
               
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" style="font-size:12px;">
                       <!-- 内容开始 -->
                       <div style="width: 100%;">
                       	   <ul class="country_names" style="margin-left: 0; padding-left: 0;">
                       	      
								<li><a href="admin/pic_house?id=${house.id}&channel=0" <c:if test="${channel==0}">style="font-weight:bold;color:red;"</c:if>>全部</a></li>
								<li><a href="admin/pic_house?id=${house.id}&channel=1" <c:if test="${channel==1}">style="font-weight:bold;color:red;"</c:if>>效果</a></li>
								<li><a href="admin/pic_house?id=${house.id}&channel=2" <c:if test="${channel==2}">style="font-weight:bold;color:red;"</c:if>>实景</a></li>
								<li><a href="admin/pic_house?id=${house.id}&channel=3" <c:if test="${channel==3}">style="font-weight:bold;color:red;"</c:if>>样板间</a></li>
								<li><a href="admin/pic_house?id=${house.id}&channel=4" <c:if test="${channel==4}">style="font-weight:bold;color:red;"</c:if>>配套</a></li>
								<li><a href="admin/pic_house?id=${house.id}&channel=5" <c:if test="${channel==5}">style="font-weight:bold;color:red;"</c:if>>活动</a></li>
                           </ul>
                           
<c:if test="${channel>0}">
   <form action="admin/pic_house?action=imgupload" method="post" class="form-inline" enctype="multipart/form-data">
  <div class="form-group">
    <input type="hidden" name="channel" value="${channel}"/>
     <input type="hidden" name="house_id" value="${house.id}"/>
    <input type="text" class="form-control" name="dis" id="exampleInputName2" placeholder="图片描述">
  </div>
   <div class="form-group">
    <select name="level"  class="form-control" >
       <%for(int i=9;i>0;i--) {%>
    	<option value="<%=i%>"><%=i%></option>
    	<%
    	}
    	%>
    </select>
    
  </div>
  <div class="form-group">
  
    <input type="file" class="form-control" name="pic"  placeholder="请选择要上传的图片">
  </div>
  <button type="submit" class="btn btn-info">上传图片</button>
</form>

</c:if> 
                           <div style="clear: both;"></div>
                       </div>
                       <!--
                       	作者：langyamoren@163.com
                       	时间：2018-09-01
                       	描述：楼盘更列表开始
                       -->
                       <div id="pic_lists">
                     <c:forEach items="${pics}" var="pic">
                            <div class="pic_item">
                       	  	 <img src="${pic.path}" width="180" height="125px" />
                       	  	 <p>${pic.dis}</p>
                       	  	 <div>
	                       	  	<!--  <a href="#" class=" btn btn-success btn-xs">修改</a> -->
	                       	  	 <a href="admin/pic_house?action=delimg&id=${pic.id}&channel=${channel}&hid=${house.id}&path=${pic.path}"  class=" btn btn-danger  btn-xs">删除</a>	
                       	  	 </div>
                       	  	
                       	  </div>
                       </c:forEach>
                       	 
                       	
                       	  
                       	  
                       	 
                       	  <div style="clear: both;">
               <!--         	  	<nav> 
										  <ul class="pagination" >
										    <li>
										      <a href="#" aria-label="Previous">
										        <span aria-hidden="true">上一页</span>
										      </a>
										    </li>
										    <li><a href="#">1</a></li>
										    <li><a href="#">2</a></li>
										    <li><a href="#">3</a></li>
										    <li><a href="#">4</a></li>
										    <li><a href="#">5</a></li>
										    <li>
										      <a href="#" aria-label="Next">
										        <span aria-hidden="true">下一页</span>
										      </a>
										    </li>
										  </ul>
					</nav> -->
                       	  </div>
                       	  
                       </div>
                       <!--
                       	作者：langyamoren@163.com
                       	时间：2018-09-01
                       	描述：楼盘更列表结束
                       -->
<!--                      <table class="table table-striped table-hover table-responsive">
	<tr>
		<th  align='center'>序号</th>
		<th>国家城市名称</th>
		<th>排序</th>
		<th>图</th>
		<th>管理</th>
	</tr>
                     
                      </table>-->
                       <!-- 内容结束 -->
                    </div>
             
                </div><!-- ibox float-e.. -->
            </div>
       </div>
   </div>
       <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>

</body>
</html>
