<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Employee</title>

    <style>
        body {
            background: #f2f2f2;
            font-family: Arial, sans-serif;
        }
        .container {
            width: 350px;
            background: white;
            margin: 80px auto;
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
            margin-top: 20px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background: #1f7e34;
        }
        table {
            width: 70%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
    </style>

</head>
<body>

<div class="container">
    <h2>View Employee</h2>

    <!-- Submit to same page -->
    <form method="get">
        <label>Enter Employee ID:</label>
        <input type="number" name="id" required>
        <button type="submit">View Employee</button>
    </form>
</div>

<%
String idStr = request.getParameter("id");

if (idStr != null) {

    int id = Integer.parseInt(idStr);

    String url = "jdbc:mysql://localhost:3306/43r";
    String user = "root";
    String password = "123456";

    String query = "SELECT * FROM emp WHERE id=?";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
%>

<h3 style="text-align:center; color:#1f7e34;">Employee Found</h3>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>DOB</th>
        <th>City</th>
        <th>Email</th>
        <th>Salary</th>
    </tr>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
         <td><%= rs.getInt("age") %></td>
          <td><%= rs.getDate("Dob") %></td>
           <td><%= rs.getString("city") %></td>
            <td><%= rs.getString("email") %></td>
             <td><%= rs.getString("salary") %></td>
    </tr>
</table>

<%
        } else {
%>

<h3 style="text-align:center; color:red;">Employee Not Found</h3>

<%
        }

        rs.close();
        ps.close();
        con.close();

    } catch (Exception e) {
        out.println("<h3 style='color:red;text-align:center;'>Error: " + e.getMessage() + "</h3>");
    }
}
%>

</body>
</html>
    