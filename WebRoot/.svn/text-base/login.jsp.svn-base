<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
		<script type="text/javascript">
	function login(){
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
  </head>
  
  <body>
  <center>
      <%
			//判断是否有登陆失败的提示信息
			Object flag = request.getAttribute("loginError");
			if (null != flag) {
				//document.getElementById('span3').innerHTML='<font color="red">您输入的用户名和密码不匹配，请重新输入!</font>';
				out.print("<font color='red'>您输入的用户名和密码不匹配，请重新输入!</font>");
				request.removeAttribute("loginError");
			}
		%>
			<h3>
				用户登录
			<br/>
    <a href="<%=path %>/reg.jsp"">注册</a><br/><br/>
			</h3>
			<br>
  <form method="post" action="user!login.action" onsubmit="return login()"> 
    userName:<input type="text" name="UName" id="UName"></br>
    userPwd:<input type="password" name="UPwd" id="UPwd"></br>
    <input type="submit" value="登录"></form>
   </center>
  </body>
</html>
