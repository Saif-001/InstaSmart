<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Rental Web Application</title>
    <link rel="stylesheet" href="register.css">
</head>
<body>
    <div class="register-container">
        <!-- Welcome Message Section -->
        <div class="welcome-message">
            <h1>Welcome to InstaSmart!</h1>
            <p>Join our community and enjoy seamless rental services. Create your account now!</p>
        </div>

        <!-- Registration Form Section -->
        <div class="register-box">
            <h2>Create Your Account</h2>
            <form action="registerProcess.jsp" method="post" class="register-form">
                <div class="form-group">
                    <input type="text" id="name" name="name" required>
                    <label for="name">Name</label>
                    <span class="highlight"></span>
                </div>
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
                <div class="form-group">
                    <select id="userType" name="userType" required>
                        <option value="user">User</option>
                        <option value="admin">Admin</option>
                    </select>
                    <label for="userType">User Type</label>
                    <span class="highlight"></span>
                </div>
                <button type="submit" class="btn-register">Register</button>
            </form>
            <p class="login-link">Already have an account? <a href="login.jsp">Login here</a>.</p>
        </div>
    </div>
</body>
</html>