<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>index</title>
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
		<center>
   <h3>注册成功！</h3><br/><br/><br/>
    <a href="<%=path %>/login.jsp"">登录</a><br/><br/>
  </center>
  <script src="js/jquery-1.8.2.min.js" type="text/javascript"></script> 
    <!--  <input type="hidden" name="username" id="username" value='${username}' /> 
    <input type="hidden" name="password" id="password" value='${password}' />
     <input type="hidden" name="email" id="email" value='${email}' />
    <input type="hidden" name="time" id="time" value='${time}' />
    <input type="hidden" name="sign" id="sign" value='${sign}' />-->
 
 <script type="text/javascript">
 //alert($("#username").val());
var dx_username = '${username}';
var dx_password = '${password}';
var dx_email = '${email}';
//do not has email format: userID@youDomain ,urlencode ,utf-8
var dx_groupid = '10';
// bbs/admin.php ,user:add user,form:select:option value ,string like smallint in mysql
var dx_time = '${time}';
//unix time , GMT+8 ,int 10
var dx_sign = '${sign}';
// md5(dx_username+dx_password+dx_time+APIKEY),string 32 ,lower
var dx_shop_api_url = '172.168.3.87:8080/discuz/shop_api.php';
//do not add https:// or http://
var dx_action = 'reg';
var _bdhmProtocol = (("https:" == document.location.protocol) ? "https://" : "http://");

document.write( unescape("%3Cscript src='" + _bdhmProtocol + dx_shop_api_url+ '%3Fusername%3D'+dx_username + '%26password%3D'+dx_password + '%26sign%3D'+ dx_sign +'%26time%3D'+ dx_time + '%26action%3D' + dx_action + '%26email%3D' + dx_email  +'%26groupid%3D' +dx_groupid+   "' type='text/javascript'%3E%3C/script%3E") );

//alert("reg: "+dx_username+" " + dx_password+" " + dx_email+" " + dx_time+" " +  dx_sign );
</script>
	</body>
</html>
