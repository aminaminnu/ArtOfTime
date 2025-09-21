<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.WishlistDao, model.Customer" %>
<%
    HttpSession sessionObj = request.getSession();
    Customer user = (Customer) sessionObj.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login3.jsp");
        return;
    }

    int userId = user.getId();
    int watchId = Integer.parseInt(request.getParameter("watchId"));

    WishlistDao wishlistDao = new WishlistDao();
    boolean added = wishlistDao.addToWishlist(userId, watchId);

    response.sendRedirect("wishlist.jsp");
%>
