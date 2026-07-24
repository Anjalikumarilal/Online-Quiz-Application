<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">

<meta charset="UTF-8">

<title>Take Quiz</title>

<style>

.question-box {

    display: none;

    margin-bottom: 20px;

}

.question-box.active {

    display: block;

}

</style>

</head>

<body>

<h2>Quiz Questions</h2>

<form action="SubmitQuizServlet" method="post">

<%

String quizId = request.getParameter("id");

int index = 0;

try {

    Connection con = DBConnection.getConnection();

    String query =
        "SELECT * FROM questions WHERE quiz_id=?";

    PreparedStatement ps =
            con.prepareStatement(query);

    ps.setString(1, quizId);

    ResultSet rs = ps.executeQuery();

    while(rs.next()) {

%>

<div class="question-box <%= (index == 0) ? "active" : "" %>">

<!-- IMPORTANT HIDDEN FIELD -->

<input type="hidden"
name="questionIds"
value="<%= rs.getInt("id") %>">

<h3>

Question <%= index + 1 %>

</h3>

<p>

<%= rs.getString("question") %>

</p>

<input type="radio"
name="q<%= rs.getInt("id") %>"
value="<%= rs.getString("option1") %>">

<%= rs.getString("option1") %>

<br><br>

<input type="radio"
name="q<%= rs.getInt("id") %>"
value="<%= rs.getString("option2") %>">

<%= rs.getString("option2") %>

<br><br>

<input type="radio"
name="q<%= rs.getInt("id") %>"
value="<%= rs.getString("option3") %>">

<%= rs.getString("option3") %>

<br><br>

<input type="radio"
name="q<%= rs.getInt("id") %>"
value="<%= rs.getString("option4") %>">

<%= rs.getString("option4") %>

<br><br>

<%

if(rs.isLast()) {

%>

<button type="submit">

Submit Quiz

</button>

<%

} else {

%>

<button type="button"
onclick="nextQuestion()">

Next

</button>

<%

}

%>

</div>

<%

index++;

    }

} catch(Exception e) {

    e.printStackTrace();

}

%>

<input type="hidden"
name="quizId"
value="<%= quizId %>">

</form>

<script>

let currentQuestion = 0;

const questions =
    document.querySelectorAll(".question-box");

function nextQuestion() {

    questions[currentQuestion]
        .classList.remove("active");

    currentQuestion++;

    questions[currentQuestion]
        .classList.add("active");
}

</script>

</body>
</html>