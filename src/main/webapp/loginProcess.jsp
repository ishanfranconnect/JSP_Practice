<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String email=request.getParameter("email");
String pass=request.getParameter("pass");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopdb","root","root123");
PreparedStatement ps=con.prepareStatement("select * from login_users where email=? and password=?");
ps.setString(1,email);
ps.setString(2,pass);
ResultSet rs=ps.executeQuery();
if(rs.next()){
	session.setAttribute("user",email);
	response.sendRedirect("hello1.jsp?msg=success");
	
}else{
	response.sendRedirect("login.jsp?msg=invalid");
}

%>
</body>
</html>