<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="webapp.src.data.database"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Assuming you have a CSS file for styling -->
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="/login" method="post"> <!-- Update action with your login handling endpoint -->
            <div class="form-group">
                <label for="user-id">ID:</label>
                <input type="number" id="user-id" name="user-id" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" id="login-btn">Log In</button>
        </form>
        <div class="alternative-action">
            <span>Don't have an account?</span>
            <button id="signup-btn" onclick="location.href='signup.jsp';">Sign Up</button> <!-- Update with your signup page link -->
        </div>
    </div>
</body>
</html>
