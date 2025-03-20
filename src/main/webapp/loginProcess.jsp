<%@ page import="java.sql.*" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%
    // Get form data
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/rental_app_db";
    String dbUsername = "root";
    String dbPassword = "8795";

    // Establish the database connection
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the database connection
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        // Fetch user details from the database
        String sql = "SELECT * FROM users WHERE email = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, email);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // Verify the password
            String hashedPassword = rs.getString("password");
            if (BCrypt.checkpw(password, hashedPassword)) {
                // Password matches, store user ID and user type in session
                int userId = rs.getInt("id"); // Retrieve user ID from the database
                String userType = rs.getString("user_type"); // Retrieve user type from the database

                session.setAttribute("userId", userId); // Store user ID in session
                session.setAttribute("userType", userType); // Store user type in session

                // Redirect based on user type
                if (userType.equals("admin")) {
                    response.sendRedirect("adminDashboard.jsp"); // Redirect to admin dashboard
                } else {
                    response.sendRedirect("userDashboard.jsp"); // Redirect to user dashboard
                }
            } else {
                // Password does not match, redirect to login page with an error message
                response.sendRedirect("login.jsp?error=1");
            }
        } else {
            // User not found, redirect to login page with an error message
            response.sendRedirect("login.jsp?error=1");
        }
    } catch (Exception e) {
        e.printStackTrace();
        // Redirect to login page with an error message
        response.sendRedirect("login.jsp?error=1");
    } finally {
        // Close the database resources
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>