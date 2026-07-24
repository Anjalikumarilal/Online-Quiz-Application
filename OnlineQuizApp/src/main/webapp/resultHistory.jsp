<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<%

if(session.getAttribute("username") == null) {

    response.sendRedirect("login.jsp");

}

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Result History</title>

<link rel="stylesheet" href="css/style.css">

</head>

<body>

<div class="navbar">

Online Quiz Application

</div>

<div class="container">

<h2>Your Quiz Results</h2>

<table>

<tr>

<th>Quiz Title</th>
<th>Score</th>

</tr>

<%

try {

    Connection con = DBConnection.getConnection();

    String username =
        (String) session.getAttribute("username");

    String query =
        "SELECT quizzes.title, results.score "
        + "FROM results "
        + "JOIN quizzes "
        + "ON results.quiz_id = quizzes.id "
        + "WHERE results.username=?";

    PreparedStatement ps =
            con.prepareStatement(query);

    ps.setString(1, username);

    ResultSet rs = ps.executeQuery();

    while(rs.next()) {

%>

<tr>

<td>

<%= rs.getString("title") %>

</td>

<td>

<%= rs.getInt("score") %>

</td>

</tr>

<%

    }

} catch(Exception e) {

    e.printStackTrace();

}

%>

</table>

<br>

<a href="home.jsp">

Back to Home

</a>

</div>

</body>

</html>