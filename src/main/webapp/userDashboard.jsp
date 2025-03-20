<%@ page import="java.util.HashMap, java.util.Map" %>
<%
    // Initialize the cart in the session if it doesn't exist
    if (session.getAttribute("cart") == null) {
        session.setAttribute("cart", new HashMap<Integer, Integer>());
    }

    // Get the cart from the session
    Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - InstaSmart</title>
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

        .header-right {
            text-decoration: none;
        }

        /* Dashboard Container */
        .dashboard-container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .dashboard-container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        /* Product Grid */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .product-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .product-card img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }

        .product-card h3 {
            margin: 10px 0;
            font-size: 18px;
        }

        .product-card .description {
            font-size: 14px;
            color: #555;
        }

        .product-card .price {
            font-size: 16px;
            font-weight: bold;
            color: #333;
            margin: 10px 0;
        }

        .product-card .btn-add-to-cart {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .product-card .btn-add-to-cart:hover {
            background-color: #218838;
        }
        .logout-btn:hover{
        color: yellow;
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
    <div class="dashboard-container">
        <h1>Welcome to InstaSmart</h1>
        <div class="product-grid">
            <!-- Product Cards -->
            <div class="product-card">
                <img src="images/1.jpeg" alt="Product 1">
                <h3>Comfortable Chair</h3>
                <p class="description">It is very comfortable to seat and long time durable.</p>
                <p class="price">Rs 1500</p>
                <form action="addToCart.jsp" method="post">
                    
                    <input type="hidden" name="productName" value="Comfortable Chair">
                    <input type="hidden" name="price" value="1500">
                    <button type="submit" class="btn-add-to-cart">Add to Cart</button>
                </form>
            </div>
             <div class="product-card">
        <img src="images/2.jpeg" alt="Product 2">
        <h3>DSLR camera</h3>
        <p class="description">5600D camera for professional Photography and videography.</p>
        <p class="price">Rs 2000</p>
        <form action="addToCart.jsp" method="post">
            <input type="hidden" name="productName" value="DSLR Camera">
            <input type="hidden" name="price" value="2000">
            <button type="submit" class="btn-add-to-cart">Add to Cart</button>
        </form>
    </div>
    <div class="product-card">
        <img src="images/3.jpeg" alt="Product 3">
        <h3>Drone Camera</h3>
        <p class="description">Useful for long distance and height video recording.</p>
        <p class="price">Rs 1800</p>
        <form action="addToCart.jsp" method="post">
            <input type="hidden" name="productName" value="Drone Camera">
            <input type="hidden" name="price" value="1800">
            <button type="submit" class="btn-add-to-cart">Add to Cart</button>
        </form>
    </div>
     <div class="product-card">
        <img src="images/4.jpeg" alt="Product 4">
        <h3>Yamaha Bike</h3>
        <p class="description">A high race and accelerator bike for race.</p>
        <p class="price">Rs 2500</p>
        <form action="addToCart.jsp" method="post">
            <input type="hidden" name="productName" value="Yamaha Bike">
            <input type="hidden" name="price" value="2500">
            <button type="submit" class="btn-add-to-cart">Add to Cart</button>
        </form>
    </div>
    <div class="product-card">
        <img src="images/5.jpeg" alt="Product 5">
        <h3>Book</h3>
        <p class="description">book on Impact Report.</p>
        <p class="price">Rs 200</p>
        <form action="addToCart.jsp" method="post">
            <input type="hidden" name="productName" value="Book">
            <input type="hidden" name="price" value="200">
            <button type="submit" class="btn-add-to-cart">Add to Cart</button>
        </form>
    </div>
    <div class="product-card">
        <img src="images/6.jpeg" alt="Product 6">
        <h3>Cube</h3>
        <p class="description">Its a toy for boys and it plays mind game.</p>
        <p class="price">Rs 120</p>
        <form action="addToCart.jsp" method="post">
            <input type="hidden" name="productName" value="Cube">
            <input type="hidden" name="price" value="120">
            <button type="submit" class="btn-add-to-cart">Add to Cart</button>
        </form>
    </div>
    <div class="product-card">
        <img src="images/7.jpeg" alt="Product 7">
        <h3>Sound Box</h3>
        <p class="description">Sound box for parties like birthdays, anniversary, and other parties celebration.</p>
        <p class="price">Rs 4200</p>
        <form action="addToCart.jsp" method="post">
            <input type="hidden" name="productName" value="Soundbox">
            <input type="hidden" name="price" value="4200">
            <button type="submit" class="btn-add-to-cart">Add to Cart</button>
        </form>
    </div>
    <div class="product-card">
        <img src="images/8.jpeg" alt="Product 8">
        <h3>Short Table</h3>
        <p class="description">The table used for multipurpose and putting the things safe.</p>
        <p class="price">Rs 107</p>
        <form action="addToCart.jsp" method="post">
            <input type="hidden" name="productName" value="Short Table">
            <input type="hidden" name="price" value="107">
            <button type="submit" class="btn-add-to-cart">Add to Cart</button>
        </form>
    </div>
            
            <!-- Add more product cards as needed -->
        </div>
    </div>
    <footer style="background-color: #f8f9fa; padding: 20px; text-align: center; border-top: 1px solid #e9ecef; margin-top: 40px;">
    <p style="margin: 0; font-size: 14px; color: #6c757d;">
        &copy; 2025 InstaSmart. All rights reserved. | Developed by Saif Ali
    </p>
</footer>
</body>
</html>