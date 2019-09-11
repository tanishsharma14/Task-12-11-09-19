package com.tanish;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(
		urlPatterns = { "/VerifyUser" }, 
		initParams = { 
				@WebInitParam(name = "userid", value = "tanish"), 
				@WebInitParam(name = "password", value = "tanish123")
		})
public class VerifyUser extends HttpServlet {
	Connection con;
	public void init()
	{
		try {
			 ServletContext ctx=this.getServletContext();
			 String driver=ctx.getInitParameter("Driver");
			 String url=ctx.getInitParameter("url");
			 String user=ctx.getInitParameter("user");
			 String password=ctx.getInitParameter("password");
			 System.out.println("Password: "+password);
			 Class.forName(driver);
			 con=DriverManager.getConnection(url,user,password);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid=request.getParameter("userid");
		String password=request.getParameter("password");
		String type=request.getParameter("utype");
		
		
		
		if(type.equals("owner"))
		{
			ServletConfig config=this.getServletConfig();
			String name=config.getInitParameter("name");
			String pass=config.getInitParameter("password");
			
			
			if(userid.equals(name)&&password.equals(pass))
			response.sendRedirect("admin.jsp");
		}else
		{
			try {
				PreparedStatement psmt=con.prepareStatement("select userid,password from users where userid=? and password=?");
				psmt.setString(1,userid);
				psmt.setString(2,password);
				
				ResultSet rs=psmt.executeQuery();
				while(rs.next())
				{
					HttpSession session=request.getSession();
					session.setAttribute("userid",userid);
					response.sendRedirect("buyerpage.jsp");
				}
			} catch (Exception e) {
			
				e.printStackTrace();
			}
		}
	}

}
























