<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
		<script type="text/javascript">
	function reg(){
	//通过id进行非空验证
    if($("#UName").val()==''){
    alert("用户名不能为空！");
    $("#UName").focus();
    //var json = '{ProdId:'',ProdName:'',items:[{ProdId:'3',ProdName:'西兰花',Num:'20斤',Price:'3.5元'},{ProdId:'3',ProdName:'西兰花',Num:'20斤',Price:'3.5元'},{ProdId:'3',ProdName:'西兰花',Num:'20斤',Price:'3.5元'}]}';
    //alert(json);
    //alert(json.toJSONString());
    return false;
    }
    else if($("#UPwd").val()==''){
    alert("密码不能为空！");
    $("#UPwd").focus();
    return false;
    }
    else 
    return true;
    }
	</script>
  <body>
   <center>
			<h3>
				用户注册
			<br/>
    <a href="<%=path %>/login.jsp"">登录</a><br/><br/>
			</h3>
			<br>
  <form method="post" action="user!reg.action" onsubmit="return reg()"> 
    userName:<input type="text" name="UName" id="UName"></br>
    userPwd:<input type="password" name="UPwd" id="UPwd"></br>
    <input type="submit" value="注册"></form>
     </center>
  </body>
</html>
