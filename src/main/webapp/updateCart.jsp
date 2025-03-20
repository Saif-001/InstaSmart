<%@ page import="java.util.HashMap, java.util.Map" %>
<%
    // Get the product ID and action from the request
    String productName = request.getParameter("productName");
    String action = request.getParameter("action");

    // Get the cart from the session
    Map<Integer, Map<String, Object>> cart = (Map<Integer, Map<String, Object>>) session.getAttribute("cart");

    // Update the quantity based on the action
    if (action.equals("increase")) {
        cart.get(productName).put("quantity", (int) cart.get(productName).get("quantity") + 1); // Increase quantity
    } else if (action.equals("decrease")) {
        int newQuantity = (int) cart.get(productName).get("quantity") - 1;
        if (newQuantity <= 0) {
            cart.remove(productName); // Remove item if quantity is 0
        } else {
            cart.get(productName).put("quantity", newQuantity); // Decrease quantity
        }
    }

    // Save the updated cart in the session
    session.setAttribute("cart", cart);

    // Redirect back to the cart page
    response.sendRedirect("cart.jsp");
%>