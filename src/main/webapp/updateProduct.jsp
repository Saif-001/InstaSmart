<%@ page import="java.sql.*" %>
<%
    // Get form data
    int productId = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String description = request.getParameter("description");
    double price = Double.parseDouble(request.getParameter("price"));
    String image = request.getParameter("image");

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/rental_app_db";
    String dbUsername = "root";
    String dbPassword = "8795";

    // Establish the database connection
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the database connection
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        // Update product in the database
        String sql = "UPDATE products SET name = ?, description = ?, price = ?, image = ? WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, description);
        pstmt.setDouble(3, price);
        pstmt.setString(4, image);
        pstmt.setInt(5, productId);
        pstmt.executeUpdate();

        // Redirect back to the admin dashboard
        response.sendRedirect("adminDashboard.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        // Redirect back to the admin dashboard with an error message
        response.sendRedirect("adminDashboard.jsp?error=1");
    } finally {
        // Close the database resources
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>