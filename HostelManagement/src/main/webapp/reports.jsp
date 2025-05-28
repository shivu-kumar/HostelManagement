<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    String type = request.getParameter("type");
    List<String> studentRecords = new ArrayList<>();

    // Mock data check (replace this with your real database logic)
    if ("pendingFees".equals(type)) {
        // studentRecords = getPendingFeesStudentsFromDB();
    } else if ("room".equals(type)) {
        // studentRecords = getStudentsInRoomFromDB();
    } else if ("dateRange".equals(type)) {
        // studentRecords = getStudentsByDateRangeFromDB();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Hostel Report Results</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: #eee;
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: #1e2a38;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(33, 150, 243, 0.7);
            max-width: 600px;
            width: 100%;
            text-align: center;
        }

        h2 {
            color: #2196f3;
            margin-bottom: 20px;
        }

        p.message {
            font-size: 18px;
            color: #ccc;
            margin-bottom: 30px;
        }

        ul.student-list {
            list-style: none;
            padding: 0;
            margin: 0 0 20px;
        }

        ul.student-list li {
            padding: 10px;
            border-bottom: 1px solid #374a60;
            text-align: left;
        }

        .report-links {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 20px;
        }

        .report-links a, .back-link {
            font-size: 16px;
            color: #90caf9;
            text-decoration: none;
            background-color: #2a3c53;
            padding: 10px 15px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .report-links a:hover, .back-link:hover {
            background-color: #34516e;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Report Results</h2>

        <% if (type == null) { %>
            <p class="message">Please select a report type:</p>
            <div class="report-links">
                <a href="report_form.jsp?type=pendingFees">🔍 Students with Pending Fees</a>
                <a href="report_form.jsp?type=room">🏠 Students in a Particular Room</a>
                <a href="report_form.jsp?type=dateRange">📅 Students Admitted in a Date Range</a>
            </div>
        <% } else if (studentRecords.isEmpty()) { %>
            <p class="message">No student records found for this report.</p>
            <div class="report-links">
                <a href="report_form.jsp">← Back to Reports</a>
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
