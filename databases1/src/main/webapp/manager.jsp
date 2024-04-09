<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.Data.database"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manager Page</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Link to your CSS file -->
</head>
<body>
<%
    String url = "jdbc:postgresql://localhost:5432/Hotel%20Management";
    Class.forName("org.postgresql.Driver");
    Connection db = DriverManager.getConnection(url, "postgres", "richa123");
%>
    <h1 style="text-align: center;"> Manager Portal </h1>
    <!-- Employee Container -->
    <div class="employee-container">
        <h2>Employee Operations</h2>

        <!-- Add Employee -->
        <div class="operation-container">
            <h3>Add Employee</h3>
            <form action="manager.jsp" method="post">
                <input type="text" name="ssn_sin" placeholder="SSN/SIN" required>
                <input type="text" name="name" placeholder="Name" required>
                <input type="text" name="address" placeholder="Address" required>
                <input type="text" name="hotel_id" placeholder="Hotel ID" required>
                <input type="text" name="role_id" placeholder="Role ID" required>
                <input type="text" name="position_title" placeholder="Position Title" required>
                <button type="submit" onclick="<%
                if(request.getParameter("ssn_sin")!= null && request.getParameter("name")!= null && request.getParameter("address")!= null && request.getParameter("hotel_id")!= null && request.getParameter("role_id")!= null && request.getParameter("position_title")!= null){
                    String ssn_sin = request.getParameter("ssn_sin");
                    String name = request.getParameter("name");
                    String address = request.getParameter("address");
                    int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
                    int role_id = Integer.parseInt(request.getParameter("role_id"));
                    String position_title = request.getParameter("position_title");
                    database.addEmployee(ssn_sin, name, address, hotel_id, role_id, position_title);
                }
            %>">Add Employee</button>
            </form>
        </div>

        <!-- Update Employee -->
        <div class="operation-container">
            <h3>Update Employee</h3>
            <form action="manager.jsp" method="post">
                <input type="text" name="employee_id" placeholder="Employee ID" required>
                <div>
                    <input type="radio" id="ssn_sin" name="attribute_to_update_employee" value="ssn_sin">
                    <label for="ssn_sin">SSN/SIN</label>
                </div>
                <div>
                    <input type="radio" id="name" name="attribute_to_update_employee" value="name">
                    <label for="name">Name</label>
                </div>
                <div>
                    <input type="radio" id="address" name="attribute_to_update_employee" value="address">
                    <label for="address">Address</label>
                </div>
                <div>
                    <input type="radio" id="hotel_id" name="attribute_to_update_employee" value="hotel_id">
                    <label for="hotel_id">Hotel ID</label>
                </div>
                <div>
                    <input type="radio" id="role_id" name="attribute_to_update_employee" value="role_id">
                    <label for="role_id">Role ID</label>
                </div>
                <div>
                    <input type="radio" id="position_title" name="attribute_to_update_employee" value="position_title">
                    <label for="position_title">Position Title</label>
                </div>
                <input type="text" name="new_value" placeholder="New Value" required>
                <button type="submit" onclick="<%
        if(request.getParameter("employee_id") != null){
            int ID = Integer.parseInt(request.getParameter("employee_id"));
            if(request.getParameter("attribute_to_update_employee")!=null){
                        String column = request.getParameter("attribute_to_update_employee");
                        String input = request.getParameter("new_value");
                        database.updateEmployee(column, input, ID);
                    }
        }%>">Update Employee</button>
            </form>
        </div>


        <!-- Terminate Employee -->
        <div class="operation-container">
            <h3>Terminate Employee</h3>
            <form action="manager.jsp" method="post">
                <input type="text" name="employee_id_terminate" placeholder="Employee ID" required>
                <button type="submit" onclick = "<%
            if(request.getParameter("employee_id_terminate")!=null){
            int emp = Integer.parseInt(request.getParameter("employee_id_terminate"));
            database.terminate(emp);} %>">Terminate Employee</button>
            </form>
        </div>
    </div>

    <!-- Customer Container -->
    <div class="customer-container">
        <h2>Customer Operations</h2>

        <!-- Add Customer -->
        <div class="operation-container">
            <h3>Add Customer</h3>
            <form action="manager.jsp" method="post">
                <input type="text" name="ssn_sin" placeholder="SSN/SIN" required>
                <input type="text" name="name" placeholder="Name" required>
                <input type="text" name="address" placeholder="Address" required>
                <button type="submit" onclick="<%
                if(request.getParameter("ssn_sin")!= null && request.getParameter("name")!= null && request.getParameter("address")!= null){
                    String ssn_sin = request.getParameter("ssn_sin");
                    String name = request.getParameter("name");
                    String address = request.getParameter("address");
                    database.addCustomer(ssn_sin, name, address);
                }
            %>">Add Customer</button>
            </form>
        </div>

        <!-- Update Customer -->
        <div class="operation-container">
            <h3>Update Customer</h3>
            <form action="manager.jsp" method="post">
                <input type="text" name="customer_id" placeholder="Customer ID" required>
                <div>
                    <input type="radio" id="c_ssn_sin" name="attribute_to_update_customer" value="c_ssn_sin">
                    <label for="c_ssn_sin">SSN/SIN</label>
                </div>
                <div>
                    <input type="radio" id="c_name" name="attribute_to_update_customer" value="c_name">
                    <label for="c_name">Name</label>
                </div>
                <div>
                    <input type="radio" id="c_address" name="attribute_to_update_customer" value="c_address">
                    <label for="c_address">Address</label>
                </div>
                <input type="text" name="new_value" placeholder="New Value" required>
                <button type="submit" onclick="<%
        if(request.getParameter("customer_id") != null){
            int ID = Integer.parseInt(request.getParameter("customer_id"));
            if(request.getParameter("attribute_to_update_customer")!=null){
                        String column = request.getParameter("attribute_to_update_customer");
                        String input = request.getParameter("new_value");
                        database.updateCustomer(column, ID, input);
                    }
        }%>">Update Customer</button>
            </form>
        </div>

        <!-- Remove Customer -->
        <div class="operation-container">
            <h3>Remove Customer</h3>
            <form action="manager.jsp" method="post">
                <input type="text" name="ssn_sin_remove" placeholder="SSN/SIN" required>
                <button type="submit" onclick="<%
            if(request.getParameter("customer_id_remove")!=null){
            String ssn_sin_remove = request.getParameter("ssn_sin_remove");
            database.removeCustomer(ssn_sin_remove);} %>">Remove Customer</button>
            </form>
        </div>
    </div>

    <!-- Update Position Container -->
    <div class="update-position-container">
        <h2>Update Position</h2>
        <form action="manager.jsp" method="post">
            <input type="text" name="role_id" placeholder="Role ID" required>
            <input type="text" name="position_title" placeholder="Position Title" required>
            <input type="text" name="employee_id" placeholder="Employee ID" required>
            <button type="submit" onclick="<%
            if(request.getParameter("employee_id") != null){
                int ID = Integer.parseInt(request.getParameter("employee_id"));
                if(request.getParameter("role_id") != null){
                    int role_ID = Integer.parseInt(request.getParameter("role_id"));
                    String position = request.getParameter("position_title");
                    database.updatePosition(role_ID,position,ID);
                }
            }%>">Update Position</button>
        </form>
    </div>
</body>
</html>
