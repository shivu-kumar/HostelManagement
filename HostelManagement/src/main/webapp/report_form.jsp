<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.Date, com.dao.HostelDAO, com.model.Student" %>
<%
    String type = request.getParameter("type");
    String submit = request.getParameter("submit");
    List<String> studentRecords = new ArrayList<>();
    HostelDAO dao = new HostelDAO();

    if ("pendingFees".equals(type)) {
        try {
            List<Student> students = dao.getStudentsWithPendingFees();
            for (Student s : students) {
                String record = "ID: " + s.getStudentID()
                              + ", Name: " + s.getStudentName()
                              + ", Room: " + s.getRoomNumber()
                              + ", Pending Fees: ₹ " + s.getPendingFees();
                studentRecords.add(record);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else if ("room".equals(type) && "yes".equals(submit)) {
        String roomNumber = request.getParameter("roomNumber");
        try {
            List<Student> students = dao.getStudentsByRoom(roomNumber);
            for (Student s : students) {
                String record = "ID: " + s.getStudentID()
                              + ", Name: " + s.getStudentName()
                              + ", Room: " + s.getRoomNumber()
                              + ", Pending Fees: ₹ " + s.getPendingFees();
                studentRecords.add(record);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else if ("dateRange".equals(type) && "yes".equals(submit)) {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        try {
            Date from = Date.valueOf(startDate);
            Date to = Date.valueOf(endDate);
            List<Student> students = dao.getStudentsByDateRange(from, to);
            for (Student s : students) {
                String record = "ID: " + s.getStudentID()
                              + ", Name: " + s.getStudentName()
                              + ", Room: " + s.getRoomNumber()
                              + ", Admission Date: " + s.getAdmissionDate()
                              + ", Pending Fees: ₹ " + s.getPendingFees();
                studentRecords.add(record);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Hostel Report Results</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #eee;
        }

        .container {
            background: #1e2a38;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(33, 150, 243, 0.7);
            width: 90%;
            max-width: 600px;
            text-align: center;
        }

        h2 {
            font-size: 28px;
            color: #2196f3;
            margin-bottom: 25px;
        }

        p.message {
            font-size: 18px;
            color: #ccc;
            margin-bottom: 20px;
        }

        ul.student-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        ul.student-list li {
            padding: 10px 0;
            border-bottom: 1px solid #444;
        }

        form input, form button {
            padding: 10px;
            margin: 10px 0;
            width: 80%;
            border: 1px solid #555;
            border-radius: 8px;
            background-color: #2e3c4f;
            color: #eee;
        }

        form button {
            background: #2196f3;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        form button:hover {
            background: #1976d2;
        }

        a {
            color: #90caf9;
            text-decoration: none;
            font-size: 16px;
        }

        a:hover {
            text-decoration: underline;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            font-size: 16px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Report Results</h2>

    <% if (type == null) { %>
        <p class="message">Please select a report type:</p>
        <div>
            <a href="report_form.jsp?type=pendingFees">🔍 Students with Pending Fees</a><br><br>
            <a href="report_form.jsp?type=room">🏠 Students in a Particular Room</a><br><br>
            <a href="report_form.jsp?type=dateRange">📅 Students Admitted in a Date Range</a><br>
            <a href="index.jsp" class="back-link">← Back to Home</a><br>
        </div>
    <% } else if ("room".equals(type) && submit == null) { %>
        <form method="get">
            <input type="hidden" name="type" value="room">
            <input type="hidden" name="submit" value="yes">
            <input type="text" name="roomNumber" placeholder="Enter Room Number" required>
            <button type="submit">Get Report</button>
        </form>
        <div style="margin-top: 20px;">
    <a href="index.jsp" class="back-link">← Back to Home</a><br>
    <a href="report_form.jsp" class="back-link">← Back to Reports</a>
</div>
    <% } else if ("dateRange".equals(type) && submit == null) { %>
        <form method="get">
            <input type="hidden" name="type" value="dateRange">
            <input type="hidden" name="submit" value="yes">
            <input type="date" name="startDate" required>
            <input type="date" name="endDate" required>
            <button type="submit">Get Report</button>
        </form>
        <div style="margin-top: 20px;">
    <a href="index.jsp" class="back-link">← Back to Home</a><br>
    <a href="report_form.jsp" class="back-link">← Back to Reports</a>
</div>
    <% } else if (studentRecords.isEmpty()) { %>
        <p class="message">No student records found for this report.</p>
        <div style="margin-top: 20px;">
    <a href="index.jsp" class="back-link">← Back to Home</a><br>
    <a href="report_form.jsp" class="back-link">← Back to Reports</a>
</div>
    <% } else { %>
        <ul class="student-list">
            <% for (String student : studentRecords) { %>
                <li><%= student %></li>
            <% } %>
        </ul>
        <div style="margin-top: 20px;">
    <a href="index.jsp" class="back-link">← Back to Home</a><br>
    <a href="report_form.jsp" class="back-link">← Back to Reports</a>
</div>

    <% } %>
</div>
</body>
</html>
