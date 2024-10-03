<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Data</title>
</head>
<body>
    <%
        String url = "jdbc:mysql://localhost:3306/coffeJava";
        String user = "root";
        String password = "dssi@ubu";
        Connection connection = null;
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);

            // Delete coffee data
            String query = "DELETE FROM coffee_table WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.executeUpdate();

            response.sendRedirect("saveData.jsp");

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    out.println("Error closing connection: " + e.getMessage());
                }
            }
        }
    %>
</body>
</html>
