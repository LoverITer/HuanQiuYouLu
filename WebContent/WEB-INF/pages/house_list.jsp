<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.xzy.bean.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>房产管理列表</title>
<%@include file="header.jsp"%>
<style type="text/css">
#treemenu ul {
	list-style: none;
	padding: 0;
}

#treemenu .parent_menu>a {
	font-family: "微软雅黑";
	color: #333;
	font-weight: bold;
	line-height: 35px;
}

#treemenu .parent_menu>span {
	cursor: pointer;
}

#treemenu .sub_menu {
	color: #333;
	line-height: 32px;
	padding-left: 22px;
}

#treemenu .sub_menu a {
	color: #333;
}
</style>
</head>
<body>
	<div style="height: 40px;"></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1">
				<!--left start-->
				<div id="treemenu">
					<ul>
						<li class="parent_menu"><span class="fa fa-folder"></span><a
							href="house">所有内容</a></li>
						<c:forEach items="${countrys}" var="ct">
							<li class="parent_menu"><span class="fa fa-folder-open">
							</span><a href="house?cid=${ct.id}"> ${ct.name}</a></li>
						</c:forEach>


					</ul>
				</div>
				<!--left end-->
			</div>
			<div class="col-sm-11" style="border-left: 1px #ccc solid;">
				<!--right start-->

				<div class="row">
					<c:if test="${not empty country}">
						<span style="font-size: 20px; font-weight: bold;">&nbsp;&nbsp;${country.name }</span>
					</c:if>
					<a href="house?action=gotoAdd" class="btn btn-info"
						style="margin: 10px 20px;">＋添加楼盘项目</a>
				</div>

				<table
					class="table table-hover table-striped table-condensed table-responsive">
					<tr>
						<th>ID</th>
						<th>楼盘</th>
						<th>时间</th>
						<th>管理</th>
					</tr>

					<c:forEach items="${pd.list}" var="house" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${house.name}</td>
							<!-- <td>新闻国内</td> -->
							<td>${house.ctimes}</td>
							<td><a href="house?action=gotoEdit&id=${house.id}"
								class="btn btn-info btn-sm"> <i class="fa fa-edit">基本</i>
							</a> <a href="pic_house?id=${houseart.id}"
								class="btn btn-primary btn-sm">
									<li class="fa fa-image">相册</li>
							</a> <a href="type_house?id=${house.id}"
								class="btn btn-success btn-sm">
									<li class="fa fa-bank">户型</li>
							</a> <a href="voide_house?id=${house.id}"
								class="btn btn-info btn-sm">
									<li class="fa fa-file-movie-o">视频</li>
							</a> <a href="house?aciton=issue&id=${house.id}"
								class="btn btn-warning btn-sm">
									<li class="fa fa-newspaper-o">发布</li>
							</a> <c:choose>
									<c:when test="${house.isdel==0}">
										<a
											href="house?action=isdel&house_id=${house.id}&country_id=${house.countryId}&display=1"
											class="btn btn-danger btn-sm"> <i class="fa fa-close">禁用</i>
										</a>
									</c:when>
									<c:when test="${house.isdel==1}">
										<a
											href="house?action=isdel&house_id=${house.id}&country_id=${house.countryId}&display=0"
											class="btn btn-success btn-sm"> <i class="fa fa-check">启用</i>
										</a>
									</c:when>

								</c:choose></td>
						</tr>
					</c:forEach>

				</table>
				<div class="row">
					<div class="col-sm-8">
						<div class="text-center">
							<div class="btn-group">
								<%
									com.xzy.db.core.PageDiv<House> pd = (com.xzy.db.core.PageDiv<House>) request.getAttribute("pd");
								%>

								<a
									href="house?action=index&id=${id}&pageNo=<%=((pd.getCurrentPageNo()-1)>1?(pd.getCurrentPageNo()-1):1)%>"
									class="btn btn-white"><i class="fa fa-chevron-left"></i> </a>
								<%
									for (long i = pd.getStart(); i <= pd.getEnd(); i++) {
								%>
								<a class="btn btn-white"
									href="house?action=index&id=${id}&pageNo=<%=i%>"><%=i%></a>
								<%
									}
								%>

								<a class="btn btn-white"
									href="house?action=index&id=${id}&pageNo=<%=((pd.getCurrentPageNo()+1)<pd.getTotalPage()?(pd.getCurrentPageNo()+1):pd.getTotalPage())%>"><i
									class="fa fa-chevron-right"></i> </a>
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
