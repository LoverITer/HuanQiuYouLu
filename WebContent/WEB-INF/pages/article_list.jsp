<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.xzy.bean.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>资讯管理列表</title>
<%@include file="header.jsp"%>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12" style="border-left: 1px #ccc solid;">
				<!--right start-->

				<div class="row">
					<div class="col-sm-3" style="line-height: 50px;">
						&nbsp;&nbsp;&nbsp;<a href="article">全部</a>
						<c:forEach items="${channels}" var="channel">
				              &nbsp;&nbsp;&nbsp;<a
								href="channel?channel_id=${channel.id}">${channel.name}</a>
						</c:forEach>
					</div>

					<div class="col-sm-9" style="line-height: 60px;">
						<form class="form-inline" action="article?action=searchAritcle"
							method="post">
							<div class="form-group">
								<input type="text" name="keywords" class="form-control"
									placeholder="请输入要搜索的关键词">
							</div>
							<button type="submit" class="btn btn-info">搜索</button>
						</form>
					</div>
				</div>
				<table
					class="table table-hover table-striped table-condensed table-responsive">
					<tr>
						<th>ID</th>
						<th>主图</th>
						<th>资讯</th>
						<th>栏目</th>
						<th>国家/地区</th>
						<th>时间</th>
						<th>管理</th>
					</tr>

					<c:forEach items="${pd.list}" var="art" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td><img src="${art.pic}" style="max-height: 40px" /></td>
							<td><a href="article?id=${art.id}" target="_blank">${art.title}</a></td>
							<td>${art.channelId}</td>
							<td>${art.countryId}</td>
							<td>${art.ctime}</td>
							<td><a href="article?action=gotoUpdateAritcle&id=${art.id}"
								class="btn btn-info btn-sm"> <i class="fa fa-edit">修改</i>
							</a> <a
								href="article?action=delAritcle&id=${art.id}"
								class="btn btn-danger btn-sm">
									<li class="fa fa-close">删除</li>
							</a></td>
						</tr>
					</c:forEach>

				</table>
				<div class="row">
					<div class="col-sm-8">
						<div class="text-center">
							<div class="btn-group">
								<%
									com.xzy.db.core.PageDiv<Article> pd = (com.xzy.db.core.PageDiv<Article>) request.getAttribute("pd");
									if (null != pd) {
								%>

								<a
									href="article?keyword=${keyword}&pageNo=<%=((pd.getCurrentPageNo()-1)>1?(pd.getCurrentPageNo()-1):1)%>&channel_id=${channelId}"
									class="btn btn-white"><i class="fa fa-chevron-left"></i> </a>
								<%
									for (long i = pd.getStart(); i <= pd.getEnd(); i++) {
								%>
								<a class="btn btn-white"
									href="article?keyword=${keyword}&pageNo=<%=i%>&channel_id=${channelId}"><%=i%></a>
								<%
									}
								%>

								<a class="btn btn-white"
									href="article?keyword=${keyword}&pageNo=<%=((pd.getCurrentPageNo()+1)<pd.getTotalPage()?(pd.getCurrentPageNo()+1):pd.getTotalPage())%>&channel_id=${channelId}"><i
									class="fa fa-chevron-right"></i> </a>
								<%
									}
								%>
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<h4>当前${pd.currentPageNo}/${pd.totalPage}页&nbsp;&nbsp;总共${pd.totalCount}条</h4>
					</div>
				</div>

				<!--right end-->
			</div>
		</div>
	</div>
	<!-- 全局js -->
	<%@include file="booter.jsp"%>

</body>

</html>



