<%@ page import="java.util.HashMap, java.util.Map" %>
<%
    // Get the product name and price from the request
    String productName = request.getParameter("productName");
    double price = Double.parseDouble(request.getParameter("price"));

    // Get the cart from the session
    Map<String, Map<String, Object>> cart = (Map<String, Map<String, Object>>) session.getAttribute("cart");

    // If the cart is null, initialize it
    if (cart == null) {
        cart = new HashMap<>();
    }

    // Add the product to the cart or update its quantity
    if (cart.containsKey(productName)) {
        Map<String, Object> item = cart.get(productName);
        item.put("quantity", (int) item.get("quantity") + 1); // Increment quantity
    } else {
        Map<String, Object> item = new HashMap<>();
        item.put("quantity", 1); // Add new item with quantity 1
        item.put("price", price); // Store the product price
        cart.put(productName, item);
    }

    // Save the updated cart in the session
    session.setAttribute("cart", cart);

    // Redirect back to the user dashboard
    response.sendRedirect("userDashboard.jsp");
%>