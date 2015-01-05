package com.lewoo.action;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lewoo.dao.DbConnection;


public class UpImage extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        CallableStatement call = null;
        System.out.println(request.getContentLength());
		try{
			if(request.getContentLength()>297){
				String imageId = null;
				HttpSession session = request.getSession();
		        String width = (String)session.getAttribute("width");
		        String height = (String)session.getAttribute("height");
		        String flage = (String)session.getAttribute("flage");
				String mkId = (String)session.getAttribute("mkId");
				String czy = (String)session.getAttribute("czy");
		        BufferedInputStream inputStm=new BufferedInputStream(request.getInputStream());
		        int len = request.getContentLength();
		        byte bb[]=new byte[len];
		        int i=0;
		        while(i<len){
		        	bb[i]=(byte) inputStm.read();
		        	i++;
		        }
		        inputStm.close();
		        String tmp = new String(bb,"ISO8859_1");
		        int start1 = tmp.indexOf("boundary=");
		        tmp = tmp.substring(start1+9);
		        int start2 = tmp.indexOf("\r\n");
		        String boundary = tmp.substring(0,start2);
		        start1 = tmp.indexOf(boundary);
		        tmp = tmp.substring(start1 + boundary.length());
		        start1 = tmp.indexOf(boundary);
		        String image = tmp.substring(0, start1);
		        tmp = tmp.substring(start1 + boundary.length());
		        start1 = image.indexOf("\r\n\r\n");
				start2 = image.lastIndexOf("\r\n");
				image = image.substring(start1 + 4, start2);
				conn = DbConnection.getConnection();
				System.out.println("11"+flage);
				if("insert".equals(flage)){
					
					//String id_sno = "";
						pstmt = conn.prepareStatement("insert into SDLY_PIC(OC_FLAG,C_PIC,OC_YXBZ,DT_SCSJ,OC_CZY) values (?,?,?,now(),?)");
						pstmt.setString(1, mkId);
						pstmt.setBytes(2, image.getBytes("ISO8859_1"));
						pstmt.setString(3, "T");
						pstmt.setString(4, czy);
						pstmt.execute();
						//imageId = id_sno;		
				}
				else if("update".equals(flage)){
				
					imageId = (String)session.getAttribute("imageId");
					System.out.println(imageId);
					pstmt = conn.prepareStatement("UPDATE SDLY_PIC SET C_PIC=? WHERE ID_SNO=?");
					pstmt.setBytes(1, image.getBytes("ISO8859_1"));
					pstmt.setString(2, imageId);
					pstmt.executeUpdate();
				}else{
					System.out.println("标志错误");
				}
				response.sendRedirect("imageUpLoad.jsp?imageId="+imageId+"&flage=update&width="+width+"&height="+height+"&mkId="+mkId+"&czy="+czy);
								
			}else{
				System.out.println("没有输入流");
				response.sendRedirect("error.html");
			}
		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("error.html");
		}finally{
			try{
				if(call!=null)call.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	}

}
