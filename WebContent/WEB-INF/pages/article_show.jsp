<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.hq.bean.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>文章详情：${art.title}</title>
<%@include file="header.jsp"%>

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content  animated fadeInRight article">
		<div class="row">
			<div class="col-lg-10 col-lg-offset-1">
				<div class="ibox">
					<div class="ibox-content">
						<div class="pull-left">
							<ol class="breadcrumb">
								<li><a href="${basepath}">首页</a></li>
								<li><a href="article?channel_id=${art.channelId}">${channel.name}</a></li>
								<li class="active">${art.title}</li>
							</ol>
						</div>
						<div class="text-center article-title">
							<h1>${art.title}</h1>
						</div>
						<div>${art.content}</div>
						<hr>



					</div>
				</div>
			</div>
		</div>

	</div>

	<%@include file="booter.jsp"%>





</body>

</html>
