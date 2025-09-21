<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.CartDao" %>

<%
    HttpSession sessionObj = request.getSession();
    Integer userId = (Integer) sessionObj.getAttribute("userId");

    if (userId == null) {
        response.sendRedirect("login3.jsp");
        return;
    }

    int watchId = Integer.parseInt(request.getParameter("watchId"));
    CartDao cartDAO = new CartDao();
    boolean added = cartDAO.addToCart(userId, watchId);

    if (added) {
        out.println("<p>✅ Item added to cart successfully.</p>");
        response.sendRedirect("cart.jsp");
    } else {
        out.println("<p>❌ Failed to add item to cart.</p>");
    }
%>
