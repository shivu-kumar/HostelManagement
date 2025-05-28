<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    String type = request.getParameter("type");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Generate Report</title>
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

        .form-container {
            background: #1e2a38;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(33, 150, 243, 0.7);
            width: 90%;
            max-width: 500px;
            text-align: center;
        }

        h2 {
            color: #2196f3;
            margin-bottom: 25px;
        }

        label {
            display: block;
            text-align: left;
            margin: 10px 0 5px;
            color: #ccc;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #555;
            border-radius: 8px;
            background-color: #2e3c4f;
            color: #eee;
        }

        button {
            background-color: #2196f3;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        button:hover {
            background-color: #1976d2;
        }

        p {
            color: #ccc;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #90caf9;
            text-decoration: none;
            font-size: 16px;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Fill Report Criteria</h2>

        <form action="ReportController" method="post">
            <input type="hidden" name="type" value="<%=type%>"/>

            <% if ("room".equals(type)) { %>
                <label>Enter Room Number:</label>
                <input type="text" name="roomNumber" required/>
            <% } else if ("dateRange".equals(type)) { %>
                <label>Start Date:</label>
                <input type="date" name="startDate" required/>

                <label>End Date:</label>
                <input type="date" name="endDate" required/>
            <% } else if ("pendingFees".equals(type)) { %>
                <p>No additional input needed. Click below to generate the report.</p>
            <% } else { %>
                <p>Invalid report type. <a href="reports.jsp" class="back-link">Back</a></p>
            <% } %>

            <% if ("room".equals(type) || "dateRange".equals(type) || "pendingFees".equals(type)) { %>
                <button type="submit">Generate Report</button>
            <% } %>
        </form>

        <div style="margin-top: 20px;">
    <a href="index.jsp" class="back-link">← Back to Home</a><br>
    <a href="report_form.jsp" class="back-link">← Back to Reports</a>
</div>

    </div>
</body>
</html>
