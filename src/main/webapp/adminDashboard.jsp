<%@ page import="java.sql.*, java.util.ArrayList, java.util.HashMap" %>
<%
    // Database connection details
    String url = "jdbc:mysql://localhost:3306/rental_app_db";
    String dbUsername = "root";
    String dbPassword = "8795";

    // Fetch products from the database
    ArrayList<HashMap<String, String>> products = new ArrayList<>();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        String sql = "SELECT * FROM products";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            HashMap<String, String> product = new HashMap<>();
            product.put("id", rs.getString("id"));
            product.put("name", rs.getString("name"));
            product.put("description", rs.getString("description"));
            product.put("price", rs.getString("price"));
            product.put("image", rs.getString("image"));
            products.add(product);
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
    <title>Admin Dashboard - InstaSmart</title>
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

        .header-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .header-right .profile-link {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }

        .header-right .profile-link:hover {
            text-decoration: underline;
        }

        .header-right .logout-btn {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }
        .logout-btn:hover{
        color: yellow;
        }
       

        /* Admin Dashboard Container */
        .admin-container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .admin-container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        /* Product Table */
        .product-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .product-table th, .product-table td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        .product-table th {
            background-color: #333;
            color: #fff;
        }

        .product-table td {
            background-color: #fff;
        }

        .product-table img {
            max-width: 50px;
            height: auto;
            border-radius: 8px;
        }

        /* Action Buttons */
        .action-btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin: 0 5px;
        }

        .action-btn.delete {
            background-color: #dc3545;
        }

        .action-btn.delete:hover {
            background-color: #c82333;
        }

        .action-btn:hover {
            background-color: #0056b3;
        }

        /* Add Product Form */
        .add-product-form {
            margin-top: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .add-product-form input, .add-product-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .add-product-form button {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .add-product-form button:hover {
            background-color: #218838;
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
            <a href="adminDashboard.jsp" class="logo">
                <img class="islogo" src="islogo.jpg" alt="InstaSmart Logo">
            </a>
        </div>
        <div class="header-center">
            <nav class="nav-menu">
                <a href="adminDashboard.jsp" class="nav-link">Home</a>
                <a href="profile.jsp" class="nav-link">Profile</a>
            </nav>
        </div>
        <div class="header-right">
            <a href="logout.jsp" class="logout-btn">Logout</a>
        </div>
    </header>

    <!-- Main Content -->
    <div class="admin-container">
        <h1>Admin Dashboard</h1>

        <!-- Add Product Form -->
        <div class="add-product-form">
            <h2>Add New Product</h2>
            <form action="addProduct.jsp" method="post">
                <input type="text" name="name" placeholder="Product Name" required>
                <textarea name="description" placeholder="Product Description" required></textarea>
                <input type="number" name="price" placeholder="Price" step="0.01" required>
                <input type="text" name="image" placeholder="Image URL" required>
                <button type="submit">Add Product</button>
            </form>
        </div>

        <!-- Product List -->
        <h2>Product List</h2>
        <table class="product-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (HashMap<String, String> product : products) { %>
                    <tr>
                        <td><%= product.get("id") %></td>
                        <td><%= product.get("name") %></td>
                        <td><%= product.get("description") %></td>
                        <td>Rs <%= product.get("price") %></td>
                        <td><img src="<%= product.get("image") %>" alt="Product Image"></td>
                        <td>
                            <a href="editProduct.jsp?id=<%= product.get("id") %>" class="action-btn">Edit</a>
                            <a href="deleteProduct.jsp?id=<%= product.get("id") %>" class="action-btn delete">Delete</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <footer style="background-color: #f8f9fa; padding: 20px; text-align: center; border-top: 1px solid #e9ecef; margin-top: 40px;">
    <p style="margin: 0; font-size: 14px; color: #6c757d;">
        &copy; 2025 InstaSmart. All rights reserved. | Developed by Saif Ali
    </p>
</footer>
</body>
</html>