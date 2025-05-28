package com.servlet;

import com.model.Student;
import com.dao.HostelDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Student s = new Student();
            s.setStudentID(Integer.parseInt(request.getParameter("studentID")));
            s.setStudentName(request.getParameter("studentName"));
            s.setRoomNumber(request.getParameter("roomNumber"));
            s.setAdmissionDate(Date.valueOf(request.getParameter("admissionDate")));
            s.setFeesPaid(Double.parseDouble(request.getParameter("feesPaid")));
            s.setPendingFees(Double.parseDouble(request.getParameter("pendingFees")));

            HostelDAO dao = new HostelDAO();
            dao.addStudent(s);

            response.sendRedirect("studentdisplay.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
