<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Saved Data</title>
</head>
<body>
    <h2>รายการเมนูกาแฟ</h2>
    <%
        String url = "jdbc:mysql://localhost:3306/coffeJava";
        String user = "root";
        String password = "dssi@ubu";
        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);

            // Handle form submission to add or update data
            String name = request.getParameter("name");
            String sweetness = request.getParameter("sweetness");
            String price = request.getParameter("price");
            String idParam = request.getParameter("id");
            boolean isPremium = request.getParameter("is_premium") != null;

            if (name != null && sweetness != null && price != null) {
                if (idParam != null && !idParam.isEmpty()) {
                    // Update existing record
                    int id = Integer.parseInt(idParam);
                    String updateQuery = "UPDATE coffee_table SET name = ?, sweetness_level = ?, price = ?, is_premium = ? WHERE id = ?";
                    PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
                    updateStatement.setString(1, name);
                    updateStatement.setInt(2, Integer.parseInt(sweetness));
                    updateStatement.setDouble(3, Double.parseDouble(price));
                    updateStatement.setBoolean(4, isPremium);
                    updateStatement.setInt(5, id);
                    updateStatement.executeUpdate();
                } else {
                    // Add new record
                    String insertQuery = "INSERT INTO coffee_table (name, sweetness_level, price, is_premium) VALUES (?, ?, ?, ?)";
                    PreparedStatement insertStatement = connection.prepareStatement(insertQuery);
                    insertStatement.setString(1, name);
                    insertStatement.setInt(2, Integer.parseInt(sweetness));
                    insertStatement.setDouble(3, Double.parseDouble(price));
                    insertStatement.setBoolean(4, isPremium);
                    insertStatement.executeUpdate();
                }
            }

            // Retrieve data from database
            String query = "SELECT * FROM coffee_table";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            // Display data
            out.println("<table border='1'>");
            out.println("<tr><th>ID</th><th>Name</th><th>Sweetness Level</th><th>Price</th><th>Is Premium</th><th>Actions</th></tr>");
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                out.println("<tr>");
                out.println("<td>" + id + "</td>");
                out.println("<td>" + resultSet.getString("name") + "</td>");
                out.println("<td>" + resultSet.getInt("sweetness_level") + "</td>");
                out.println("<td>" + resultSet.getDouble("price") + "</td>");
                out.println("<td>" + (resultSet.getBoolean("is_premium") ? "Yes" : "No") + "</td>");
                out.println("<td>");
                out.println("<a href='editForm.jsp?id=" + id + "'>Edit</a> ");
                out.println("<a href='delete.jsp?id=" + id + "'>Delete</a>");
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</table>");

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
    <p>
        <a href="form.jsp">Go Back to Form</a></p>
    <p>
        <a href="index.html">Go Back to Index</a>
    </p>
</body>
</html>
