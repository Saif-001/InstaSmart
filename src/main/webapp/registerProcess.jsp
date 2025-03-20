<%@ page import="java.sql.*" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%
    // Get form data
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String userType = request.getParameter("userType");

    // Hash the password using jBCrypt
    String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));

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

        // Insert user details into the database
        String sql = "INSERT INTO users (name, email, password, user_type) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, email);
        pstmt.setString(3, hashedPassword);
        pstmt.setString(4, userType);
        pstmt.executeUpdate();

        // Redirect to login page after successful registration
        response.sendRedirect("login.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        // Redirect to register page with an error message
        response.sendRedirect("register.jsp?error=1");
    } finally {
        // Close the database resources
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>