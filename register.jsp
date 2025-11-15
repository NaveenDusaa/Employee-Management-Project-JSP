<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Registration</title>

<style>
    body {
        font-family: Arial;
        background: #eef2f3;
    }
    .container {
        width: 400px;
        margin: 50px auto;
        background: white;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
    }
    input {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
    }
    button {
        width: 100%;
        padding: 12px;
        background: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
    }
</style>
</head>
<body>

<div class="container">
<h2>Employee Registration</h2>

<form method="post">
    
    <label>Employee ID</label>
    <input type="number" name="id" required>

    <label>Employee Name</label>
    <input type="text" name="empName" required>

    <label>Employee Age</label>
    <input type="number" name="empAge" required>

    <label>Date of Birth</label>
    <input type="date" name="empDob" required>

    <label>City</label>
    <input type="text" name="empCity" required>

    <label>Email</label>
    <input type="email" name="empEmail" required>

    <label>Salary</label>
    <input type="number" name="empSalary" required>

    <button type="submit">Register Employee</button>
</form>

<%
if (request.getParameter("id") != null) {

    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("empName");
    int age = Integer.parseInt(request.getParameter("empAge"));
    String dob = request.getParameter("empDob");
    String city = request.getParameter("empCity");
    String email = request.getParameter("empEmail");
    int salary = Integer.parseInt(request.getParameter("empSalary"));

    java.sql.Date sqlDob = java.sql.Date.valueOf(dob);

    String url = "jdbc:mysql://localhost:3306/43r";
    String user = "root";
    String password = "123456";

    String query = "INSERT INTO emp (id, name, age, dob, city, email, salary) VALUES (?, ?, ?, ?, ?, ?, ?)";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement ps = con.prepareStatement(query);

        ps.setInt(1, id);
        ps.setString(2, name);
        ps.setInt(3, age);
        ps.setDate(4, sqlDob);
        ps.setString(5, city);
        ps.setString(6, email);
        ps.setInt(7, salary);

        int row = ps.executeUpdate();
%>

 <h3 style="color:green;"><%=row%>Employee Registered Successfully</h3>

<%
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    }
}
%>

</div>

</body>
</html>

    