package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

public class ReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String reportType = request.getParameter("reportType");
            HostelDAO dao = new HostelDAO();
            List<Student> reportData = null;

            switch (reportType) {
                case "pendingFees":
                    reportData = dao.getStudentsWithPendingFees();
                    break;
                case "room":
                    String room = request.getParameter("room");
                    reportData = dao.getStudentsByRoom(room);
                    break;
                case "dateRange":
                    Date from = Date.valueOf(request.getParameter("from"));
                    Date to = Date.valueOf(request.getParameter("to"));
                    reportData = dao.getStudentsByDateRange(from, to);
                    break;
            }

            request.setAttribute("reportData", reportData);
            RequestDispatcher rd = request.getRequestDispatcher("report_result.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
