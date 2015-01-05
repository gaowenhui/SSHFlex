package com.lewoo.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;

import com.lewoo.action.MD5;
import com.lewoo.bean.Users;
import com.lewoo.service.UsersService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


public class UsersAction extends ActionSupport implements ModelDriven<Users> {

	private Users user = new Users();

	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}

	public Users getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	
    //ע��service
	private UsersService usersService;
	public UsersService getUsersService() {
		return usersService;
	}
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	/**
	 * 注册
	 */
	public String reg() throws Exception {
		HttpServletRequest request=ServletActionContext.getRequest();
		String userId=usersService.reg(user);
		//用户名
		String username =  user.getUName();
		request.setAttribute("username", username);
		//密码
		String password = user.getUPwd();
		request.setAttribute("password", password);
		//do not has email format: userID@youDomain ,urlencode ,utf-8
		String email = userId + "@lewoo.com.cn";
		request.setAttribute("email",email);
		//unix time , GMT+8 ,int 10 
		long time = System.currentTimeMillis()/1000;
		request.setAttribute("time",time);
		// md5($_GET['username'].$_GET['password'].$time.$_GET['email'].$groupid.APIKEY ),string 32 ,lower
		String sign = MD5.MD5Encode(username+password+time+email+"10"+ "5ZC,0uU2B2^;a?O;").toLowerCase();
		request.setAttribute("sign", sign);
		
		System.out.println("reg->"+username +" "+  password +" "+  email +" "+ time +" " + sign );
		return "regSucc";
		
	}

	/**
	 * 登录
	 */
	public String login() throws Exception {
		
		boolean flag=usersService.login(user);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		if(flag){
			//用户名
			String username =  user.getUName();
			request.setAttribute("username", username);
			//密码
			String password = user.getUPwd();
			request.setAttribute("password", password);
			//unix time , GMT+8 ,int 10 
			long time = System.currentTimeMillis()/1000;
			request.setAttribute("time",time);
			// md5(dx_username+dx_password+dx_time+APIKEY),string 32 ,lower
			String sign = MD5.MD5Encode(username+password+time+"5ZC,0uU2B2^;a?O;").toLowerCase();
			request.setAttribute("sign", sign);
			
			System.out.println("login->"+username +" "+  password +" " + time +" " + sign );
			response.setHeader("Set-Cookie", "cookiename=value;Path=/;Domain=172.168.3.87;Max-Age=seconds;HTTPOnly");
		    return "succ";
		}else 
		{ 
			request.setAttribute("loginError", "loginError");
			return "fail";
		}
	}
	
	public String login2(String name,String pwd) throws Exception {

		System.out.println("login2Action: "+name+" "+pwd);
		boolean flag=usersService.login2(name,pwd);
		System.out.println("login_flag: "+flag);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		if(flag){
		    return "succ";
		}else 
		{ 
			return "fail";
		}
	}
	
	/**
	 * 
	 * 修改密码
	 */
    public String modify()throws Exception{
		
    	usersService.modify(user);
    	
    	return "updatePasswordSucc";
    }
	
	
	/**
	 * ɾ��
	 */
	public String delete()throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		String userId=request.getParameter("userId");
		usersService.delete(Integer.parseInt(userId));
		return "succ";
	}
	

	/**
	 * �޸�
	 */
	public String update()throws Exception{
		
		usersService.update(user);

		return "updatePasswordSucc";
	}
	
	
}
