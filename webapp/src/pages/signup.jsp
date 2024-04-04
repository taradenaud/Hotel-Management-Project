<!DOCTYPE html>
<html>
<head>
    <title>Sign Up Page</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Linking the same CSS file -->
</head>
<body>
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
            <button type="submit" id="signup-btn">Sign Up</button>
        </form>
        <div class="alternative-action">
            <span>Already have an account?</span>
            <button id="login-btn" onclick="location.href='login.jsp';">Log In</button> <!-- Update with your login page link -->
        </div>
    </div>
</body>
</html>
