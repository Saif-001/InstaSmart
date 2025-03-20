<%@ page import="java.sql.*" %>
<%
    // Retrieve the user ID from the session
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if user is not logged in
        return;
    }

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/rental_app_db";
    String dbUsername = "root";
    String dbPassword = "8795";

    // User details
    String name = "";
    String email = "";
    String userType = "";

    // Fetch user details from the database
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        String sql = "SELECT name, email, user_type FROM users WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, userId);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            userType = rs.getString("user_type");
        }

        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - InstaSmart</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        /* Header Styles */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #fff;
        }

        .header-left .logo img {
            height: 50px;
        }

        .header-center .nav-menu {
            display: flex;
            gap: 20px;
        }

        .header-center .nav-link {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }

        .header-center .nav-link:hover {
            text-decoration: underline;
        }

        .header-right .logout-btn {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }
        .logout-btn:hover{
        text-decoration: none;
        color: yellow;
        }

        

        /* Profile Container */
        .profile-container {
            padding: 20px;
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            place-items: center;
        }

        .profile-container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .profile-details {
            font-size: 18px;
            color: #555;
        }

        .profile-details p {
            margin: 10px 0;
        }

        .profile-details strong {
            color: #333;
        }
        .ppimg{
        height: 300px;
        width: 300px;
        }
        .islogo{
        border-radius: 50%;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-left">
            <a href="userDashboard.jsp" class="logo">
                <img class="islogo" src="islogo.jpg" alt="InstaSmart Logo">
            </a>
        </div>
        <div class="header-center">
            <nav class="nav-menu">
                <a href="userDashboard.jsp" class="nav-link">Home</a>
                <a href="cart.jsp" class="nav-link">Cart</a>
                <a href="profile.jsp" class="nav-link">Profile</a>
            </nav>
        </div>
        <div class="header-right">
            <a href="logout.jsp" class="logout-btn">Logout</a>
        </div>
    </header>

    <!-- Main Content -->
    <div class="profile-container">
        <h1>User Profile</h1>
        <img class= "ppimg" src="images/profilepic.jpeg" alt="profile-picture"/>
        <div class="profile-details">
            <p><strong>Name:</strong> <%= name %></p>
            <p><strong>Email:</strong> <%= email %></p>
            <p><strong>User Type:</strong> <%= userType %></p>
        </div>
    </div>
    <footer style="background-color: #f8f9fa; padding: 20px; text-align: center; border-top: 1px solid #e9ecef; margin-top: 40px;">
    <p style="margin: 0; font-size: 14px; color: #6c757d;">
        &copy; 2025 InstaSmart. All rights reserved. | Developed by Saif Ali
    </p>
</footer>
</body>
</html>