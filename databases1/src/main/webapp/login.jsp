<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.Data.database"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Assuming you have a CSS file for styling -->
</head>
<body>
<%
    String url = "jdbc:postgresql://localhost:5432/Hotel%20Management";
    Class.forName("org.postgresql.Driver");
    Connection db = DriverManager.getConnection(url, "postgres", "richa123");
%>
    <!-- Customer Login -->
    <div class="login-container">
        <h2>Customer Login</h2>
        <div class="form-group">
            <label for="customer-id">Customer ID:</label>
            <input type="number" id="customer-id" name="user-id" required>
        </div>
        <button type="button" id="customer-login-btn" onclick="location.href='customer.jsp';">Customer Login</button>
    </div>

    <!-- Employee Login -->
    <div class="login-container">
        <h2>Employee Login</h2>
        <div class="form-group">
            <label for="employee-id">Employee ID:</label>
            <input type="number" id="employee-id" name="user-id" required>
        </div>
        <button type="button" id="employee-login-btn" onclick="location.href='employee.jsp';">Employee Login</button>
    </div>

    <!-- Manager Login -->
    <div class="login-container">
        <h2>Manager Login</h2>
        <div class="form-group">
            <label for="manager-id">Manager ID:</label>
            <input type="number" id="manager-id" name="user-id" required>
        </div>
        <button type="button" id="manager-login-btn" onclick="location.href='manager.jsp';">Manager Login</button>
    </div>
</body>
</html>
