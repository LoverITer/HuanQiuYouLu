<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="header.jsp" %>

    <title>环球优路-国家和城市管理</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <style type="text/css">
    	.city_list{ width: 245px; height: 125px; border: 1px #CCC solid; float: left; margin: 5px; position: relative;}
    	.city_list img{position: absolute; left: 2px; top: 2px; width: 238px; height: 121px;}
    	.city_list span{ position: absolute; left: 100px; top: 50px; font-size: 20px; font-weight: bold; color: white;}
    	.city_list:hover{ border: 1px #FF0000 solid;}
    </style>

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="file-manager">
                            
                            <a href="admin/city?action=toadd" class="btn btn-primary btn-info">增加国家/城市</a>
                            <div class="hr-line-dashed"></div>
                            <h5>国家列表</h5>
                            <ul class="folder-list" style="padding: 0">
                                <li><a href="admin/city"><i class="fa fa-folder"></i> 所有</a>
                                </li>
                                <c:forEach items="${countrys}" var="cty">
                                 <li>
                                 <a href="admin/city?cid=${cty.id}"><i class="fa fa-folder"></i> ${cty.name}</a>
                                     
                                </li>
                                </c:forEach>
                            </ul>
                            
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 animated fadeInRight">
            <div>
            <c:if test="${not empty country}">
            		<h3>${country.name}&nbsp;&nbsp;<small><a href="admin/city?action=edit&cityid=${country.id}" class="btn btn-xs btn-primary">修改</a></small></h3>
            </c:if>
            	</div>
                <div class="row">
                    <div class="col-sm-12">
                     <c:forEach items="${citys}" var="city">
                        <div class="city_list">
                        	<a href="admin/city?action=edit&cityid=${city.id}">
                        	<img src="${city.pic}" />
                        	<span>${city.name}</span>
                        	</a>
                        </div>
                     </c:forEach> 
                      
                      
                    </div><!--end col-sm-12-->
                </div><!--end rows-->
            </div>
        </div>
    </div>

    <!-- 全局js -->
    <script src="adminres/js/jquery.min.js?v=2.1.4"></script>
    <script src="adminres/js/bootstrap.min.js?v=3.3.6"></script>



    <!-- 自定义js -->
    <script src="adminres/js/content.js?v=1.0.0"></script>


    <script>
        $(document).ready(function () {
            $('.file-box').each(function () {
                animationHover(this, 'pulse');
            });
        });
    </script>

</body>

</html>
<%@include file="booter.jsp" %>