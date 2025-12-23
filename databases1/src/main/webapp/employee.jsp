<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.Data.database"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Page</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Link to your CSS file -->
</head>
<body>
<%
    Connection db = database.getConnection();
%>
    <h1 style="text-align: center;"> Employee Portal </h1>
    <!-- Search Bookings Container -->
    <div class="search-bookings-container">
        <h2>Search Bookings</h2>
        <form id="search-bookings-form" a>
            <div class="form-group">
                <label for="booking-id-search">Booking ID:</label>
                <input type="text" id="booking-id-search" name="booking-id-search" required>
            </div>
            <button type="submit" onclick = "<%
            if(request.getParameter("booking-id-search")!=null){
            int booking_id = Integer.parseInt(request.getParameter("booking-id-search"));
            database.searchBookings(booking_id);} %>">Search</button>
        </form>
    </div>

    <!-- Approve Booking Container -->
    <div class="approve-booking-container">
        <h2>Approve Booking</h2>
        <form id="approve-booking-form">
            <div class="form-group">
                <label for="customer-id-approve">Customer ID:</label>
                <input type="text" id="customer-id-approve" name="customer-id-approve" required>
            </div>
            <div class="form-group">
                <label for="payment-approve">Payment:</label>
                <input type="text" id="payment-approve" name="payment-approve" required>
            </div>
            <button type="submit" onclick="<%
                if (request.getParameter("customer-id-approve") != null && request.getParameter("payment-approve") != null) {
                    int customer_id_approve = Integer.parseInt(request.getParameter("customer-id-approve"));
                    String payment_approve = request.getParameter("payment-approve");
                    database.approveBookings(customer_id_approve, payment_approve);
                }
                %>">Approve</button>
        </form>
    </div>

    <!-- Room Search Container -->
    <div class="room-search-container">
        <h2>Room Search</h2>
        <!-- Include your room search form here, similar to the customer's room search form -->
        <form id="room-search-form">
            <div class="form-group">
                <label for="checkin-date">Check-in Date:</label>
                <input type="date" id="checkin-date" name="checkin-date" required>
            </div>

            <div class="form-group">
                <label for="checkout-date">Check-out Date:</label>
                <input type="date" id="checkout-date" name="checkout-date" required>
            </div>

            <div class="form-group">
                <label for="room-capacity">Room Capacity:</label>
                <input type="number" id="room-capacity" name="room-capacity" min="1" required>
            </div>

            <div class="form-group">
                <label for="city">City:</label>
                <select id="city" name="city" >
                    <option value="">Select a City</option>
                    <option value="Montreal">Montreal</option>
                    <option value="Toronto">Toronto</option>
                    <option value="Ottawa">Ottawa</option>
                    <option value="Vancouver">Vancouver</option>
                    <option value="Halifax">Halifax</option>
                    <option value="Dallas">Dallas</option>
                    <option value="Chicago">Chicago</option>
                    <option value="Edmonton">Edmonton</option>
                    <option value="New York">New York</option>
                    <option value="Miami">Miami</option>
                    <option value="Houston">Houston</option>
                    <option value="Philadelphia">Philadelphia</option>
                    <option value="Los Angeles">Los Angeles</option>
                    <option value="Atlanta">Atlanta</option>
                    <option value="Calgary">Calgary</option>
                </select>
            </div>

            <div class="form-group">
                <label for="room-price">Room Price:</label>
                <input type="text" id="room-price" name="room-price" required>
            </div>

            <div class="form-group">
                <label>Extras:</label>
                <div class="checkbox-group">
                    <div>
                        <input type="checkbox" id="sea-view" name="extras" value="sea-view">
                        <label for="sea-view">Sea View</label>
                    </div>
                    <div>
                        <input type="checkbox" id="mountain-view" name="extras" value="mountain-view">
                        <label for="mountain-view">Mountain View</label>
                    </div>
                    <div>
                        <input type="checkbox" id="is-extendable" name="extras" value="is-extendable">
                        <label for="is-extendable">Is Extendable</label>
                    </div>
                </div>
            </div>

            <button type="submit" onclick="<%
                ArrayList<String> rooms=null;
                String checkin_date = request.getParameter("checkin-date");
                String checkout_date = request.getParameter("checkout-date");
                if (request.getParameter("city") != null && request.getParameter("room-capacity") != null) {
                    String city = request.getParameter("city");
                    String room_capacity = request.getParameter("room-capacity");
                    int price = Integer.parseInt(request.getParameter("room-price"));
                    String seaview = request.getParameter("sea-view");
                    String mountainview = request.getParameter("mountain-view");
                    String extendable = request.getParameter("is-extendable");
                    rooms = database.roomSearch(checkin_date, checkout_date, room_capacity, city, price, seaview, mountainview, extendable);
                    session.setAttribute("Rooms", rooms);
                } %>">Search</button>
        </form>
    </div>

    <!-- Book Room Container -->
    <div class="book-room-container">
        <h2>Book Room</h2>
        <form id="book-room-form" action="employee.jsp" method="post">
            <div class="form-group">
                <label for="customer-id-book">Customer ID:</label>
                <input type="text" id="customer-id-book" name="customer-id-book" required>
            </div>
            <div class="form-group">
                <label for="room-id-book">Room ID:</label>
                <input type="text" id="room-id-book" name="room-id-book" required>
            </div>
            <div class="form-group">
                <label for="checkin-date-book">Check-in Date:</label>
                <input type="date" id="checkin-date-book" name="checkin-date-book" required>
            </div>
            <div class="form-group">
                <label for="checkout-date-book">Check-out Date:</label>
                <input type="date" id="checkout-date-book" name="checkout-date-book" required>
            </div>
            <button type="submit" onclick = "<%
      if(request.getParameter("room-id") != null && request.getParameter("customer-id")!=null){
        int room_id = Integer.parseInt(request.getParameter("room-id"));
        int customer_id = Integer.parseInt(request.getParameter("customer-id"));
        String check_in_date = request.getParameter("checkin-date-book");
        String check_out_date = request.getParameter("checkout-date-book");
        database.bookRoom(customer_id,room_id,check_in_date,check_out_date);
      }%>">Book Room</button>
        </form>
    </div>
</body>
</html>
