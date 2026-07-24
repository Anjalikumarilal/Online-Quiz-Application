<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz List</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">
Online Quiz Application
</div>

<div class="container">

<h2>Available Quizzes</h2>

<%

try {

    Connection con = DBConnection.getConnection();

    String query = "SELECT * FROM quizzes";

    PreparedStatement ps = con.prepareStatement(query);

    ResultSet rs = ps.executeQuery();

    while(rs.next()) {

%>

<div style="margin-bottom:20px;">

<a href="takeQuiz.jsp?id=<%= rs.getInt("id") %>">

<%= rs.getString("title") %>

</a>

&nbsp;&nbsp;&nbsp;

<%

String role =
    (String) session.getAttribute("role");

if(role != null && role.equals("admin")) {

%>

<a href="DeleteQuizServlet?id=<%= rs.getInt("id") %>"
onclick="return confirm('Are you sure?')">

<%

}

%>

Delete

</a>

</div>

<%

    }

} catch(Exception e) {

    e.printStackTrace();

}

%>

</div>

</body>
</html>