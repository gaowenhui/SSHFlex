package com.lewoo.dao;

import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lewoo.bean.Users;
import com.lewoo.dao.DB;

public class DB {
	private static Connection conn = null;
	/**
	 * @param args
	 */
	
	public static Connection getConn() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//String url = "jdbc:oracle:thin:@140.28.19.251:1521:ZBDS_251";
			String url = "jdbc:mysql://localhost:3306/ultrax";
			conn = DriverManager.getConnection(url, "root", "root");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	  
	    private static int insert(Users type) {  
	        Connection conn = getConn();  
	        int i = 0;  
	        String sql = "insert into PARAM_DELTAIL (id,param_type,param_name,param_value,locale,seq,remark) values(?,?,?,?,?,?,?)";  
	        PreparedStatement pstmt;  
	        try {  
	            pstmt = conn.prepareStatement(sql);  
	            // Statement stat = conn.createStatement();  
	            pstmt.setInt(1, type.getUId());  
	            pstmt.setString(2, type.getUName());  
	            pstmt.setString(3, type.getUPwd());  
	            pstmt.setString(4, type.getMd5Pwd());  
	            pstmt.setString(5, type.getSalt());  
	            i = pstmt.executeUpdate();  
	            pstmt.close();  
	            conn.close();  
	        }  
	        catch (SQLException e) {  
	            e.printStackTrace();  
	        }  
	  
	        return i;  
	    }  
	  
	    private static List<Users> query() {  
	        Connection conn = getConn();  
	        String sql = "select t.type_name,t.type,t.remark from class1 t order by t.type_id asc,t.type_name asc";  
	        PreparedStatement pstmt;  
	        int count = 0;  
	        List<Users> typeList = new ArrayList<Users>();  
	        try {  
	            pstmt = conn.prepareStatement(sql);  
	            ResultSet rs = pstmt.executeQuery();  
	            while (rs.next()) {  
	                Users type = new Users();  
	                type.setUName(rs.getString("UName"));  
	                typeList.add(type);  
	                count++;  
	            }  
	            System.out.println("共查询到记录（条）"+ count);  
	            rs.close();  
	            pstmt.close();  
	            conn.close();  
	        }  
	        catch (SQLException e) {  
	            e.printStackTrace();  
	        }  
	        return typeList;  
	  
	    }  
	      
	    private static Integer getSeq(){  
	        Connection conn = getConn();  
	        String sql = "select SEQ_DETIAL.Nextval from dual";  
	        PreparedStatement pstmt;  
	        try {  
	            pstmt = conn.prepareStatement(sql);  
	            ResultSet rs = pstmt.executeQuery();  
	            rs.next();  
	            return rs.getInt(1);  
	        } catch (SQLException e) {  
	            e.printStackTrace();  
	        }  
	        return null;  
	      
	    }  
	  
	    private static int update(Users type) {  
	        Connection conn = getConn();  
	        int i = 0;  
	        String sql = "update users set password='" + type.getUPwd()
	                + "' where username='" + type.getUName() + "'";  
	        PreparedStatement pstmt;  
	        try {  
	            pstmt = conn.prepareStatement(sql);  
	  
	            i = pstmt.executeUpdate();  
	            System.out.println("resutl: " + i);  
	  
	            pstmt.close();  
	            conn.close();  
	        }  
	        catch (SQLException e) {  
	            e.printStackTrace();  
	        }  
	  
	        return i;  
	    }  
	      
	    private static int delete(String username) {  
	        Connection conn = getConn();  
	        int i = 0;  
	        String sql = "delete users where username='" + username + "'";  
	        PreparedStatement pstmt;  
	        try {  
	            pstmt = conn.prepareStatement(sql);  
	  
	            i = pstmt.executeUpdate();  
	            System.out.println("resutl: " + i);  
	  
	            pstmt.close();  
	            conn.close();  
	        }  
	        catch (SQLException e) {  
	            e.printStackTrace();  
	        }  
	  
	        return i;  
	    }  
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DB db=new DB();
		try {
			 System.out.println(db.getConn());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
