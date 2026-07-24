package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import dao.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddQuestionServlet")

public class AddQuestionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String quizId = request.getParameter("quiz_id");
        String question = request.getParameter("question");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        String correctAnswer =
                request.getParameter("correct_answer");

        try {

            Connection con = DBConnection.getConnection();

            String query =
                "INSERT INTO questions "
                + "(quiz_id,question,option1,option2,"
                + "option3,option4,correct_answer) "
                + "VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, quizId);
            ps.setString(2, question);
            ps.setString(3, option1);
            ps.setString(4, option2);
            ps.setString(5, option3);
            ps.setString(6, option4);
            ps.setString(7, correctAnswer);

            int i = ps.executeUpdate();

            if(i > 0) {

            	response.sendRedirect("questionSuccess.jsp");
            }

        } catch(Exception e) {

            e.printStackTrace();

        }
    }
}