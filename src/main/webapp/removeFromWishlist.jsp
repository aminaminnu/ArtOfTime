<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.WishlistDao, model.Customer" %>
<%
    Customer user = (Customer) session.getAttribute("user"); // make sure session attribute name is consistent
    if (user == null) {
        response.sendRedirect("login3.jsp");
        return;
    }

    int userId = user.getId();
    int watchId = 0;
    try {
        watchId = Integer.parseInt(request.getParameter("watchId"));
    } catch (NumberFormatException e) {
        response.sendRedirect("wishlist.jsp");
        return;
    }

    WishlistDao wishlistDao = new WishlistDao();
    boolean removed = wishlistDao.removeFromWishlist(userId, watchId);

    if (removed) {
        session.setAttribute("wishlistMessage", "✅ Item removed successfully!");
    } else {
        session.setAttribute("wishlistMessage", "❌ Failed to remove item.");
    }

    response.sendRedirect("wishlist.jsp");
%>
