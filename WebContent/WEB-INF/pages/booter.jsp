<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="js/content.js?v=1.0.0"></script>

<script type="text/javascript" src="js/sweetalert.min.js"></script>
<script src="js/plugins/layer/laydate/laydate.js"></script>

<%
	String success = (String) request.getAttribute("success");
	String error = (String) request.getAttribute("error");
	if (null != success) {
		out.println(" <script type=\"text/javascript\">swal('" + success + "!','','success'); </script>");
		request.removeAttribute("success");
	} else if (null != error) {
		out.println(" <script type=\"text/javascript\">swal('" + error + "!','','error'); </script>");
		request.removeAttribute("error");
	}
%>

