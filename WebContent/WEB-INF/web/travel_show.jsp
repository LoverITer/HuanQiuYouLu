<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${art.title}</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
<%@include file="../admin/header.jsp" %>

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight article">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1">
                <div class="ibox">
                    <div class="ibox-content">
                    
                        <div class="text-center article-title">
                            <h1>
                                 ${art.title}
                                </h1>
                                <h3>出发城市：${art.city}&nbsp;&nbsp;&nbsp;&nbsp;出发时间：${art.depart}&nbsp;&nbsp;&nbsp;&nbsp;访问城市:${art.visitcity}</h3>
                        </div>
                        <hr>
                        <div>
                        ${art.content}
                        </div>
                        <hr>

                        <div class="row">
                            <div class="col-lg-12">



                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>



    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>


    
    

</body>

</html>
