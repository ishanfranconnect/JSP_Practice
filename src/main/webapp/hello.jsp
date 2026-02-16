<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.red{
background:red;
padding:10px;
}
.green{
background:green;
padding:10px;
}
</style>
</head>
<body>
<form method="post">
  <input type="text" name="inp1"/>
  <button type="submit">Save</button>
</form>

<%String oldName="";
String newName=request.getParameter("inp1");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopdb","root","root123");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select name from users where id=1");
	
	if(rs.next()){
		oldName=rs.getString("name");
	}
	%>
	<div class="red">
	Old Value:<%= oldName %>
	</div>
	
	
	<% 
	if(newName!=null &&!newName.equals(oldName)){
	%>
	<div class="green">
	New Value:<%=newName %>
	</div>
	<%
	PreparedStatement ps=con.prepareStatement("update users set name=? where id=1");
	ps.setString(1,newName);
	ps.executeUpdate();
	}
	con.close();
} catch(Exception e){
	out.println(e);
	/* e.printStackTrace(); */
}
%>
</body>
</html>