<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="com.lewoo.service.*" %>
<%@ page import="com.lewoo.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <%
  ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
    UsersService usersService = (UsersService) ctx.getBean("usersService"); 
  	//获得要修改的编号 
  	String id=request.getParameter("userId"); 
  	//进行参数的非空验证 
  	if(id==null){ 
  		response.sendRedirect("/list.jsp"); 
  	} else{ 
  		//将编号传到数据库上获得对应的新闻信息 
  	   Users user=usersService.getById(Integer.parseInt(id)); 
  		//进行空对象验证 
  		if(user==null){ 
  			response.sendRedirect("/list.jsp"); 
  		} else{ 
  		//显示信息，进行修改 
   %>
  
  <form method="post" action="user!modify.action"> 
   <input type="hidden" name="UId" value="<%=user.getUId() %>">
    userName:<input type="text" name="UName" value="<%=user.getUName() %>"></br>
    userPwd:<input type="password" name="UPwd" value="<%=user.getUPwd() %>"></br>
    <input type="submit" value="修改"></form>
    
    <%
     }
    }
    %>
  </body>
</html>
