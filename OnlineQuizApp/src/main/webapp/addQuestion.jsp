<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add Question</title>

<link rel="stylesheet" href="css/style.css">

</head>

<body>

<div class="navbar">

Online Quiz Application

</div>

<div class="container">

<h2>Add Question</h2>

<form action="AddQuestionServlet" method="post">

<input type="text"
name="quiz_id"
placeholder="Enter Quiz ID"
required>

<input type="text"
name="question"
placeholder="Enter Question"
required>

<input type="text"
name="option1"
placeholder="Option 1"
required>

<input type="text"
name="option2"
placeholder="Option 2"
required>

<input type="text"
name="option3"
placeholder="Option 3"
required>

<input type="text"
name="option4"
placeholder="Option 4"
required>

<input type="text"
name="correct_answer"
placeholder="Correct Answer"
required>

<input type="submit" value="Add Question">

</form>

</div>

</body>

</html>