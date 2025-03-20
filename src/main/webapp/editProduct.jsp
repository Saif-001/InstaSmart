<%@ page import="java.sql.*" %>
<%
    // Get the product ID from the request
    int productId = Integer.parseInt(request.getParameter("id"));

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/rental_app_db";
    String dbUsername = "root";
    String dbPassword = "8795";

    // Fetch product details from the database
    String name = "";
    String description = "";
    double price = 0.0;
    String image = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        String sql = "SELECT * FROM products WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, productId);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            description = rs.getString("description");
            price = rs.getDouble("price");
            image = rs.getString("image");
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
    <title>Edit Product - InstaSmart</title>
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

        /* Edit Product Container */
        .edit-product-container {
            padding: 20px;
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .edit-product-container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        /* Edit Product Form */
        .edit-product-form input, .edit-product-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .edit-product-form button {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .edit-product-form button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-left">
            <a href="admindashboard.jsp" class="logo">
                <img src="islogo.jpg" alt="InstaSmart Logo">
            </a>
        </div>
        <div class="header-center">
            <nav class="nav-menu">
                <a href="admindashboard.jsp" class="nav-link">Home</a>
                <a href="logout.jsp" class="nav-link">Logout</a>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <div class="edit-product-container">
        <h1>Edit Product</h1>
        <form action="updateProduct.jsp" method="post" class="edit-product-form">
            <input type="hidden" name="id" value="<%= productId %>">
            <input type="text" name="name" value="<%= name %>" placeholder="Product Name" required>
            <textarea name="description" placeholder="Product Description" required><%= description %></textarea>
            <input type="number" name="price" value="<%= price %>" placeholder="Price" step="0.01" required>
            <input type="text" name="image" value="<%= image %>" placeholder="Image URL" required>
            <button type="submit">Update Product</button>
        </form>
    </div>
</body>
</html>