<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Coffee Shop Input Form</title>
</head>
<body>
    <h2>Coffee Shop Input Form</h2>
    <form action="saveData.jsp" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br><br>
        <label for="sweetness">Sweetness Level (1-5):</label>
        <select id="sweetness" name="sweetness" required>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select>
        <br><br>
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" step="0.01" required>
        <br><br>
        <label for="is_premium">Is Premium:</label>
        <input type="checkbox" id="is_premium" name="is_premium">
        <br><br>
        <input type="submit" value="Add">
    </form>
    <br>
    <a href="index.html">Go Back to Index</a>
</body>
</html>
