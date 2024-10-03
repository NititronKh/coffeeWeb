<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Coffee</title>
</head>
<body>
    <h2>แก้ไขรายการ</h2>
    <%
        String url = "jdbc:mysql://localhost:3306/coffeJava";
        String user = "root";
        String password = "dssi@ubu";
        Connection connection = null;
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);

            // Retrieve coffee data for editing
            String query = "SELECT * FROM coffee_table WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Create form for editing coffee details
                out.println("<form action='saveData.jsp' method='post'>");
                out.println("<input type='hidden' name='id' value='" + id + "'>");
                out.println("<label>Name:</label>");
                out.println("<input type='text' name='name' value='" + resultSet.getString("name") + "' required>");
                out.println("<br>");
                out.println("<label>Sweetness Level:</label>");
                out.println("<input type='number' name='sweetness' value='" + resultSet.getInt("sweetness_level") + "' min='1' max='5' required>");
                out.println("<br>");
                out.println("<label>Price:</label>");
                out.println("<input type='number' name='price' value='" + resultSet.getDouble("price") + "' step='0.01' required>");
                out.println("<br>");
                out.println("<label>Is Premium:</label>");
                out.println("<input type='checkbox' name='is_premium' " + (resultSet.getBoolean("is_premium") ? "checked" : "") + ">");
                out.println("<br>");
                out.println("<input type='submit' value='Save Changes'>");
                out.println("</form>");
            } else {
                out.println("<p>No data found for the given ID.</p>");
            }

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
    <br>
    <a href="saveData.jsp">Go Back to Data</a>
</body>
</html>
