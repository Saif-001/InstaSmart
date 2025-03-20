<%@ page import="java.sql.*" %>
<%
    // Get form data
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

        // Insert product into the database
        String sql = "INSERT INTO products (name, description, price, image) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, description);
        pstmt.setDouble(3, price);
        pstmt.setString(4, image);
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