<%@ page import="java.util.HashMap, java.util.Map" %>
<%
    // Get the cart from the session
    Map<Integer, Map<String, Object>> cart = (Map<Integer, Map<String, Object>>) session.getAttribute("cart");

    // If the cart is empty, initialize it
    if (cart == null) {
        cart = new HashMap<>();
        session.setAttribute("cart", cart);
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
    <title>Cart - InstaSmart</title>
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

        .header-right .logout-btn:hover {
            color: yellow;
        }

        /* Cart Container */
        .cart-container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .cart-container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        /* Cart Table */
        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .cart-table th, .cart-table td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        .cart-table th {
            background-color: #333;
            color: #fff;
        }

        .cart-table td {
            background-color: #fff;
        }

        .cart-table img {
            max-width: 50px;
            height: auto;
            border-radius: 8px;
        }

        /* Quantity Controls */
        .quantity-controls {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }

        .quantity-controls button {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .quantity-controls button:hover {
            background-color: #218838;
        }

        /* Remove Button */
        .remove-btn {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .remove-btn:hover {
            background-color: #c82333;
        }

        /* Total Price Section */
        .total-price {
            text-align: right;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }

        /* Checkout Button */
        .checkout-btn {
            display: block;
            width: 200px;
            margin: 0 auto;
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
        }

        .checkout-btn:hover {
            background-color: #0056b3;
        }

        /* Empty Cart Message */
        .empty-cart {
            text-align: center;
            font-size: 18px;
            color: #555;
            margin-top: 20px;
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
    <div class="cart-container">
        <h1>Your Cart</h1>
        <% if (cart != null && !cart.isEmpty()) { %>
            <table class="cart-table">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Map.Entry<Integer, Map<String, Object>> entry : cart.entrySet()) { %>
                        <tr data-product-id="<%= entry.getKey() %>">
                            <td><%= entry.getKey() %></td>
                            <td>Rs <%= entry.getValue().get("price") %></td>
                            <td>
                                <form action="updateCart.jsp" method="post">
                                    <input type="hidden" name="productName" value="<%= entry.getKey() %>">
                                    <div class="quantity-controls">
                                        <button type="submit" name="action" value="decrease">-</button>
                                        <span><%= entry.getValue().get("quantity") %></span>
                                        <button type="submit" name="action" value="increase">+</button>
                                    </div>
                                </form>
                            </td>
                            <td>Rs <%= (double) entry.getValue().get("price") * (int) entry.getValue().get("quantity") %></td>
                            <td>
                                <form action="removeFromCart.jsp" method="post">
                                    <input type="hidden" name="productName" value="<%= entry.getKey() %>">
                                    <button type="submit" class="remove-btn">Remove</button>
                                </form>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

            <!-- Total Price -->
            <div class="total-price">
                Total: Rs <%= totalPrice %>
            </div>

            <!-- Checkout Button -->
            <a href="checkout.jsp" class="checkout-btn">Proceed to Checkout</a>
        <% } else { %>
            <p class="empty-cart">Your cart is empty.</p>
        <% } %>
    </div>
    <footer style="background-color: #f8f9fa; padding: 20px; text-align: center; border-top: 1px solid #e9ecef; margin-top: 40px;">
    <p style="margin: 0; font-size: 14px; color: #6c757d;">
        &copy; 2025 InstaSmart. All rights reserved. | Developed by Saif Ali
    </p>
</footer>
</body>
</html>