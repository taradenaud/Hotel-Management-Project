<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="webapp.src.data.database"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.print.DocFlavor" %>
<%@ page import= "java.text.DateFormat"%>
<%@ page import= "java.util.Calendar"%>
<%@ page import="javax.swing.plaf.nimbus.State" %>

<!DOCTYPE html>
<html>
<head>
    <title>Sign Up Page</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Linking the same CSS file -->
</head>
<body>
<%
    String url = "jdbc:postgresql://localhost:5432/Hotel+Management";
    Class.forName("org.postgresql.Driver");
    Connection db = DriverManager.getConnection(url, "postgres", "richa123");
%>
    <div class="signup-container">
        <h2>Sign Up</h2>
        <form action="/signup" method="post"> <!-- Update the action attribute with your endpoint -->
            <div class="form-group">
                <label for="first-name">First Name:</label>
                <input type="text" id="first-name" name="first-name" required>
            </div>
            <div class="form-group">
                <label for="last-name">Last Name:</label>
                <input type="text" id="last-name" name="last-name" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="sin-number">SIN Number:</label>
                <input type="text" id="sin-number" name="sin-number" required pattern="\d{9}" title="SIN Number should be 9 digits"> <!-- Adjust the pattern as needed -->
            </div>
            <button type="submit" id="signup-btn" onclick="<%
      if (request.getParameter("first-name") != null && request.getParameter("last-name") != null && request.getParameter("address") != null && request.getParameter("sin-number") != null){
            String first = request.getParameter("first-name");
            String last = request.getParameter("last-name");
            String name = first+last;
            String address = request.getParameter("address");
            String sin = request.getParameter("sin-number");
            database.addCustomer(sin, name, address);
        }%>">Sign Up</button>
        </form>
        <div class="alternative-action">
            <span>Already have an account?</span>
            <button id="login-btn" onclick="location.href='login.jsp';">Log In</button> <!-- Update with your login page link -->
        </div>
    </div>
</body>
</html>
