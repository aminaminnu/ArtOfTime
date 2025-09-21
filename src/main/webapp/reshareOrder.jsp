<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.OrderDao" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login3.jsp");
        return;
    }

    int orderId = Integer.parseInt(request.getParameter("orderId"));
    // You can define what "reshare" means: send to email, social, etc.
    // For now, we just redirect back with a success message
    response.sendRedirect("viewOrders.jsp?status=reshared");
%>
