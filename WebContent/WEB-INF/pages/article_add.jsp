<%@page import="com.sun.javafx.collections.MappingChange.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>增加资讯</title>
<link rel="shortcut icon" href="favicon.ico">
<%@include file="header.jsp"%>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/sweetalert.min.js"></script>
</head>
<body>
	<div class="ibox float-e-margins">
		<div class="ibox-title">
			<h5>
				增加资讯 <small class="m-l-sm"></small>
			</h5>
			<div class="ibox-tools">
				<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
				</a> <a class="dropdown-toggle" data-toggle="dropdown"
					href="tabs_panels.html#"> <i class="fa fa-wrench"></i>
				</a> <a class="close-link"> <i class="fa fa-times"></i>
				</a>
			</div>
		</div>
		<!--ibox-title-->
		<div class="ibox-content">

			<!-- 资讯添加表单开始 -->
			<form class="form-horizontal" method="post" action="article">
				<input type="hidden" name="action" value="saveArticle" />
				<div class="form-group">
					<div class="col-sm-8">
						<input class="form-control" type="text" name="title"
							placeholder="请输入标题">
					</div>
					<div class="col-sm-3">
						<select name="channel_id" class="form-control">

							<c:forEach items="${channels}" var="channel">
								<option value="${channel.id}">${channel.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group ">

					<div class=col-sm-5>
						<input class="form-control" type="text" name="keywords"
							placeholder="请输入标签，多个用逗号隔开">
					</div>

					<div class="col-sm-3">
						<select name="country_id" class="form-control">
							<c:forEach items="${countrys}" var="country">
								<option value="${country.id}">${country.name}</option>
							</c:forEach>
						</select>
					</div>

					<div class="col-sm-3">
						<select name="level" class="form-control">
							<%
								for (int i = 9; i > 0; i--) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
								}
							%>
						</select>
					</div>
				</div>
				<div class="form-group ">
					<div class="col-sm-12">
						<textarea name="content" class="form-control" id="txt1"
							style="height: 300px">
						</textarea>
					</div>
				</div>

				<div class="form-group ">
					<label class="col-sm-2 control-label">主图:</label>
					<div class="col-sm-3">
						<input type="hidden" id="pic1" name="pic" />
						<img id="uppic01" src="img/upload.jpg" style="width: 68px; height: 57px" />
					</div>

					<div class="col-sm-5">
						<button type="submit" class="btn btn-info btn-lg">增加文章</button>
					</div>
				</div>
		</div>

		<div style="clear: both;"></div>

		</form>
</body>
</html>
<!--添加的结果反馈 -->

<%@include file="booter.jsp"%>

<script charset="utf-8" src="kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh-CN.js"></script>
<script>
	KindEditor.ready(function(K) {
		window.editor = K.create('#txt1', {
			uploadJson : 'fileupload',
			allowPreviewEmoticons:true,
			allowImageUpload:true,
		});

		K('#uppic01').click(
				function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							uploadJson : 'fileupload',     //文件上传的位置
							imageUrl : K('#pic1').val(),
							clickFn : function(url, title, width, height,
									border, align) {
								K('#pic1').val(url);
								document.getElementById("uppic01").src = url;
								editor.hideDialog();
							}
						});
					});
				});
	});
</script>


