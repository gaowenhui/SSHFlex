package com.lewoo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public  class DbConnection {
	
//	public static Connection getConnection() throws SQLException {
//		Connection conn = null;
//		try {
//			 Class.forName( "oracle.jdbc.driver.OracleDriver" );
//			 conn = DriverManager.getConnection( "jdbc:oracle:thin:@172.168.3.47:1521:orcl", "tax", "tax");
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return conn;
//	}
// 
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//String url = "jdbc:oracle:thin:@140.28.19.251:1521:ZBDS_251";
			String url = "jdbc:mysql://localhost:3306/test";
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
}
