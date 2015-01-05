package com.lewoo.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUploadsServlet extends HttpServlet {
	   private static final long serialVersionUID = 5425836142860976977L;
       //定义文件的上传路径 
	   private String uploadPath =null;
	   // 限制文件的上传大小 
	   private int maxPostSize = 1000 * 1024 * 1024;  //最大1000M
	   private String className = null;
		
	   private String service = null;
			
	   private String user  = null;
			
	   private String password = null;
	   private Connection conn = null;
	   private PreparedStatement ps=null;
	   private Statement st=null;
	   private ResultSet rs=null;
       //文件路径
	   private  String path="";
       //文件类型
	   private  String type="";
       //标志变量
	   private  String flag="";
        //文件名
	   private  String name="";
       //如果已存在声音文件
	   private  String oldName="";
	public FileUploadsServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}
    
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
	               throws ServletException, IOException { 
	          System.out.println("Access !"); 
	          response.setContentType("text/html;charset=UTF-8"); 
	          request.setCharacterEncoding("utf-8");
	          response.setCharacterEncoding("utf-8");
	          //获得参数
	          String JGID=request.getParameter("id");
	          String level=request.getParameter("level");   
	          //实例化文件工厂类
	          DiskFileItemFactory factory = new DiskFileItemFactory(); 
	          factory.setSizeThreshold(4096); 
	          ServletFileUpload upload = new ServletFileUpload(factory); 
	          upload.setHeaderEncoding("utf-8");
	          upload.setSizeMax(maxPostSize); 
	          //根据（单位代码）判断文件是否存在，若不存在，新创建
	          if(!(new File(uploadPath + "/" + JGID).isDirectory()))
				{
	        	  new File(uploadPath + "/" + JGID).mkdir();
	        	  new File(uploadPath + "/" + JGID + "/media").mkdir();
		          new File(uploadPath + "/" + JGID + "/picture").mkdir();
		          new File(uploadPath + "/" + JGID + "/textfile").mkdir();
		          new File(uploadPath + "/" + JGID + "/voicefile").mkdir();
				}
	          
	           try { 
	             List fileItems = upload.parseRequest(request); 
	             Iterator iter = fileItems.iterator(); 
	            
	              while (iter.hasNext()) { 
	                 FileItem item = (FileItem) iter.next(); 
	                  if (!item.isFormField()) { 
	                     name = item.getName();
	                     String newName = name.toLowerCase();
                     //判断文件类型
	       	          if(newName.indexOf(".jpg")>0||newName.indexOf(".bmp")>0||newName.indexOf(".gif")>0||newName.indexOf(".png")>0){
	       	        	path=uploadPath + "/" + JGID + "/picture";
	       	        	type="1";//1---图片
	       	          };
	       	          if(newName.indexOf(".flv")>0){
	       	        	path=uploadPath + "/" + JGID + "/media";
	       	        	type="2";//2---视频
	       	          };  
	       	          if(newName.indexOf(".mp3")>0||newName.indexOf(".wav")>0||newName.indexOf(".wma")>0){
	       	        	path=uploadPath + "/" + JGID + "/voicefile";
	       	        	type="3";//3---音频
	       	          };
	       	          if(newName.indexOf(".txt")>0||newName.indexOf(".doc")>0||newName.indexOf(".xls")>0||newName.indexOf(".ppt")>0){
	       	        	path=uploadPath + "/" + JGID + "/textfile";
	       	        	type="4";//4---文本
	       	          };
	                      try { 
	                    	 
	                         //连接数据库
	                         Class.forName(className);
	             			 conn = DriverManager.getConnection(service, user, password);
	             			 //判断声音文件是否存在,如果存在则删除
	             			 String sql="SELECT T.FILENAME FROM DEPARTTOFILE T WHERE T.SWJG_DM='"+JGID+"' AND T.FILETYPE=5";
	             			 st=conn.createStatement();
	             			 rs=st.executeQuery(sql);
	             			 while(rs.next()){
	             				  oldName =rs.getString("FILENAME");
	             			 }
	             			
		                     File oldFile=new File(path + "/"+oldName);
		                     if(oldFile.exists()&&type=="5"){
		                    	 oldFile.delete(); 
		                    	
		         	  		  }
		                    //将文件上传到服务器指定多目录中
	                         item.write(new File(path + "/" + name));  
	                         response.getWriter().write("上传成功!");
		         	  		 //向数据库中添加记录
	             			 ps = conn.prepareStatement("INSERT INTO DEPARTTOFILE (SWJG_DM,FILEPATH,FILETYPE,FILEDISCRIPTION,FILENAME) VALUES (?,?,?,SYSDATE,?)");
	             						         	  			ps.setString(1, JGID);
	             						         	  			ps.setString(2, path);
	             						         	  			ps.setString(3, type);
	             						         	  			ps.setString(4, name);
	             						         	  			ps.execute();
	             						         	  			ps.close();
	                         
	                         System.out.println(path + "/"+name);
	                      } catch (Exception e) { 
	                         e.printStackTrace(); 
	                         response.getWriter().write(e.getMessage());
	                     } 
	                 } 
	             } 
	          } catch (FileUploadException e) { 
	             e.printStackTrace(); 
	             response.getWriter().write(e.getMessage());
	             System.out.println(e.getMessage() + "结束"); 
	         } 
	        PrintWriter out = response.getWriter();
	  		//out.print(flag);
	  		out.flush();
	  		out.close();
	     } 

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response); 
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response); 
	}

	
	public void init() throws ServletException {
		try {
			InputStream in = getServletContext().getResourceAsStream("/WEB-INF/classes/gis.properties");
			Properties properties = new Properties();
			properties.load(in);
			className = ((String) properties.get("db.className")).trim();
			service = ((String) properties.get("db.service")).trim();
			user = ((String) properties.get("db.user")).trim();
			password = ((String) properties.get("db.password")).trim();
			uploadPath=((String) properties.get("emapportal.filepath")).trim();
			System.out.println("className:"+className);
			in.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	       public String getServletInfo() { 
	          return "Short description"; 
	      } 

}
