<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Employee</title>

    <style>
        body {
            background: #f2f2f2;
            font-family: Arial, sans-serif;
        }
        .container {
            width: 380px;
            background: white;
            margin: 70px auto;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            width: 100%;
            padding: 12px;
            margin-top: 22px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background: #0056b3;
        }
    </style>

</head>
<body>

<div class="container">
    <h2>Update Employee</h2>

    <!-- FIXED : remove action -->
    <form method="post">
        <label>Employee ID:</label>
        <input type="number" name="id" required>

        <label>Employee Name:</label>
        <input type="text" name="empName" placeholder="Enter new name" required>
      
        <button type="submit">Update</button>
    </form>
</div>


<%
String idStr = request.getParameter("id");
String name = request.getParameter("empName");

if (idStr != null && name != null) {

    int id = Integer.parseInt(idStr);

    String url = "jdbc:mysql://localhost:3306/43r";
    String user = "root";
    String password = "123456";

    String query = "update emp set name=? where id=?";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement ps = con.prepareStatement(query);

        ps.setString(1, name);
        ps.setInt(2, id);

        int row = ps.executeUpdate();
%>

<h3 style="color:green;text-align:center;"><%=row%> Employee Updated Successfully</h3>

<%
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    }
}
%>

</body>
</html>

    