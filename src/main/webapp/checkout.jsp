<%@ page import="java.util.HashMap, java.util.Map" %>
<%
    // Get the cart from the session
    Map<Integer, Map<String, Object>> cart = (Map<Integer, Map<String, Object>>) session.getAttribute("cart");

    // If the cart is empty, redirect to the cart page
    if (cart == null || cart.isEmpty()) {
        response.sendRedirect("cart.jsp");
        return;
    }

    // Calculate the total price
    double totalPrice = 0.0;
    for (Map.Entry<Integer, Map<String, Object>> entry : cart.entrySet()) {
        int quantity = (int) entry.getValue().get("quantity");
        double price = (double) entry.getValue().get("price");
        totalPrice += quantity * price;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - InstaSmart</title>
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
            background-color: #333;
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

        .header-right .logout-btn:hover {
            text-decoration: underline;
        }

        /* Checkout Container */
        .checkout-container {
            padding: 20px;
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .checkout-container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        /* Checkout Form */
        .checkout-form input, .checkout-form select, .checkout-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .checkout-form button {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        .checkout-form button:hover {
            background-color: #218838;
        }

        /* Total Price Section */
        .total-price {
            text-align: right;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-left">
            <a href="userDashboard.jsp" class="logo">
                <img src="islogo.jpg" alt="InstaSmart Logo">
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
    <div class="checkout-container">
        <h1>Checkout</h1>

        <!-- Total Price -->
        <div class="total-price">
            Total: Rs <%= totalPrice %>
        </div>

        <!-- Checkout Form -->
        <form action="confirmOrder.jsp" method="post" class="checkout-form">
            <label for="address">Shipping Address:</label>
            <textarea id="address" name="address" rows="4" placeholder="Enter your shipping address" required></textarea>

            <label for="paymentMode">Payment Mode:</label>
            <select id="paymentMode" name="paymentMode" required>
                <option value="credit_card">Credit Card</option>
                <option value="upi">UPI</option>
                <option value="cod">Cash on Delivery</option>
            </select>

            <button type="submit">Confirm Order</button>
        </form>
    </div>
</body>
</html>