<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.model.Student" %>
<%@ page import="com.dao.HostelDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Students</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: #eee;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background: #1e2a38;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 123, 255, 0.5);
            width: 95%;
            max-width: 1000px;
            overflow-x: auto;
        }

        h2 {
            text-align: center;
            color: #64b5f6; /* lighter blue */
            margin-bottom: 20px;
        }

        p.no-data {
            text-align: center;
            color: #999;
            font-style: italic;
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            background-color: #2a3c53;
            color: #eee;
            box-shadow: inset 0 0 10px #1b2738;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #3b4a66;
            text-align: center;
        }

        th {
            background-color: #007bff; /* bright blue */
            color: white;
            user-select: none;
        }

        tr:hover {
            background-color: #3a4f70;
        }

        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            tr {
                margin-bottom: 15px;
                border: 1px solid #3b4a66;
                border-radius: 8px;
                padding: 10px;
                background-color: #2a3c53;
            }

            td {
                text-align: right;
                padding-left: 50%;
                position: relative;
            }

            td::before {
                content: attr(data-label);
                position: absolute;
                left: 10px;
                width: 45%;
                font-weight: bold;
                text-align: left;
                color: #99bbff;
            }

            th {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Student List</h2>
        <%
            HostelDAO dao = new HostelDAO();
            List<Student> list = dao.getAllStudents();
        %>
        <% if (list.isEmpty()) { %>
            <p class="no-data">No students found.</p>
        <% } else { %>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Room</th>
                        <th>Admission Date</th>
                        <th>Fees Paid</th>
                        <th>Pending</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Student s : list) { %>
                    <tr>
                        <td data-label="ID"><%= s.getStudentID() %></td>
                        <td data-label="Name"><%= s.getStudentName() %></td>
                        <td data-label="Room"><%= s.getRoomNumber() %></td>
                        <td data-label="Admission Date"><%= s.getAdmissionDate() %></td>
                        <td data-label="Fees Paid"><%= s.getFeesPaid() %></td>
                        <td data-label="Pending"><%= s.getPendingFees() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </div>
</body>
</html>
