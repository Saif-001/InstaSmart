<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Rental Web Application</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <div class="login-container">
        <!-- Welcome Back Message Section -->
        <div class="welcome-message">
            <h1>Welcome Back!</h1>
            <p>We're glad to see you again. Log in to continue your journey with InstaSmart.</p>
        </div>

        <!-- Login Form Section -->
        <div class="login-box">
            <h2>Login to Your Account</h2>
            <form action="loginProcess.jsp" method="post" class="login-form">
                <div class="form-group">
                    <input type="email" id="email" name="email" required>
                    <label for="email">Email</label>
                    <span class="highlight"></span>
                </div>
                <div class="form-group">
                    <input type="password" id="password" name="password" required>
                    <label for="password">Password</label>
                    <span class="highlight"></span>
                </div>
                <button type="submit" class="btn-login">Login</button>
            </form>
            <p class="register-link">Don't have an account? <a href="register.jsp">Register here</a>.</p>
        </div>
    </div>
</body>
</html>