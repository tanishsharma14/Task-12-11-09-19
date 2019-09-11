<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"%>   

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
	
	Class.forName(driver);
	Connection con=DriverManager.getConnection(url,user,password);
	PreparedStatement psmt=con.prepareStatement("SELECT DISTINCT book_subject from book");
	ResultSet rs=psmt.executeQuery();
			
	

%>
	
	<h2> Choose subject
	</h2>	
<form action="booklistchk.jsp">
	<select name="subject">
	<%
		while(rs.next())
		{
	%>
		<option><%=rs.getString(1) %></option>
	
	<%
	}
	%>	
	</select>
	<input type="submit">
</form>



</body>
</html>