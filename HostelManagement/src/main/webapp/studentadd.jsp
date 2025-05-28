<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: #eee;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: #1e2a38;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(33, 150, 243, 0.7);
            width: 100%;
            max-width: 450px;
        }

        h2 {
            text-align: center;
            color: #90caf9;
            margin-bottom: 25px;
        }

        form label {
            display: block;
            margin-bottom: 6px;
            color: #ccc;
        }

        form input[type="text"],
        form input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #444;
            border-radius: 6px;
            background-color: #2a3c53;
            color: #eee;
        }

        form input[type="submit"] {
            width: 100%;
            background-color: #2196f3;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
        }

        form input[type="submit"]:hover {
            background-color: #1976d2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Student</h2>
        <form action="AddStudentServlet" method="post">
            <label for="studentID">ID:</label>
            <input type="text" name="studentID" id="studentID" required />

            <label for="studentName">Name:</label>
            <input type="text" name="studentName" id="studentName" required />

            <label for="roomNumber">Room:</label>
            <input type="text" name="roomNumber" id="roomNumber" required />

            <label for="admissionDate">Admission Date:</label>
            <input type="date" name="admissionDate" id="admissionDate" required />

            <label for="feesPaid">Fees Paid:</label>
            <input type="text" name="feesPaid" id="feesPaid" required />

            <label for="pendingFees">Pending Fees:</label>
            <input type="text" name="pendingFees" id="pendingFees" required />

            <input type="submit" value="Add" />
        </form>
    </div>
</body>
</html>
