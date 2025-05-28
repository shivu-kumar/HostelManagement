<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Student</title>
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
            box-shadow: 0 0 20px rgba(40, 167, 69, 0.5); /* green shadow */
            width: 100%;
            max-width: 450px;
        }

        h2 {
            text-align: center;
            color: #28a745; /* bright green */
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #ccc;
            font-weight: bold;
        }

        form input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #444;
            border-radius: 6px;
            background-color: #2a3c53;
            color: #eee;
            box-sizing: border-box;
        }

        form input[type="submit"] {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        form input[type="submit"]:hover {
            background-color: #218838;
        }

        .note {
            font-size: 13px;
            color: #999;
            margin-top: -12px;
            margin-bottom: 16px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Student</h2>
        <form action="UpdateStudentServlet" method="post">
            <label for="studentID">Student ID (required)</label>
            <input type="text" name="studentID" id="studentID" required />

            <label for="studentName">New Name</label>
            <input type="text" name="studentName" id="studentName" />
            <div class="note">Leave blank to keep current name</div>

            <label for="roomNumber">New Room</label>
            <input type="text" name="roomNumber" id="roomNumber" />
            <div class="note">Leave blank to keep current room</div>

            <label for="feesPaid">New Fees Paid</label>
            <input type="text" name="feesPaid" id="feesPaid" />

            <label for="pendingFees">New Pending Fees</label>
            <input type="text" name="pendingFees" id="pendingFees" />

            <input type="submit" value="Update" />
        </form>
    </div>
</body>
</html>
