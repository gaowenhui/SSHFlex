package com.lewoo.action;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lewoo.dao.DbConnection;


public class LoadImage extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       	String imageId = (String) request.getParameter("imageId");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rst = null;
		
		try{
			conn = DbConnection.getConnection();
			pstmt = conn.prepareStatement("SELECT C_PIC FROM SDLY_PIC WHERE ID_SNO = ?");
			pstmt.setString(1, imageId);
			rst = pstmt.executeQuery();

			if(rst.next()){
				BufferedInputStream inputStrm = new BufferedInputStream(rst.getBinaryStream("C_PIC"));
			
				byte[] buff = new byte[1024]; 
				ServletOutputStream  outputStrm = response.getOutputStream();
				int i;
				while((i=inputStrm.read(buff))!=-1){
					outputStrm.write(buff, 0, i);
				}
			
				inputStrm.close();
				outputStrm.flush();
				outputStrm.close();
			}else{
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	}

}
