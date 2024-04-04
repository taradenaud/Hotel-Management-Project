<!DOCTYPE html>
<html>
<head>
    <title>Employee Page</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Link to your CSS file -->
</head>
<body>
    <h1 style="text-align: center;"> Employee Portal </h1>
    <!-- Search Bookings Container -->
    <div class="search-bookings-container">
        <h2>Search Bookings</h2>
        <form id="search-bookings-form">
            <div class="form-group">
                <label for="booking-id-search">Booking ID:</label>
                <input type="text" id="booking-id-search" name="booking-id-search" required>
            </div>
            <button type="submit">Search</button>
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
            <button type="submit">Approve</button>
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
                <label for="area">Area:</label>
                <select id="area" name="area" required>
                    <option value="">Select an Area</option>
                    <option value="area1">Area 1</option>
                    <option value="area2">Area 2</option>
                    <option value="area3">Area 3</option>
                    <option value="area4">Area 4</option>
                    <option value="area5">Area 5</option>
                    <option value="area6">Area 6</option>
                    <option value="area7">Area 7</option>
                    <option value="area8">Area 8</option>
                    <option value="area9">Area 9</option>
                    <option value="area10">Area 10</option>
                    <option value="area11">Area 11</option>
                    <option value="area12">Area 12</option>
                    <option value="area13">Area 13</option>
                    <option value="area14">Area 14</option>
                    <option value="area15">Area 15</option>
                </select>
            </div>

            <div class="form-group">
                <label for="hotel-chain">Hotel Chain:</label>
                <select id="hotel-chain" name="hotel-chain" required>
                    <option value="">Select a Hotel Chain</option>
                    <option value="chain1">Hotel Chain 1</option>
                    <option value="chain2">Hotel Chain 2</option>
                    <option value="chain3">Hotel Chain 3</option>
                    <option value="chain4">Hotel Chain 4</option>
                    <option value="chain5">Hotel Chain 5</option>
                </select>
            </div>

            <div class="form-group">
                <label for="hotel-category">Hotel Category:</label>
                <input type="text" id="hotel-category" name="hotel-category">
            </div>

            <div class="form-group">
                <label for="total-rooms">Total Number of Rooms:</label>
                <input type="number" id="total-rooms" name="total-rooms" min="1" required>
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

            <button type="submit">Search</button>
        </form>
    </div>

    <!-- Book Room Container -->
    <div class="book-room-container">
        <h2>Book Room</h2>
        <form id="book-room-form">
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
            <button type="submit">Book Room</button>
        </form>
    </div>
</body>
</html>
