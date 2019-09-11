<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
 <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr> <th>Id</th> <th>Name</th> <th>Subject</th> <th>price</th>  </tr>
<%
	String driver=application.getInitParameter("Driver");
	String url=application.getInitParameter("url");
	String user=application.getInitParameter("user");
	String password=application.getInitParameter("password");
	
	Class.forName(driver);
	Connection con=DriverManager.getConnection(url,user,password);
	
	String id[]=request.getParameterValues("id");
%>

	
<%
	for(String s:id)
	{
		PreparedStatement psmt=con.prepareStatement("select *from book where book_id=?");
		psmt.setString(1,s);
		
		ResultSet rs=psmt.executeQuery();
		
		while(rs.next())
		{
			
%>
		
			
		<tr>
		 <td><%=rs.getString(1) %></td>
		 <td> <%=rs.getString(2) %></td>
		 <td> <%=rs.getString(3) %></td>
		 <td> <%=rs.getString(4) %></td>
		 </tr>
		
		

<% 
		}
	}
	
%>
</table>
</body>
</html>