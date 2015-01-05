package com.lewoo.service;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import com.flex.MyObject;
import com.lewoo.bean.Users;
import com.lewoo.dao.UsersDAO;

public class UsersService {
	private UsersDAO usersDAO;

	public UsersDAO getUsersDAO() {
		return usersDAO;
	}

	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}
	
	/**
	 *登录֤
	 */
	public boolean login(Users userForm){
		return usersDAO.login(userForm);
	}
	
	public boolean login2(String name,String pwd){
		System.out.println("login2Service");
		return usersDAO.login2(name, pwd);
	}
	/**
	 * 注册
	 */
	public String reg(Users userForm){
		return usersDAO.reg(userForm);
	}
	/**
	 * 
	 * 修改密码
	 */
    public void modify(Users user){
		
	 usersDAO.modify(user);
    }
	
	/**
	 * ����ȫ����Ϣ
	 */
	public List findAll(){
		return usersDAO.findAll();
	}
	
	//Flex展示
	public String findData(){
		//  http://javacrazyer.iteye.com/blog/708463#
		System.out.println("userserviceFindData： ");
		List<Users> orgData=new ArrayList<Users>();
		   orgData=usersDAO.findData();
		 JSONArray json=JSONArray.fromObject(orgData);
		   String datas=json.toString();
		   System.out.println(datas);
	  return datas;
	}
	

	/**
	 * ���
	 */
	public void add(Users user){
		usersDAO.add(user);
	}
	
	/**
	 * ��userId��ѯ
	 * @param userId
	 * @return
	 */
	public Users getById(int userId){
		return usersDAO.getById(userId);
	}
	
	/**
	 * ɾ��
	 */
	public void delete(int userId){
		usersDAO.delete(userId);
	}
	
	/**
	 * �޸�
	 */
	public void update(Users user){
		usersDAO.update(user);
	}
	
	
}
