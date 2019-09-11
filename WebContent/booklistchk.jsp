<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String driver=application.getInitParameter("Driver");
String url=application.getInitParameter("url");
String user=application.getInitParameter("user");
String password=application.getInitParameter("password");

String sub=request.getParameter("subject");
Class.forName(driver);
Connection con=DriverManager.getConnection(url,user,password);
PreparedStatement psmt=con.prepareStatement("SELECT book_id,book_name from book where book_subject=?");
psmt.setString(1,sub);
ResultSet rs=psmt.executeQuery();
%>

<form action="bookdetail.jsp">
	<%
		while(rs.next())
		{
			
			String id= rs.getString(1);
			String name=rs.getString(2);
		
			
	%>	
		<input type="checkbox" name="id" value=<%=id %> > <%=name %> <br>
		
	<% 	
		}
	
	%>
	<input type="submit">
</form>


</body>
</html>