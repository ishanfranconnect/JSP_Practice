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

<h1>


<!-- <input type="text" name="inp1"/>
<script>
var input1=document.getElementById("inp1");
</script> -->

<form action="" method="post">
<input type="text" name="inp1"/>
<button type="submit">Save</button>
</form>

<%String name=request.getParameter("inp1"); 
if(name!=null){
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopdb","root","root123");
		String query="insert into users values(?)";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1,name);
		ps.executeUpdate();
		out.println("data is to saved");
		con.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
</h1>
</body>
</html>