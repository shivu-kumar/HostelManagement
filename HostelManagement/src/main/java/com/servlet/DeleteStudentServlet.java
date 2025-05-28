package com.servlet;

import com.dao.HostelDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("studentID"));
            HostelDAO dao = new HostelDAO();
            dao.deleteStudent(id);
            response.sendRedirect("studentdisplay.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
