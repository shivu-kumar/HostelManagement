package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/report")
public class ReportCriteriaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HostelDAO hostelDAO;

    @Override
    public void init() throws ServletException {
        hostelDAO = new HostelDAO(); // assuming HostelDAO has default constructor
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String hostelName = request.getParameter("hostelName");
        String roomNumber = request.getParameter("roomNumber");

        try {
            List<Student> students = hostelDAO.getStudentsByCriteria(hostelName, roomNumber);
            request.setAttribute("students", students);
            request.getRequestDispatcher("studentReport.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            // Optionally set an error message and forward to an error page
            request.setAttribute("errorMessage", "Database error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
