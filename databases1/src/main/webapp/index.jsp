<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.Data.database"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>Hotel Booking</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<%
    Connection db = database.getConnection();
%>
<h1>Welcome to Our Hotel!</h1>

<div class="login-section">
    <button id="login-btn" onclick="location.href='login.jsp';">Log In</button>
    <button id="signup-btn" onclick="location.href='signup.jsp';">Sign Up</button>
</div>
<h2>Book Your Room</h2>
<form>
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

<!-- Rooms per City Carousel -->
<div class="carousel" id="roomsPerCityCarousel">
    <h2>Rooms per City</h2>
    <div class="carousel-container">

        <div class="carousel-item">
            <img src="assets/Montreal.jpg" alt="Montreal">
            <div class="overlay-text">
                <div class="main-text">Montreal</div>
                <div class="sub-text">100 rooms available</div>
            </div>
        </div>

        <div class="carousel-item">
            <img src="assets/Toronto.jpg" alt="Toronto">
            <div class="overlay-text">
                <div class="main-text">Toronto</div>
                <div class="sub-text">100 rooms available</div>
            </div>
        </div>

        <div class="carousel-item">
            <img src="assets/Edmonton.jpg" alt="Edmonton">
            <div class="overlay-text">
                <div class="main-text">Edmonton</div>
                <div class="sub-text">100 rooms available</div>
            </div>
        </div>

        <div class="carousel-item">
            <img src="assets/Calgary.jpg" alt="Calgary">
            <div class="overlay-text">
                <div class="main-text">Calgary</div>
                <div class="sub-text">100 rooms available</div>
            </div>
        </div>

        <div class="carousel-item">
            <img src="assets/Vancouver.jpg" alt="Vancouver">
            <div class="overlay-text">
                <div class="main-text">Vancouver</div>
                <div class="sub-text">100 rooms available</div>
            </div>
        </div>
    </div>
</div>

<!-- Featured Hotels Carousel -->
<div class="carousel" id="featuredHotelsCarousel">
    <h2>Featured Hotels</h2>
    <div class="carousel-container">

        <div class="carousel-item">
            <img src="assets/Hotel1.jpg" alt="Hotel 1">
            <div class="overlay-text">
                <div class="main-text">Hotel 1</div>
                <div class="sub-text">100 rooms available</div>
            </div>
        </div>

        <div class="carousel-item">
            <img src="assets/Hotel2.jpg" alt="Hotel 2">
            <div class="overlay-text">
                <div class="main-text">Hotel 2</div>
                <div class="sub-text">100 rooms available</div>
            </div>
        </div>

        <div class="carousel-item">
            <img src="assets/Hotel3.jpg" alt="Hotel 3">
            <div class="overlay-text">
                <div class="main-text">Hotel 3</div>
                <div class="sub-text">100 rooms available</div>
            </div>
        </div>

        <div class="carousel-item">
            <img src="assets/Hotel4.jpg" alt="Hotel 4">
            <div class="overlay-text">
                <div class="main-text">Hotel 4</div>
                <div class="sub-text">100 rooms available</div>
            </div>
        </div>

        <div class="carousel-item">
            <img src="assets/Hotel5.jpg" alt="Hotel 5">
            <div class="overlay-text">
                <div class="main-text">Hotel 5</div>
                <div class="sub-text">100 rooms available</div>
            </div>
        </div>
    </div>
</div>


</body>
</html>