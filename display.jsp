<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Employees</title>
</head>
<body>

<%
String url = "jdbc:mysql://localhost:3306/43r";
String user = "root";
String password = "123456";

String query = "SELECT * FROM emp";

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, user, password);

    PreparedStatement ps = con.prepareStatement(query);
    ResultSet rs = ps.executeQuery();

    if (!rs.next()) {
        // NO DATA FOUND
        out.println("<h3 style='text-align:center; color:red;'>Employee Not Found</h3>");
    } else {
        // DATA FOUND
%>

<h3 style="text-align:center; color:#1f7e34;">Employee Details</h3>

<table border="1" cellpadding="8" cellspacing="0" align="center">
    <tr style="background:#d5d5d5;">
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>DOB</th>
        <th>City</th>
        <th>Email</th>
        <th>Salary</th>
    </tr>

<%
        // Print first row and then loop for others
        do {
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getInt("age") %></td>
        <td><%= rs.getDate("Dob") %></td>
        <td><%= rs.getString("city") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("salary") %></td>
    </tr>
<%
        } while (rs.next());
%>

</table>

<%
    }

    rs.close();
    ps.close();
    con.close();

} catch (Exception e) {
    out.println("<h3 style='color:red;text-align:center;'>Error: " + e.getMessage() + "</h3>");
}
%>

</body>
</html>
