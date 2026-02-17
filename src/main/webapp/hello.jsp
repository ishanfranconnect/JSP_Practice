<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container{
    display:flex;
    gap:20px;
    margin-top:20px;
}

.box{
    width:50%;
}

.red{
    background:#ff4d4d;
    padding:15px;
    color:white;
    font-size:18px;
}

.green{
    background:#2ecc71;
    padding:15px;
    color:white;
    font-size:18px;
}
.new{
 background: #013220;
}
</style>
</head>
<body>
<form method="post">
  <input type="text" name="inp1"/>
  <button type="submit">Save</button>
  <button type="reset">Clear</button>
</form>
<div class=box>
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
	<%= oldName %>
	</div>
	
	<% 
	if(newName!=null && !newName.equals("") &&!newName.equals(oldName)){
	%>
	</div>
	<div class=box>
	<div class="green">
	<%=oldName %>
	<br><br>
	<div class="new">
	 	<%=newName %>
	</div>
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
</div>
</div>
</body>

</html>