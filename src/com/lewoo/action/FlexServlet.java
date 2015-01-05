package com.lewoo.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FlexServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public FlexServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String selects = request.getParameter("selects");
		
		String UName = request.getParameter("UName");
		String UPwd = request.getParameter("UPwd");
		
		
		System.out.println("selects: "+selects+" UName: "+UName+" UPwd: "+UPwd);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pout = null;
		try {
			pout = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pout.print("选择：" + selects);
	}
}
