<html>
<head>
    <title>Hotel Booking</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
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

    <!-- Rooms per City Carousel -->
    <div class="carousel" id="roomsPerCityCarousel">
        <h2>Rooms per City</h2>
        <div class="carousel-container">
           
            <div class="carousel-item">
                <img src="../assets/Montreal.jpg" alt="Montreal">
                <div class="overlay-text">
                    <div class="main-text">Montreal</div>
                    <div class="sub-text">100 rooms available</div>
                </div>
            </div>
            
            <div class="carousel-item">
                <img src="../assets/Toronto.jpg" alt="Toronto">
                <div class="overlay-text">
                    <div class="main-text">Toronto</div>
                    <div class="sub-text">100 rooms available</div>
                </div>
            </div>

            <div class="carousel-item">
                <img src="../assets/Edmonton.jpg" alt="Edmonton">
                <div class="overlay-text">
                    <div class="main-text">Edmonton</div>
                    <div class="sub-text">100 rooms available</div>
                </div>
            </div>

            <div class="carousel-item">
                <img src="../assets/Calgary.jpg" alt="Calgary">
                <div class="overlay-text">
                    <div class="main-text">Calgary</div>
                    <div class="sub-text">100 rooms available</div>
                </div>
            </div>

            <div class="carousel-item">
                <img src="../assets/Vancouver.jpg" alt="Vancouver">
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
                <img src="../assets/Hotel1.jpg" alt="Hotel 1">
                <div class="overlay-text">
                    <div class="main-text">Hotel 1</div>
                    <div class="sub-text">100 rooms available</div>
                </div>
            </div>
            
            <div class="carousel-item">
                <img src="../assets/Hotel2.jpg" alt="Hotel 2">
                <div class="overlay-text">
                    <div class="main-text">Hotel 2</div>
                    <div class="sub-text">100 rooms available</div>
                </div>
            </div>

            <div class="carousel-item">
                <img src="../assets/Hotel3.jpg" alt="Hotel 3">
                <div class="overlay-text">
                    <div class="main-text">Hotel 3</div>
                    <div class="sub-text">100 rooms available</div>
                </div>
            </div>

            <div class="carousel-item">
                <img src="../assets/Hotel4.jpg" alt="Hotel 4">
                <div class="overlay-text">
                    <div class="main-text">Hotel 4</div>
                    <div class="sub-text">100 rooms available</div>
                </div>
            </div>

            <div class="carousel-item">
                <img src="../assets/Hotel5.jpg" alt="Hotel 5">
                <div class="overlay-text">
                    <div class="main-text">Hotel 5</div>
                    <div class="sub-text">100 rooms available</div>
                </div>
            </div>
        </div>
    </div>


</body>
</html>
