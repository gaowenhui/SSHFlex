package com.lewoo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.lewoo.action.MD5;
import com.lewoo.action.MD5ForDiscuz;
import com.lewoo.bean.Users;

public class UsersDAO extends HibernateDaoSupport {

	/**
	 *登录֤
	 */
	public boolean login(Users userForm) {
		// 根据用户输入的密码+查出的salt，用md5加密，跟数据库的md5串比较
		String hql_salt = "select Salt from  Users where UName=? and UPwd=?";
		String pwd = userForm.getUPwd();
		String salt = "";
		String md5pwd = "";
		Object[] args = { userForm.getUName(), userForm.getUPwd() };
		List result = getHibernateTemplate().find(hql_salt, args);
		if (!result.isEmpty()) {
			salt = result.get(0).toString();
			 MD5ForDiscuz md5 = new MD5ForDiscuz(pwd);   
		        //用MD5第一次加密   
		         pwd = md5.compute();     
		        //将加密后的密文加上dz_uc_members表的salt字段   
		        //因为DZ加密是使用MD5加密后加上随机码再次加密，所以需要还原加密   
		        pwd = pwd + salt;        
		        //再次用MD5加密   
		        MD5ForDiscuz m = new MD5ForDiscuz(pwd);      
		        //得到最终密文   
		        md5pwd = m.compute();  
		}
		// 验证
		String hql = "from Users where UName=? and Md5Pwd=?";
		Object[] values = { userForm.getUName(), md5pwd };
		List results = getHibernateTemplate().find(hql, values);
		if (results.isEmpty()) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean login2(String name,String pwd) {
		System.out.println("login2Dao");
	
		// 验证
		String hql = "from Users where UName=? and UPwd=?";
		Object[] values = {name, pwd };
		List results = getHibernateTemplate().find(hql, values);
		if (results.isEmpty()) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 
	 * 注册，返回userId， email格式：userId@lewoo.com
	 */
	public String reg(Users userForm) {
		String pwd = userForm.getUPwd();
		//生成一个随机6位数，作为md5算法的salt
		Random r = new Random();
		Double d = r.nextDouble();
		String salt = d + "";
		salt = salt.substring(3, 3 + 6);
		System.out.println(salt);
		//用MD5ForDiscuz加密
		MD5ForDiscuz md5 = new MD5ForDiscuz(pwd); 
		pwd = md5.compute(); 
		pwd = pwd + salt;  
	    MD5ForDiscuz m = new MD5ForDiscuz(pwd);      
        //得到最终密文   
        String md5pwd = m.compute();   
        userForm.setSalt(salt);
        userForm.setMd5Pwd(md5pwd);
		getHibernateTemplate().save(userForm);

		String hql = "select UId from  Users where UName=? and UPwd=?";
		Object[] values = { userForm.getUName(), userForm.getUPwd() };
		List results = getHibernateTemplate().find(hql, values);
		if (!results.isEmpty()) {
			return results.get(0).toString();
		} else {
			return "";
		}
	}

	/**
	 * 
	 * 修改密码
	 * 
	 * @throws SQLException
	 */
	public void modify(Users user) {
		
		// 根据用户输入的用户名查出dx的salt，将(新密码+salt)用md5加盐值算法加密
		Connection conn = DB.getConn();
		PreparedStatement pstmt;
		String name = user.getUName();
		String pwd = user.getUPwd();
		String salt = "";
		String md5pwd = "";
		String hql_salt = "select salt from  pre_ucenter_members where username='"
				+ name + "' ";
		try {
			// 开始事务，更改JDBC事务的默认提交方式
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(hql_salt);
			ResultSet rs = pstmt.executeQuery();
			conn.commit();// 提交JDBC事务
			rs.next();
			salt = rs.getString(1);
			 //admin为dz_uc_members表的password字段未加密前的明文   
	        MD5ForDiscuz md5 = new MD5ForDiscuz(pwd);      
	        //用MD5第一次加密   
	         pwd = md5.compute();      
	        //将加密后的密文加上dz_uc_members表的salt字段   
	        //因为DZ加密是使用MD5加密后加上随机码再次加密，所以需要还原加密   
	        pwd = pwd + salt;     
	        //再次用MD5加密   
	        MD5ForDiscuz m = new MD5ForDiscuz(pwd);     
	        //得到最终密文   
	        md5pwd = m.compute();   
			// 更新电商
			user.setSalt(salt);
			user.setMd5Pwd(md5pwd);
			getHibernateTemplate().update(user);
			// 更新discuz的ucenter
			int i = 0;
			String sql = "update pre_ucenter_members set password='" + md5pwd
					+ "' where username='" + name + "' ";
			pstmt = conn.prepareStatement(sql);
			i = pstmt.executeUpdate();
			conn.commit();// 提交JDBC事务
			System.out.println("resutl: " + i +" md5pwd: " + md5pwd + " salt: " + salt);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e1) {
			try {
				conn.rollback();// 回滚JDBC事务
			} catch (SQLException e) {
				e.printStackTrace();
			}
			e1.printStackTrace();
		}
	}

	/**
	 * 查询列表
	 */
	public List findAll() {
		return getHibernateTemplate().find("from Users");
	}
	
	public List<Users> findData() {
		return getHibernateTemplate().find("from Users");
	}
	

	/**
	 * ���
	 */
	public void add(Users user) {
		getHibernateTemplate().save(user);
	}

	/**
	 * ��userId��ѯ
	 * 
	 * @param userId
	 * @return
	 */
	public Users getById(int userId) {
		return getHibernateTemplate().get(Users.class, userId);
	}

	/**
	 * ɾ��
	 */
	public void delete(int userId) {
		Users user = getById(userId);
		if (null != user) {
			getHibernateTemplate().delete(user);
		}
	}

	/**
	 * �޸�
	 */
	public void update(Users user) {
		getHibernateTemplate().update(user);
	}

}
