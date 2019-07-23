<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*,com.hq.bean.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="header.jsp" %>
<title>焦点广告管理</title>
 <style type="text/css">
	    	
 	.focuspic_list{ float: left; width: 280px; height: 230px; margin: 10px; border: 1px #CCC solid; position: relative;}
 	.focuspic_list img{ width: 274px; height: 197px; position: absolute; left: 2px; top:2px;}
 	.focuspic_list p{ width: 274px; line-height: 26px; position: absolute; left: 2px; top: 200px; background: #E8E8E8; padding-left: 5px;}
 	.focuspic_list a{ position: absolute; left: 237px; top: 201px;}
 </style>
	</head>
	<body>
<div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>焦点广告 <small class="m-l-sm">焦点广告图片</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="tabs_panels.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                        <!--   <ul class="dropdown-menu dropdown-user">
                                <li><a href="tabs_panels.html#">选项1</a>
                                </li>
                                <li><a href="tabs_panels.html#">选项2</a>
                                </li>
                            </ul>-->
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div><!--ibox-title-->
                    <div class="ibox-content">
                        <h2>
                                                     上传焦点广告<br/>
                        </h2>
<form class="form-inline" action="admin/focuspic?action=uploadpic" method="post" enctype="multipart/form-data">
<!--   <input type="hidden" name="action" value="uploadpic"/> -->
  <div class="form-group">
    <label class="sr-only" >描述</label>
    <input type="text" class="form-control" name="dis"  placeholder="焦点图描述">
  </div>
  <div class="form-group">
    <label class="sr-only" for="exampleInputPassword3">Password</label>
    <select name="level" class="form-control">
       <%for(int i=9;i>0;i--){ %>
    	<option value="<%=i%>"><%=i%></option>
    	<%} %>
    </select>
  </div>
  <div class="form-group">
    <label>
      
    </label>
      <input type="file" class="form-control"  name="pic" placeholder="选择文件" />
  </div>
  <div class="form-group">
    <label>
      
    </label>
      <input type="text" class="form-control"  name="link" placeholder="外链" />
  </div>
  <button type="submit" class="btn btn-info">增加焦点图</button>
</form>

<!--
	作者：langyamoren@163.com
	时间：2018-09-30
	描述：焦点图列表
-->
<div class="row" style="margin-top: 20px;">
                    <div class="col-sm-12">
	                     
	                        <%
	                           List<Focuspic> flist=(List<Focuspic>)request.getAttribute("flist");
	                          if(null!=flist&&flist.size()>0)
	                          {
	                        	  for(Focuspic fpic:flist)
	                        	  {
	                        %>
	                        <div class="focuspic_list">
	                     	  <img src="<%=fpic.getPath()%>"  />
	                     	  <p><%=fpic.getDis() %></p>
	                     	  <a href="admin/focuspic?action=delfocuspic&id=<%=fpic.getId()%>" class="btn btn-xs btn-danger">删除</a>
	                        </div>
	                        
	                        
	                      
                        
                        <%
	                        	  }
	                          }
                        %>
                      
	                        
	                        
                     </div>
</div>
<!--
	作者：langyamoren@163.com
	时间：2018-09-30
	描述：结束
-->
                    </div><!--ibox-content-->
                </div><!--ibox float-e-margins-->
	</body>
</html>
<%@include file="booter.jsp" %>