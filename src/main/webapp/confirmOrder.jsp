<%@ page import="java.util.HashMap, java.util.Map" %>
<%
    // Get form data (if needed)
    String address = request.getParameter("address");
    String paymentMode = request.getParameter("paymentMode");

    // Get the cart from the session
    Map<Integer, Map<String, Object>> cart = (Map<Integer, Map<String, Object>>) session.getAttribute("cart");

    // If the cart is empty, redirect to the cart page
    if (cart == null || cart.isEmpty()) {
        response.sendRedirect("cart.jsp");
        return;
    }

    // Clear the cart from the session
    session.removeAttribute("cart");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation - InstaSmart</title>
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

        .confirmation-message {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .confirmation-message h1 {
            color: #333;
            margin-bottom: 20px;
        }

        .confirmation-message p {
            color: #555;
            font-size: 18px;
        }
    </style>
    <script>
        // Redirect to the homepage after 5 seconds
        setTimeout(function() {
            window.location.href = "userDashboard.jsp";
        }, 5000); // Redirect after 5 seconds
    </script>
</head>
<body>
    <div class="confirmation-message">
        <h1>Order Successful!</h1>
        <p>Thank you for your purchase. Your order will be shipped to:</p>
        <p><strong><%= address %></strong></p>
        <p>Payment Mode: <strong><%= paymentMode %></strong></p>
        <p>Redirecting to the homepage...</p>
    </div>
</body>
</html>