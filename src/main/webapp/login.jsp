<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
body{
    height:100vh;
    margin:0;
    display:flex;
    justify-content:center;
    align-items:center;
}

.login{
    border:1px solid black;   
    padding:25px;
    text-align:center;
    width:300px;
}
</style>
</head>

<body>

<div class="login">

<%
 String msg1 = request.getParameter("msg1");
 if("logout".equals(msg1)){
 %>
 <script>
 alert("Logout successfully");
 </script>
  <%
  }
  %>
<h2>Login Page</h2>
 <%
 String msg = request.getParameter("msg");
 if("invalid".equals(msg)){
 %>
 <script>
 alert("Invalid credentials");
 </script>
  <%
  }
  %>

<form method="post" action="loginProcess.jsp">
<input type="email" name="email" placeholder="Enter the email"><br><br>
<input type="password" name="pass" placeholder="Enter the password"><br><br>
<button type="submit">Login</button>
</form>

</div>

</body>
</html>
