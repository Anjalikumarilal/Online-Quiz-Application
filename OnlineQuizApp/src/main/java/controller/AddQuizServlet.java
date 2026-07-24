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

@WebServlet("/AddQuizServlet")

public class AddQuizServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");

        try {

            Connection con = DBConnection.getConnection();

            String query =
                "INSERT INTO quizzes(title) VALUES(?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, title);

            int i = ps.executeUpdate();

            if(i > 0) {

                response.sendRedirect("addQuestion.jsp");

            } else {

                response.getWriter().println("Failed");

            }

        } catch(Exception e) {

            e.printStackTrace();

        }
    }
}