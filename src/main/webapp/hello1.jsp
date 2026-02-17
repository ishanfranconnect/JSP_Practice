<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%if(request.getParameter("logout")!=null){
	session.invalidate();         
    response.sendRedirect("login.jsp?msg1=logout");  
    return;
}
%>
<%if(session.getAttribute("user")==null){
	response.sendRedirect("login.jsp");
	return;
}
	%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.container {
	display: flex;
	gap: 20px;
	margin-top: 20px;
}
.box {
	width: 50%;
}
.red {
	background: #ff4d4d;
	padding: 15px;
	color: white;
	font-size: 18px;
}

.lightgreen{
	background:#b9f5c9;
	padding:15px;
	color:#000;
}
.darkgreen{
	background:#013220;
	padding:15px;
	color:#fff;
	margin-top:10px;
	font-weight:bold;
}
.logout{
position:absolute;
 right:20px;
  top:20px;
}
</style>
</head>
<body>

<%
String msg=request.getParameter("msg");
if("success".equals(msg)){
%>
<script>
alert("login successfully");
</script>
<%

}
%>

	<form method="post">
		<input type="text" name="inp1" />
		<button type="submit">Save</button>
		<button type="reset">Clear</button>
	</form>
	
	<form method="post" name="logout">
		<button name="logout">Logout</button>
	</form>
	
	
	<%
	String oldName = "";
	String newName = request.getParameter("inp1");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopdb", "root", "root123");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select name from users where id=1");
		if (rs.next()) {
			oldName = rs.getString("name");
		}
		boolean isChanged=false;
		if(newName!=null &&!newName.trim().equals("") && !newName.equals(oldName)){
			isChanged=true;
			PreparedStatement ps=con.prepareStatement("update users set name=? where id=1");
			ps.setString(1,newName);
			ps.executeUpdate();
		}
	%>
	<div class="container">
		<div class="box">
			<div class="red">
				<%=oldName%>
			</div>
		</div>

		<div class="box">
<%
 if (isChanged) {
%>
    <div class="darkgreen">
        <%=newName%>
    </div>
<%
 }
%>
</div>
		
	</div>
	<%
	con.close();
	} catch (Exception e) {
	out.println(e);
	}
	%>
</body>
</html>