<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改国家/城市</title>
		 <link rel="shortcut icon" href="favicon.ico"> 
<%@include file="header.jsp" %>
	</head>
	<body>
		  <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>修改国家或城市 <small class="m-l-sm"></small></h5>
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
                      
<form class="form-horizontal" method="post" action="admin/city">
<input type="hidden" name="action" value="saveedit"/>
<input type="hidden" name="id" value="${city.id }"/>
  <div class="form-group">
    <div class="col-sm-4">
      <input class="form-control" type="text" name="name" value="${city.name}"  placeholder="请输入国家或城市名字">
    </div>
    <div class="col-sm-4">
    	<select name="parent_id" class="form-control">
    		<option value="0">国家</option>
    		<c:forEach items="${countrys}" var="cty">
    		
    		 <option value="${cty.id}" <c:if test="${cty.id==city.parent_id}">selected="selected"</c:if>>${cty.name}</option>
    		</c:forEach>
    	</select>
    </div>
     <div class="col-sm-4">
    	<select name="level" class="form-control">
    	<%
    	  for(int i=9;i>0;i--)
    	  {
    		  request.setAttribute("temi", i);
    	%>
    		<option value="<%=i%>" <c:if test="${temi==city.level}">selected="selected"</c:if>><%=i%></option>
    		<%
    	  }
    		%>
    	</select>
    </div>
  </div>
  <div class="form-group ">
   
    <div class="col-sm-12">
    	国家特色描述：
    	<br/>
    	<textarea name="dis" class="form-control" id="txt1">${city.dis}</textarea>
     
    </div>
  </div>
  
  <div class="form-group ">
   
        <label  class="col-sm-1 control-label">主图:</label>
	    <div class="col-sm-1">
	          <input type="hidden" id="pic" name="pic" value="${city.pic}"/>
	          <img id="uppic01" src="${city.pic}" style="width:68px; height:57px" />
	    </div>
	
	    <div class="col-sm-3">
	    	 是显示：<input type="checkbox" value="1" name="display" <c:if test="${city.display==1}">checked="checked"</c:if>  />
	    </div>
	   
</div>	    
	    
<div class="form-group ">
   
    <div class="col-sm-2 col-lg-offset-3">
    	 <button type="submit" class="btn btn-primary">修改国家或城市 </button>
    </div>
  </div>

  </div>
</form>
<hr />
<h3>图集管理</h3>
<form class="form-inline"  action="admin/city?action=uploadcitypic" method="post" enctype="multipart/form-data">
<!--   <input type="hidden" name="action" value="uploadcitypic"/> -->
  <input type="hidden" name="country_id" value="${city.id}" />
  <div class="form-group">
    <input type="text" name="dis" class="form-control"  placeholder="图片描述">
  </div>
   <div class="form-group">
     <select name="level" class="form-control">
        <%for(int i=9;i>0;i--){ %>
     	<option value="<%=i%>"><%=i%></option>
     	<%} %>
     </select>
  </div>
  <div class="form-group">
    <input type="file" name="pic" class="form-control" placeholder="选择要上传的图片">
  </div>
 
  <button type="submit" class="btn btn-info">增加图片</button>
</form>

<hr />

	    	
	    	<ul>
	    	<c:forEach items="${citypic}" var="cpic">
	    		<li>
	    			<form class="form-inline" action="admin/city" method="post">
	    			   <input type="hidden" name="action" value="cityspicupdate"/>
		    			<img src="${cpic.path}" width="35" height="35"/>
		    			
		    			<input type="hidden" name="city_id" value="${cpic.city_id}" />
		    			<input type="hidden" name="id" value="${cpic.id}"/>
						<div class="form-group">
						     <select name="level" class="form-control">
						        <%
						           for(int i=9;i>0;i--)
						           {
						        	   request.setAttribute("tti", i);
						        %>
						     	<option value="<%=i%>" <c:if test="${tti==cpic.level}">selected="selected"</c:if>><%=i%></option>
						     	<%
						           }
						     	%>
						     </select>
						  </div>
						<div class="form-group">
						    <input type="text" class="form-control"  name="dis" placeholder="图片描述" value="${cpic.dis}"/>
						  </div>
		    			<input type="submit" class="btn btn-xs btn-primary" value="修改"/>
		    			<a href="admin/city?action=cityspicdel&id=${cpic.id}&path=${cpic.path}&cityid=${cpic.city_id}" class="btn btn-xs btn-danger">删除</a>
	    			</form>
	    		</li>
	    		</c:forEach>
	    	</ul>
	
                    </div><!--ibox-content-->
                </div>
        
	</body>
</html>
<%@include file="booter.jsp" %>

<script charset="utf-8" src="kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh-CN.js"></script>
<script>
        KindEditor.ready(function(K) {
                window.editor = K.create('#txt1',{
                	uploadJson : 'admin/fileupload'
                });
                
                K('#uppic01').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							
						    uploadJson:'admin/fileupload',
							imageUrl : K('#pic').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#pic').val(url);
								document.getElementById("uppic01").src=url;
								editor.hideDialog();
							}
						});
					});
				});
 
        });
        
</script>