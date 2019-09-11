package com.tanish;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateProfileData")
public class UpdateProfileData extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String password=request.getParameter("password");
		String address=request.getParameter("address");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		
		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("userid");
		PrintWriter out=response.getWriter();
		
		out.println(password);
		out.println(address);
		out.println(mobile);
		out.println(email);
		 ServletContext ctx=this.getServletContext();
		 String driver=ctx.getInitParameter("Driver");
		 String url=ctx.getInitParameter("url");
		 String user=ctx.getInitParameter("user");
		 String password1=ctx.getInitParameter("password");
		
		 try{
		 Class.forName(driver);
		 Connection con=DriverManager.getConnection(url,user,password1);
		 PreparedStatement psmt=con.prepareStatement("update users set password=?,address=?,mobile=?,email=? where userid=?");
		 psmt.setString(1,password);
		 psmt.setString(2,address);
		 psmt.setString(3,mobile);
		 psmt.setString(4,email);
		 psmt.setString(5,userid);
		 int res=psmt.executeUpdate();
		 
		 if(res==1)
			 	out.println("Data updated successfully");
		 else
			 out.println("Data not updated");
		 }catch(Exception e)
		 {
			 
		 }
		
	}

}
