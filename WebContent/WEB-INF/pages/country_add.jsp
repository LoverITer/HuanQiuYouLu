<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>增加国家/城市</title>
<link rel="shortcut icon" href="favicon.ico">
<%@include file="header.jsp"%>
</head>
<body>
	<div class="ibox float-e-margins">
		<div class="ibox-title">
			<h5>
				增加国家或城市 <small class="m-l-sm"></small>
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

			<form class="form-horizontal" method="post" action="country">
				<input type="hidden" name="action" value="saveAdd" />
				<div class="form-group">
					<div class="col-sm-4">
						<input class="form-control" type="text" name="name"
							placeholder="请输入国家或城市名字">
					</div>
					<div class="col-sm-4">
						<select name="parent_id" class="form-control">
							<option value="0">国家</option>
							<c:forEach items="${citys}" var="city">
								<option value="${city.id}">${city.name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-sm-4">
						<span>等级<span> <select name="level"
								class="form-control">
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
						国家特色描述： <br />
						<textarea name="dis" class="form-control" id="txt1"></textarea>
					</div>
				</div>
				<div class="form-group ">
					<label class="col-sm-1 control-label">主图:</label>
					<div class="col-sm-1">
						<input type="hidden" id="pic" name="pic" /> <img id="uppic01"
							src="img/upload.jpg" style="width: 68px; height: 57px" />
					</div>
					<div class="col-sm-3">
						是否显示：<input type="checkbox" value="1" name="display"
							checked="checked" />
					</div>
				</div>
				<div class="form-group ">

					<div class="col-sm-2 col-lg-offset-5">
						<button type="submit" class="btn btn-primary">增加国家或城市</button>
					</div>
				</div>
		</div>
		</form>
	</div>
	<!--ibox-content-->
	</div>
</body>
</html>
<%@include file="booter.jsp"%>

<script charset="utf-8" src="kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh-CN.js"></script>
<script>
	KindEditor.ready(function(K) {
		window.editor = K.create('#txt1', {
			uploadJson : 'fileupload'
		});
		K('#uppic01').click(
				function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({

							uploadJson : 'fileupload',
							imageUrl : K('#pic').val(),
							clickFn : function(url, title, width, height,
									border, align) {
								K('#pic').val(url);
								document.getElementById("uppic01").src = url;
								editor.hideDialog();
							}
						});
					});
				});

	});
</script>