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
    
    <title>列表显示页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
 <script src="js/jquery.js" type="text/javascript"></script>
 <script src="js/jquery.ui.draggable.js" type="text/javascript"></script>
 <script src="js/jquery.alerts.js" type="text/javascript"></script>
 <link href="js/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
 <script type="text/javascript"> 
		$(document).ready( function() {	
		var uid = $("#hiduid").val();
				$("#confirm_button"+uid).click( function() {
					jConfirm('你确定要删除吗?', '确认框', function(r) {
						jAlert('Confirmed: ' + r, '结果');
						alert($("#confirm_button"+uid).val());
						//if(r==true){
						// var uid = $("#hiduid").val();
						 //alert(uid);
						 //$(".ajax.load").load("user!delete.action?userId="+uid+" .post";
						//}
						
					});
				});
			});
 </script>
 <script type="text/javascript"> 
        function tiaozhuan(){
			var str=document.zhuanForm.page.value;
			//实现提交
			document.zhuanForm.action="list.jsp?page="+str;
			document.zhuanForm.submit();
		}
</script>
  </head>
  
  <body><br>
<%
   ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
    UsersService usersService = (UsersService) ctx.getBean("usersService"); 
  //获得所有记录  
  List list=usersService.findAll(); 
  if(!list.isEmpty()){ 
 
  //确定每页显示的记录数 
  	int pageSize=3; 
  	//获得记录的总数 
  	int totalRow=list.size(); 
  	//计算总页数 
  	int totalPage=(totalRow%pageSize==0)? totalRow/pageSize : totalRow/pageSize +1; 
  	//确定当前页 
  	int currPage=1; 
  	//判断是否存在当前页的参数 
  	if(request.getParameter("page")!=null){ 
  		//更改当前页 
  		currPage=Integer.parseInt(request.getParameter("page")); 
  	} 
  	//判断当前页的取值范围 
  	if(currPage<1){ 
  		currPage=1; 
  	} 
  	if(currPage>totalPage){ 
  		currPage=totalPage; 
  	} 
  	//根据当前页确定开始记录的索引 
  	int startInd=(currPage-1)*pageSize; 
  	//确定结束位置的索引 
  	int endInd=currPage*pageSize-1; 
  	//判断最后一页的结束位置索引的取值范围 
  	if(endInd>=totalRow){ 
  		endInd=totalRow-1; 
  	} 
  	//根据索引确定要显示的信息 
%>
<center>
<a href="http://172.168.3.87:8080/discuz">进入社区</a>
    <table border="1" cellpadding="0" cellspacing="0" width="80%">
     	<tr bgcolor="#FF6633">
            <th width="20%">userID</th>
    		<th width="20%">userName</th>
    		<th width="20%">userPwd</th>
    		<th width="10%">修改</th>
            <th width="10%">删除</th>
        </tr>
    	<%
    		for(int i=startInd;i<=endInd;i++){
    		 Users	user=(Users)list.get(i);
    		//显示
    	%>
    	<tr>
    		<td><%=user.getUId() %></td>
    		<td><%=user.getUName() %></td>
    		<td><%=user.getUPwd() %></td>
    		<td><a href="<%=path %>/update.jsp?userId=<%=user.getUId()%>">update</a></td>
    	    <td><a href="user!delete.action?userId=<%=user.getUId()%>">delete</a></td> 
    		<!--<td><input id="confirm_button"+<%=user.getUId() %> type="button" value="delete" /></td> -->
    	</tr>   
    	<tr>
    	<input id="hiduid" type="hidden" value="<%=user.getUId() %>" />
    	</tr>   			
    	<%
    	 }
    	%>    
    </table><br>
    当前第<%=currPage %>页/共<%=totalPage %>页                <a href="<%=path %>/list.jsp?page=<%=currPage-1 %>">  上一页</a>      <a href="<%=path %>/list.jsp?page=<%=currPage+1 %>">  下一页</a>    <a href="<%=path %>/list.jsp">  首页</a>     <a href="<%=path %>/list.jsp?page=<%=totalPage %>">   尾页</a>
   <br>
   <form name="zhuanForm" >
   		跳转到第
   		<select name="page" onChange="tiaozhuan()">
   			<%
   				for(int i=1;i<=totalPage;i++){
   					%>
   					<option value="<%=i %>"  
   					<%
   						//判断是否是当前页
   						if(i==currPage){
   							//直接打印一句话
   							out.print(" selected");
   						}
   					 %>
   					><%=i %></option>
   					<%
   				}
   			 %>
   		</select>
   		页
   </form>
   
   <%
   }else{
   %>
   
   <font color="red">当前没有任何记录信息</font><br>   
   <%} %>
    </center>
   
  </body>
</html>
 <script type="text/javascript">
 //alert($("#username").val());
var dx_username = '${username}';
var dx_password = '${password}';
var dx_time = '${time}';
//unix time , GMT+8 ,int 10
var dx_sign = '${sign}';
// md5(dx_username+dx_password+dx_time+APIKEY),string 32 ,lower
var dx_shop_api_url = '172.168.3.87:8080/discuz/shop_api.php';
//do not add https:// or http://
var dx_action='login';
var _bdhmProtocol = (("https:" == document.location.protocol) ? "https://" : "http://");
//alert("login: "+dx_username+" " + dx_password+" " + dx_time+" " +  dx_sign );
document.write( unescape("%3Cscript src='" + _bdhmProtocol + dx_shop_api_url+ '%3Fusername%3D'+dx_username + '%26password%3D'+dx_password + '%26sign%3D'+ dx_sign +'%26time%3D'+ dx_time + '%26action%3D' + dx_action  + "' type='text/javascript'%3E%3C/script%3E") );

</script>
