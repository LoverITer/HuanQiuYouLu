<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base
	href="<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/"%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>环球经纪 - 注册</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">

<script>
	if (window.top !== window.self) {
		window.top.location = window.location;
	}
</script>
</head>

<body class="gray-bg">

	<div class="middle-box text-center loginscreen  animated fadeInDown">
		<div>
			<div>
				<h1 style="font-size: 38px; letter-space: 30px;">环球优路v1.2</h1>
			</div>
			<h3>环球优路v1.2</h3>

			<form class="m-t" role="form" action="admin" method="post">
				<input type="hidden" name="action" value="saveAdd" />
				<div class="form-group"> 
					<span class="pull-left" for="name">用户名</span> <input type="email"
						name="uname" class="form-control" placeholder="请输入电子邮件">
				</div>
				<div class="form-group">
					<span class="pull-left" for="name">密码</span> <input
						type="password" name="upwd" class="form-control"
						placeholder="请输入密码">
				</div>
				<div class="form-group">
					<span class="pull-left" for="name">确认密码</span> <input
						type="password" name="upwdAgain" class="form-control"
						placeholder="请确认密码">
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-md-4">
							<span class="pull-left" for="name">验证码</span>
						</div>
					</div>
					<lable>
					<img src="random" style="cursor: pointer;"
						onclick="this.src='random?ss='+Math.random();" /></lable>
					<input type="text" placeholder="输入验证码"
						style="width: 160px; float: left;" name="rand"
						class="form-control" />
				</div>
				<button type="submit" class="btn btn-primary block full-width m-b">注&nbsp;册</button>
				<p class="text-muted text-center">
					<a href="login"><small>返回登录</small></a> </a>
				</p>
				</p>
			</form>
		</div>
	</div>

	<!-- 全局js -->
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>

	<%@include file="booter.jsp"%>

</body>

</html>
