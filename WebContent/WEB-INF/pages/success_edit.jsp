<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改成功案例</title>
		 <link rel="shortcut icon" href="favicon.ico"> 
<%@include file="header.jsp" %>
	</head>
	<body>
		  <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>修改成功案例 <small class="m-l-sm"></small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="tabs_panels.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
               
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div><!--ibox-title-->
                    <div class="ibox-content">
                      
<form class="form-horizontal" method="post" action="admin/successfull">
<input type="hidden" name="action" value="saveedit"/>
  <div class="form-group">
	    <div class="col-sm-3">
	      <input class="form-control" type="text" name="name"  placeholder="请输姓名" value="${success.name}">
	      <input type="hidden" name="id" value="${success.id}"/>
	    </div>
	   <div class="col-sm-3">
	    	 <input class="form-control" type="text" name="house"  placeholder="选择的项目" value="${success.house}">
	    </div>
	    <div class="col-sm-3">
	    	<select name="level" class="form-control">
	    	<%
	    	  for(int i=9;i>0;i--)
	    	  {
	    		  request.setAttribute("temi", i);
	    	%>
	    		<option value="<%=i%>"  <c:if test="${art.level==temi}">selected="selected"</c:if>><%=i%></option>
	    		<%
	    	  }
	    		%>
	    	</select>
	    </div>
  </div>
  <div class="form-group ">
     <div class=col-sm-7>
       <input class="form-control" type="text" name="why" value="${success.why}"  placeholder="客户为什么选择项目">
     </div>
  </div>
  <div class="form-group ">
    <div class="col-sm-12">
    	<textarea name="dis" class="form-control" id="txt1" style="height:300px">${success.dis}</textarea>
    </div>
  </div>
  
  <div class="form-group ">
   
        <label  class="col-sm-1 control-label">项目图:</label>
	    <div class="col-sm-1">
	          <input type="hidden" id="pic1" name="pic1"  value="${success.pic1}"/>
	          <img id="uppic01" src="${success.pic1}" style="width:68px; height:57px" />
	    </div>
	
	    <label  class="col-sm-1 control-label">客户头像:</label>
	    <div class="col-sm-1">
	          <input type="hidden" id="pic2" name="pic2" value="${success.pic2}"/>
	          <img id="uppic02" src="${success.pic2}" style="width:68px; height:57px" />
	    </div>
   </div>
    
	    
<div class="form-group ">
   
    <div class="col-sm-3 col-lg-offset-3" >
    <br/>
    	 <button type="submit" class="btn btn-info btn-lg">修改成功案例  </button>
    </div>
  </div>
	    
	    
	 
  <div style="clear: both;"></div>
  

</form>

	
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
							imageUrl : K('#pic1').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#pic1').val(url);
								document.getElementById("uppic01").src=url;
								editor.hideDialog();
							}
						});
					});
				});

                K('#uppic02').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							
						    uploadJson:'admin/fileupload',
							imageUrl : K('#pic2').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#pic2').val(url);
								document.getElementById("uppic02").src=url;
								editor.hideDialog();
							}
						});
					});
				});
                
    
 
        });
        
</script>