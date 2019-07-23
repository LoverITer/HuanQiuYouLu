<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>增加旅行信息</title>
		 <link rel="shortcut icon" href="favicon.ico"> 
<%@include file="header.jsp" %>
	</head>
	<body>
		  <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>增加旅行信息 <small class="m-l-sm"></small></h5>
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
                      
<form class="form-horizontal" method="post" action="travel">
<input name="action" type="hidden" value="saveTravelAdd"/>
  <div class="form-group">
    <div class="col-sm-6">
      <input class="form-control" type="text" name="title"  placeholder="请输入标题" >
    </div>
   <div class="col-sm-3">
       <input class="form-control" type="date" name="departureTime"  id="start">
    </div>

  </div>
  <div class="form-group ">
    
     <div class=col-sm-3>
       <input class="form-control" type="text" name="city"  placeholder="出发城市">
     </div>
      <div class=col-sm-3>
       <input class="form-control" type="text" name="visitcity"  placeholder="访问城市">
     </div>
      
    
  </div>
  <div class="form-group ">
   
    <div class="col-sm-12">
    
    	<textarea name="content" class="form-control" id="txt1" style="height:300px"></textarea>
     
    </div>
  </div>
  
  <div class="form-group ">
   
        <label  class="col-sm-1 control-label">主图1:</label>
	    <div class="col-sm-1">
	          <input type="hidden" id="pic1" name="pic"/>
	          <img id="uppic01" src="img/upload.jpg" style="width:68px; height:57px" />
	    </div>
</div>	    
	    
<div class="form-group ">
   
    <div class="col-sm-2 col-lg-offset-5">
    	 <button type="submit" class="btn btn-info btn-lg">增加旅行</button>
    </div>
  </div>
 
  <div style="clear: both;"></div>
  
</html>
<%@include file="booter.jsp" %>

<script charset="utf-8" src="kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh-CN.js"></script>
<script>
        KindEditor.ready(function(K) {
                window.editor = K.create('#txt1',{
                	uploadJson : 'fileupload'
                });
                
                K('#uppic01').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							
						    uploadJson:'fileupload',
							imageUrl : K('#pic1').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#pic1').val(url);
								document.getElementById("uppic01").src=url;
								editor.hideDialog();
							}
						});
					});
				});
        });
        
</script>

