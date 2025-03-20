<%@ page import="java.util.HashMap, java.util.Map" %>
<%
    // Get the product ID from the request
    String productName = request.getParameter("productName");

    // Get the cart from the session
    Map<Integer, Map<String, Object>> cart = (Map<Integer, Map<String, Object>>) session.getAttribute("cart");

    // Remove the item from the cart
    cart.remove(productName);

    // Save the updated cart in the session
    session.setAttribute("cart", cart);

    // Redirect back to the cart page
    response.sendRedirect("cart.jsp");
%>