<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">
Online Quiz Application
</div>

<div class="container">

<h2>Welcome <%= session.getAttribute("username") %></h2>

<br>

<form action="quizList.jsp">
<button type="submit">Take Quiz</button>
</form>

<br>

<form action="resultHistory.jsp">
<button type="submit">View Results</button>
</form>

<br>
<%

String role =
    (String) session.getAttribute("role");

if(role != null && role.equals("admin")) {

%>

<h2>Admin Section</h2>

<form action="addQuiz.jsp">
<button type="submit">
Add Quiz
</button>
</form>

<br>

<form action="addQuestion.jsp">
<button type="submit">
Add Questions
</button>
</form>

<br>

<%

}

%>

<form action="LogoutServlet">
<button type="submit">Logout</button>
</form>

</div>

</body>
</html>