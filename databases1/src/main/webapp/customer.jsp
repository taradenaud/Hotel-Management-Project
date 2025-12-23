<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import=" com.Data.database"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Search Page</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Link to your CSS file -->
</head>
<body>
<%
    Connection db = database.getConnection();
%>
    <h1 style="text-align: center;"> Customer Portal </h1>
    <div class="room-search-container">
        <h1>Room Search</h1>
        <form action="customer.jsp" method="post" id="room-search-form">
            <div class="form-group">
                <label for="checkin-date">Check-in Date:</label>
                <input type="date" id="checkin-date" name="checkin-date" required>
            </div>

            <div class="form-group">
                <label for="checkout-date">Check-out Date:</label>
                <input type="date" id="checkout-date" name="checkout-date" required>
            </div>

            <div class="form-group">
                <label for="room-capacity">Room Capacity (Single/Double):</label>
                <input type="text" id="room-capacity" name="room-capacity">
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
                <input type="text" id="room-price" name="room-price">
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

    <div class="available-rooms-container">
        <h1>Available Rooms</h1>
        <div id="search-results">
            <%
                if(rooms != null){for(Object room : rooms.toArray()){%>
            <li><%=room.toString()%></li>
            <%}}%>
            <!-- Dynamic content will be added here based on the search -->
        </div>
    </div>

    <div class="booking-container">
        <h1>Book a Room</h1>
        <form id="room-booking-form" action="customer.jsp" method="post">
            <div class="form-group">
                <label for="customer-id">Customer ID:</label>
                <input type="number" id="customer-id" name="customer-id" required>
            </div>

            <div class="form-group">
                <label for="room-id">Room ID:</label>
                <input type="number" id="room-id" name="room-id" required>
            </div>

            <div class="form-group">
                <label for="booking-checkin-date">Check-in Date:</label>
                <input type="date" id="booking-checkin-date" name="booking-checkin-date" required>
            </div>

            <div class="form-group">
                <label for="booking-checkout-date">Check-out Date:</label>
                <input type="date" id="booking-checkout-date" name="booking-checkout-date" required>
            </div>

            <button type="submit" onclick = "<%
      if(request.getParameter("room-id") != null && request.getParameter("customer-id")!=null){
        int room_id = Integer.parseInt(request.getParameter("room-id"));
        int customer_id = Integer.parseInt(request.getParameter("customer-id"));
        String check_in_date = request.getParameter("booking-checkin-date");
        String check_out_date = request.getParameter("booking-checkout-date");
        database.bookRoom(customer_id,room_id,check_in_date,check_out_date);
      }%>">Book Room</button>
        </form>
    </div>
</body>
</html>