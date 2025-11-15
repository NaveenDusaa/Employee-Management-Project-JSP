<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 350px;
            margin: 80px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
        }

        h1 {
            font-size: 22px;
            margin-bottom: 20px;
        }

        a {
            display: block;
            text-decoration: none;
            margin: 10px 0;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border-radius: 6px;
            font-size: 16px;
            transition: 0.2s;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

<div class="container">
    <h1>Employee Management</h1>

  
    
    <a href="register.jsp"><button>Employee Registration</button></a>
    <a href="update.jsp"><button>Update Employee</button></a>
    <a href="delete.jsp"><button>Delete Employee by ID</button></a>
    <a href="view.jsp"><button>View Employee by ID</button></a>
    <a href="display.jsp">Display All Employees</a>
    
</div>

</body>
</html>
