<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">
Online Quiz Application
</div>

<div class="container">

<h2>User Registration</h2>

<form action="RegisterServlet" method="post">

<input type="text"
name="username"
placeholder="Enter Username"
required>

<input type="email"
name="email"
placeholder="Enter Email"
required>

<input type="password"
name="password"
placeholder="Enter Password"
required>

<input type="submit" value="Register">

</form>

<br>

<a href="login.jsp">Already have an account? Login</a>

</div>

</body>
</html>