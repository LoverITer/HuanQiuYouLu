<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,com.hq.bean.*" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>增加楼盘基本信息</title>
		<%@include file="header.jsp" %>

    <link rel="stylesheet" href="css/jquery-labelauty.css" />
    <style type="text/css">
    	.country_names{ list-style: none; padding: 0; margin: 0; }
    	.country_names li{ float: left; }
    	.country_names  li a{ color: #333; text-decoration: none; line-height: 30px; padding: 5px 10px;}
    	.country_names  li a:hover{ text-decoration: underline;}
    	
    	#house_lists{ height: 600px;}
    	#house_lists .house_items{ float: left; width: 280px; height: 245px; border: 1px #CCC solid; border-radius:8px; margin: 8px; position: relative;}
    	#house_lists .house_items img{ position: absolute; left: 4px; top: 4px; width: 270px; height: 200px;border-top-left-radius: 8px; border-top-right-radius: 8px;}
        #house_lists .house_items p{position: absolute; left: 4px; top: 174px; width: 270px; height: 30px; line-height: 30px; font-size: 16px; font-weight: bold; background: rgba(0,0,0,.6); color: #FFF;}
     /*   #house_lists .house_items a.bt1{position: absolute; left: 4px; top: 220px;}
         #house_lists .house_items a.bt2{position: absolute; left: 60px; top: 220px;}
          #house_lists .house_items a.bt3{position: absolute; left: 150px; top: 220px;}
           #house_lists .house_items a.bt4{position: absolute; left: 215px; top: 220px;}*/
          #house_lists .house_items div{position: absolute; left: 4px; top: 210px;}
          
          
 ul.dowebok {  margin: 0; padding: 0; list-style-type: none;}
ul.dowebok li { display: inline-block;  margin: 0; padding: 0;}

ul.dowebok li input.labelauty + label { font: 12px "Microsoft Yahei";}
    </style>
     <script charset="utf-8" src="kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh-CN.js"></script>


	</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
               
                    <div class="ibox-title">
                        <h5>增加楼盘基本信息</h5>
               
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" style="font-size:12px;">
                       <!--内容开始-->
<form class="form-horizontal" action="admin/house" method="post">
<input type="hidden" name="action" value="saveadd"/>
             	
                <div class="form-group col-sm-8">
					<label  class="col-sm-4 col-md-2 control-label">楼盘名字:</label>
	                <div class="col-sm-8 col-md-9">
		                 <input type="text" name="name"  class="form-control" value=""  placeholder="请输入楼盘名字">
					</div>
			    </div>
			    
			     <div class="form-group col-sm-4">
				
	                   <div class="col-sm-6">
		                   	<select name="country_id" id="country_s" class="form-control">
		                   		<option value="-1">选择国家</option>
		                   	    <c:forEach items="${countrys}" var="it">
		                   	    <option value="${it.id}">${it.name}</option>
		                   	    </c:forEach>
							</select>
	                   </div>
		                
						<div class="col-sm-6">
		                   	<select name="city_id" id="city_s" class="form-control">
								<option value="-1">选择城市</option>
							</select>
	                   </div>
	                
			    </div>
	 	  
	
			   <div class="form-group col-sm-8">
					<label  class="col-sm-4 col-md-2 control-label">关键字:</label>
	                <div class="col-sm-6 col-md-7">
		                 <input type="text" name="keyword"  class="form-control" value=""  placeholder="多个关键字用逗号(,)隔开">
	                </div>
			    </div>

               <div class="form-group col-sm-4">
				       <label  class="col-sm-5 col-md-3 control-label">区域:</label>
						<div class="col-sm-5">
		                     <input type="text" name="area"  class="form-control" value=""  placeholder="楼盘所在国家区域">
						</div>
	                   <div class="col-sm-1 text-left">
		                        <span class="glyphicon glyphicon-map-marker"></span>
	                   </div>
			    </div>
	
			      <div class="form-group col-sm-8">
					<label  class="col-sm-3 col-md-2 control-label">楼盘地址:</label>
	                <div class="col-sm-9 col-md-9">
		                 <input type="text" name="addr"  class="form-control" value=""  placeholder="楼盘地址">
	                </div>
			      </div>
			      
			     <div class="form-group col-sm-4">
				
	                <div class="col-sm-6">
	                     <select name="price_rmb" class="form-control">
	                        <option value="50 万以下">50 万以下</option>
	                        <option value="50-100万">50-100万</option>
	                        <option value="100-150万">100-150万</option>
	                        <option value="150-200万">150-200万</option>
	                        <option value="200-300万">200-300万</option>
	                        <option value="300-500万">300-500万</option>
	                        <option value="500-800万">500-800万</option>
	                        <option value="800万以上">800万以上</option>
	                     </select>
		             
	                </div>
	                 <div class="col-sm-6">
		                 <input type="text" name="price_other"  class="form-control" value=""  placeholder="其它币XX万起">
	                </div>
			      </div>
		
			        <div class="form-group col-sm-8" >
						<label  class="col-sm-3 col-md-2 control-label">物业类型:</label>
		                <div class="col-sm-9 col-md-9">
							<ul class="dowebok">
								<!--<li><input type="checkbox" name="checkbox" disabled checked data-labelauty="HTML"></li>-->
								<li><input type="checkbox" value="住宅" name="types" checked data-labelauty="住宅"></li>
								<li><input type="checkbox" value="花园洋房"  name="types" data-labelauty="花园洋房"></li>
								<li><input type="checkbox" value="别墅"  name="types" data-labelauty="别墅"></li>
								<li><input type="checkbox" value="公寓"  name="types" data-labelauty="公寓"></li>
							    <li><input type="checkbox" value="其它"  name="types" data-labelauty="其它"></li>
							</ul>
							<div style="clear: both;"></div>
		                </div>
			      </div>
			     
			      
			       <div class="form-group col-sm-4">
				
	                <label  class="col-sm-5 col-md-3 control-label">特色:</label>
	                 <div class="col-sm-7 col-md-9">
		                 <input type="text" name="feature"  class="form-control" value="精装、无公摊、永久产权"  placeholder="精装、无公摊、永久产权">
	                </div>
			      </div>
			      
			       <div style="clear: both;"></div>
	
	
	     <div class="form-group col-sm-7">
	                <label  class="col-sm-2 col-md-2 control-label">产权:</label>
	                 <div class="col-sm-3">
		                 <input type="text" name="propertys"  class="form-control" value="永久产权"  placeholder="永久产权">
	                </div>

	                 <label  class="col-sm-2 col-md-2 control-label">面积:</label>
	                 <div class="col-sm-2">
		                 <input type="text" name="sizes"  class="form-control" value="46-300"  placeholder="永久产权">
		               
	                </div>
	                <div class="col-sm-1 text-left">M<sup>2</sup></div>
 
			 <!--        <div class="col-sm-3">
		                <select  name="fitment"  class="form-control">
		                	<option value="精装修">精装修</option>
		                	<option value="毛坯房">毛坯房</option>
		                </select>
	                </div> -->
				  
	                 
		</div>
		<div class="form-group col-sm-5">
				 <label  class="col-sm-2 col-md-2 control-label">首付:</label>
	                 <div class="col-sm-4">
		                <select  name="payment"  class="form-control">
		                    <%
		                      for(int i=10;i<101;i+=10)
		                      {
		                    	  %>
		                    	  <option value="<%=i%>"><%=i%></option>
		                    	  <%
		                      }
		                    %>
		              
		                </select>
		                
	                </div>
	                 <label  class="col-sm-2 col-md-2 control-label">排序:</label>
	                 <div class="col-sm-4">
		                <select  name="level"  class="form-control">
		                	<option value="1">1</option>
		                	<option value="2">2</option>
		                	<option value="3">3</option>
		                	<option value="4">4</option>
		                	<option value="5">5</option>
		                	<option value="6">6</option>
		                	<option value="7">7</option>
		                	<option value="8">8</option>
		                	<option value="9">9</option>
		                </select>
		                
	                </div>
				 
            </div>
            
            <div class="form-group col-sm-6">
					<label  class="col-sm-3 col-md-2 control-label">主力户型:</label>
	                 <div class="col-sm-3">
		                 <input type="text" name="huxing" class="form-control"  placeholder="主力户型"/>
	                </div>
	                
	                <label  class="col-sm-3 control-label">装修类型:</label>
	                 <div class="col-sm-3">
		                <select  name="fitment"  class="form-control">
		                	<option value="毛坯">毛坯</option>
		                	<option value="精装">精装</option>
		                </select>
		                
	                </div>

            </div>
             <div class="form-group col-sm-6">
            	       <label class="col-sm-3 col-md-2 control-label">拥金：</label>
            	        <div class=" col-sm-3 col-md-5">
							 <div  class="input-group">
								  <input name="yj_persent" class="form-control" placeholder="拥金比例10%" value="10">
								  <span class="input-group-addon" id="basic-addon1">%</span>
							 </div>
						</div>
						
						 <div class=" col-sm-3 col-md-5">
						   <div class="input-group">
							 	<input name="yj_many" class="form-control" placeholder="拥金比例5万">
							  <span class="input-group-addon" id="basic-addon1">万</span>
						   </div>
						</div>          	       	
	                  
            </div>
            
             <div class="form-group col-sm-12 ">
					   <label  class="col-sm-2 col-md-1 control-label">基本信息:</label>
	             <div class="col-sm-8 col-md-10" >
					    <textarea col="23" rows="5" name="txt1" id="txt1_id" class="form-control" style="width:100%;height:200px;" > </textarea>
							<script type="text/javascript">
											    	
							        KindEditor.ready(function(K) {
							                window.editor = K.create('#txt1_id',{			
							                	uploadJson : 'admin/fileupload',
							    				allowFileManager : false
							                });
							        });
							</script>
                   </div>
              </div>
                    <div class="form-group col-sm-12 ">
					   <label  class="col-sm-2 col-md-1 control-label">服务配套:</label>
	             <div class="col-sm-8 col-md-10" >
					    <textarea col=23 rows="5" name="txt2" id="txt2_id" class="form-control" style="width:100%;height:200px;" > </textarea>
							<script type="text/javascript">
											    	
							        KindEditor.ready(function(K) {
							                window.editor = K.create('#txt2_id',{			
							                	uploadJson : 'admin/fileupload',
							    					allowFileManager : false
							                });
							        });
							</script>
                   </div>
              </div>
                    <div class="form-group col-sm-12 ">
					   <label  class="col-sm-2 col-md-1 control-label">特色:</label>
	             <div class="col-sm-8 col-md-10" >
					    <textarea col=23 rows="5" name="txt3" id="txt3_id" class="form-control" style="width:100%;height:200px;" > </textarea>
							<script type="text/javascript">
											    	
							        KindEditor.ready(function(K) {
							                window.editor = K.create('#txt3_id',{			
							                	uploadJson : 'admin/fileupload',
							    					allowFileManager : false
							                });
							        });
							</script>
                   </div>
              </div>
              
              
               <!-----------------图片----------------->
                <div class="form-group col-sm-4">
					    <label  class="col-sm-4 col-md-3 control-label">图片:</label>
	                  <div class="col-sm-4 col-md-3">
	                  	
                     <input  type="hidden"  value="" name="pic" id="pic_field"/>

				     <img src="img/upload.jpg" width="68" height="57" style="cursor: pointer;" id="pic_id" />
                     <!-- <label class="laydate-icon col-sm-1"></label>-->
		<script type="text/javascript">
        KindEditor.ready(function(K) {
				var editor = K.editor({
					uploadJson : 'admin/fileupload',
					allowFileManager : false
				});
				
				K('#pic_id').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							imageUrl : K('#pic_field').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#pic_field').val(url);
								K('#pic_id').attr("src",url);
								editor.hideDialog();
							}
						});
					});
				});
			});
			</script>
	                  </div>
	               
	            </div>
	            
	            <div  class="form-group col-sm-8">
	                 	<label  class="col-sm-3 col-md-2 control-label">置业目的:</label>
		                <div class="col-sm-9 col-md-9">
							<ul class="dowebok">
								<!--<li><input type="checkbox" name="checkbox" disabled checked data-labelauty="HTML"></li>-->
								<li><input type="checkbox" value="自住" name="target" checked data-labelauty="自住"></li>
								<li><input type="checkbox" value="商旅"  name="target" data-labelauty="商旅"></li>
								<li><input type="checkbox" value="投资"  name="target" data-labelauty="投资"></li>
							
							</ul>
							<div style="clear: both;"></div>
		                </div>
	            </div>
	            
	          <div class="form-group">
    <div class="col-sm-offset-3 col-sm-6">
      <button type="submit" class="btn btn-info">增加房产基础信息</button>
    </div>
  </div>
                       </form>
                       <!-- 内容结束 -->
                       <div style="clear: both;">
                       	
                       </div>
                    </div>
             
                </div><!-- ibox float-e.. -->
            </div>
       </div>
   </div>
   <%@include file="booter.jsp" %>
       <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <script type="text/javascript" src="js/jquery-labelauty.js" ></script>
<script>
$(function(){
	$(':input').labelauty();
	
	
	$("#country_s").change(function(){
		
		var id=$(this).val();
		$.get("admin/city",{parent_id:id,action:"subcitys"},function(data){
			   $("#city_s").empty();
		    for(var i=0;i<data.length;i++)
		    	{
		    	 $("#city_s").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
		    	}
			
		});
	});
});
</script>
</body>
</html>

