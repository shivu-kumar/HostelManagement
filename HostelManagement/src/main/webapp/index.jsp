<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hostel Management</title>
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
            padding: 50px 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(33, 150, 243, 0.7);
            width: 90%;
            max-width: 480px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .container:hover {
            transform: translateY(-8px);
            box-shadow: 0 0 30px rgba(33, 150, 243, 1);
        }

        h2 {
            font-size: 32px;
            margin-bottom: 35px;
            color: #2196f3;
            letter-spacing: 1.2px;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        li {
            margin: 18px 0;
        }

        a {
            display: block;
            padding: 14px 24px;
            background: #2196f3;
            color: #fff;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 600;
            font-size: 16px;
            box-shadow: 0 4px 15px rgba(33, 150, 243, 0.5);
            transition: background 0.3s ease, box-shadow 0.3s ease, transform 0.2s ease;
        }

        a:hover {
            background: #1976d2;
            box-shadow: 0 6px 20px rgba(25, 118, 210, 0.8);
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>🏨 Hostel Management System</h2>
        <ul>
            <li><a href="studentadd.jsp">➕ Add Student</a></li>
            <li><a href="studentupdate.jsp">✏️ Update Student</a></li>
            <li><a href="studentdelete.jsp">🗑️ Delete Student</a></li>
            <li><a href="studentdisplay.jsp">📋 Display Students</a></li>
            <li><a href="report_form.jsp">📊 Generate Reports</a></li>
        </ul>
    </div>
</body>
</html>
