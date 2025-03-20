<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout - InstaSmart</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .logout-message {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .logout-message h1 {
            color: #333;
            margin-bottom: 20px;
        }

        .logout-message p {
            color: #555;
            font-size: 18px;
        }
    </style>
    <script>
        // Display a logout message and redirect to the login page after 3 seconds
        setTimeout(function() {
            window.location.href = "login.jsp";
        }, 3000); // Redirect after 3 seconds
    </script>
</head>
<body>
    <%
        // Invalidate the session to log the user out
        session.invalidate();
    %>
    <div class="logout-message">
        <h1>Logout Successful</h1>
        <p>You have been logged out. Redirecting to the login page...</p>
    </div>
    
</body>
</html>