<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>

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
	
	String userid=(String)session.getAttribute("userid");
	System.out.println(userid);
	Class.forName(driver);
	Connection con=DriverManager.getConnection(url,user,password);
	PreparedStatement psmt=con.prepareStatement("select password,address,mobile,email from users where userid=?");
	psmt.setString(1,userid);
	ResultSet rs=psmt.executeQuery();
	while(rs.next())
	{
		
	
%>

	<form action="UpdateProfileData">
		Password  <input type="text" name="password" value=<%=rs.getString(1)%>><br>
		Address	  <input type="text" name="address" value=<%=rs.getString(2) %>><br>
		Mobile	  <input type="text" name="mobile"  value=<%=rs.getString(3) %>><br>
		Email 	  <input type="text" name="email"  value=<%=rs.getString(4) %>>
	
	<%} %>	
		<input type="submit">
 	
	</form>

</body>
</html>