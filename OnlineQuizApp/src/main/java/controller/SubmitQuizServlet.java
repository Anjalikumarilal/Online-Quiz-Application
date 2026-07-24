package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SubmitQuizServlet")

public class SubmitQuizServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int score = 0;

        String quizId = request.getParameter("quizId");

        try {

            Connection con = DBConnection.getConnection();

            // Get all question IDs
            String[] questionIds =
                    request.getParameterValues("questionIds");

            // Loop through all questions
            for(String qid : questionIds) {

                // User selected answer
                String userAnswer =
                        request.getParameter("q" + qid);

                // Fetch correct answer from database
                String query =
                    "SELECT correct_answer FROM questions WHERE id=?";

                PreparedStatement ps =
                        con.prepareStatement(query);

                ps.setString(1, qid);

                ResultSet rs = ps.executeQuery();

                if(rs.next()) {

                    String correctAnswer =
                            rs.getString("correct_answer");

                    // Compare answers
                    if(userAnswer != null &&
                        correctAnswer.trim()
                        .equalsIgnoreCase(userAnswer.trim())) {

                        score++;

                    }
                }
            }

            // Get logged in username from session
            HttpSession session =
                    request.getSession();

            String username =
                    (String) session.getAttribute("username");

            // Save result in database
            String insert =
                "INSERT INTO results(username, quiz_id, score) "
                + "VALUES(?,?,?)";

            PreparedStatement ps2 =
                    con.prepareStatement(insert);

            ps2.setString(1, username);
            ps2.setString(2, quizId);
            ps2.setInt(3, score);

            ps2.executeUpdate();

            // Display score
            response.setContentType("text/html");

            response.getWriter().println(
                "<h1>Your Score is: " + score + "</h1>"
            );

            response.getWriter().println(
                "<a href='home.jsp'>Go Home</a>"
            );

        } catch(Exception e) {

            e.printStackTrace();

        }
    }
}