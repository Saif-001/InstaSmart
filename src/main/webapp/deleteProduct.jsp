<%@ page import="java.sql.*" %>
<%
    // Get the product ID from the request
    int productId = Integer.parseInt(request.getParameter("id"));

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

        // Delete product from the database
        String sql = "DELETE FROM products WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, productId);
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