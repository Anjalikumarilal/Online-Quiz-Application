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
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteQuizServlet")

public class DeleteQuizServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession();

        String role =
                (String) session.getAttribute("role");

        // Only admin can delete
        if(role == null || !role.equals("admin")) {

            response.getWriter().println(
                "Access Denied"
            );

            return;
        }

        // Get quiz id from URL
        String id = request.getParameter("id");

        try {

            Connection con = DBConnection.getConnection();

            // Delete questions first
            String query1 =
                "DELETE FROM questions WHERE quiz_id=?";

            PreparedStatement ps1 =
                    con.prepareStatement(query1);

            ps1.setString(1, id);

            ps1.executeUpdate();

            // Delete quiz
            String query2 =
                "DELETE FROM quizzes WHERE id=?";

            PreparedStatement ps2 =
                    con.prepareStatement(query2);

            ps2.setString(1, id);

            int i = ps2.executeUpdate();

            if(i > 0) {

                response.sendRedirect("quizList.jsp");

            }

        } catch(Exception e) {

            e.printStackTrace();

        }
    }
}