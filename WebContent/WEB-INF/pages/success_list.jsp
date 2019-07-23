<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>成功案例列表</title>
		<%@include file="header.jsp" %>
    <style type="text/css">
    	#treemenu ul{ list-style:none; padding: 0;}
    	#treemenu .parent_menu>a{ font-family: "微软雅黑"; color: #333; font-weight: bold; line-height: 35px;}
    	#treemenu .parent_menu>span{cursor: pointer;}
    	#treemenu .sub_menu { color: #333; line-height: 32px; padding-left: 22px;}
    	#treemenu .sub_menu a{ color: #333;}
    	
    	
    	    /*成功案例*/
	       
	       #success_case{}
	       #success_case .success_list{ float: left; margin-right: 15px;}
	       #success_case .success_list a{ text-decoration: none; color: #333;}
	       #success_case .success_list a:hover{text-decoration: underline;}
	       #success_case .success_list .topimg{ width: 385px; height: 180px; position: relative;}
	        #success_case .success_list .topimg img{ position: absolute; left: 0; top: 0;}
	        #success_case .success_list .topimg div{ height: 60px; padding: 10px; width: 385px; background: rgba(0,0,0,.5); color: #FFF; position: absolute; left: 0; top:120px ;}
	        #success_case .success_list .topimg div h5{padding:0;margin:0; line-height: 20px; padding-left: 15px; font-size: 14px; font-weight: bold; color: #FFF; margin-left: 20px; border-left: 3px #FFF solid;}
	        #success_case .success_list .topimg div h6{padding:0;margin:0; line-height: 20px; padding-left: 15px; font-size: 12px;  color: #FFF; margin-left: 20px; border-left: 3px #FFF solid;}
	      
	      
	      #success_case .success_list .personcase{width: 385px; height: 184px; border:1px #ccc solid; border-top: 0; padding: 10px;}
	      #success_case .success_list .personcase img{ margin-right: 10px;}
	      #success_case .success_list .personcase h6{font-size: 16px; line-height: 24px;}
	      #success_case .success_list .personcase p{ font-size: 12px; color: #666; margin-top: 10px; line-height: 25px; height: 55px; overflow: hidden;}
	     
    </style>


	</head>
	<body>
		<div style="height: 40px;"></div>
		<div class="container-fluid" >
			<div class="row">
			
				 <div class="col-sm-12"  style="border-left:1px #ccc solid;">
				    <!--right start-->
				    
				    <div class="row">
				    	<span style="font-size:20px; font-weight: bold; ">&nbsp;&nbsp</span>
				    	<a href="admin/successfull?action=toadd" class="btn btn-info" style="margin: 10px 20px;">＋添加成功案例</a>
				    </div>
				  
				
				  
				    <table class="table table-hover table-striped table-condensed table-responsive">
				    	<tr><th>ID</th><th>姓名</th><th>项目</th><th>排序</th><th>管理</th></tr>
				    	
				    	<c:forEach items="${list}" var="art" varStatus="vs">
					    	<tr><td>${vs.count}</td><td>${art.name}</td>
					    		<td>${art.house}</td>
					    		<td>${art.level}</td>
					    		<td>
					    			<a href="admin/successfull?action=edit&id=${art.id}" class="btn btn-info btn-sm">
					    				<i class="fa fa-edit">修改</i>
					    			</a>
					    			<a href="admin/successfull?action=del&id=${art.id}" class="btn btn-danger btn-sm">
					    				<i class="fa fa-close">删除</i>
					    			</a>
					  
					    			
					    		</td>
					    	</tr>
				    	</c:forEach> 
				    	
				    </table>
				    <div class="row">
				<%--       <div class="col-sm-8">
				       <div class="text-center">
                            <div class="btn-group">
                            <%  com.hq.db.PageDiv<Article> pd=(com.hq.db.PageDiv<Article>)request.getAttribute("pd"); %>
                            
                                <a href="admin/article/index?cid=${cid}&pageNo=<%=((pd.getPageNo()-1)>1?(pd.getPageNo()-1):1)%>" class="btn btn-white" ><i class="fa fa-chevron-left"></i>
                                </a>
                                <%
                                
                                  for(int i=pd.getStart();i<=pd.getEnd();i++)
                                  {
                                %>
                                <a class="btn btn-white" href="admin/article/index?cid=${cid}&pageNo=<%=i%>"><%=i%></a>
                                <%
                                  }
                                %>
                            
                                <a class="btn btn-white" href="admin/article/index?cid=${cid}&pageNo=<%=((pd.getPageNo()+1)<pd.getTotalPage()?(pd.getPageNo()+1):pd.getTotalPage())%>"><i class="fa fa-chevron-right"></i>
                                </a>
                            </div>
                     </div>
				      </div>
				      <div class="col-sm-4">
				         <h4>当前${pd.pageNo}/${pd.totalPage}页&nbsp;&nbsp;总共${pd.totalCount}条</h4>
				      </div> --%>
				    </div>
				     
				    <!--right end-->
				 </div>
			</div>
		</div>
		 <!-- 全局js -->
<%@include file="booter.jsp" %>

	</body>
</html>
