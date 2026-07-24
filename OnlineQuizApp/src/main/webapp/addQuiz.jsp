<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Quiz</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">
Online Quiz Application
</div>

<div class="container">

<h2>Add Quiz</h2>

<form action="AddQuizServlet" method="post">

<input type="text"
name="title"
placeholder="Enter Quiz Title"
required>

<input type="submit" value="Add Quiz">

</form>

</div>

</body>
</html>