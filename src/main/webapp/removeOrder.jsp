<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.OrderDao" %>
<%
Integer userIdObj = (Integer) session.getAttribute("userId");
if (userIdObj == null) {
    response.sendRedirect("login3.jsp");
    return;
}

int userId = userIdObj; // ✅ Convert Integer → int

int orderId = 0;
try {
    orderId = Integer.parseInt(request.getParameter("orderId"));
} catch (NumberFormatException e) {
    response.sendRedirect("viewOrders.jsp");
    return;
}

OrderDao orderDao = new OrderDao();
boolean removed = orderDao.removeOrder(userId, orderId);

if (removed) {
    response.sendRedirect("viewOrders.jsp?status=canceled");
} else {
    response.sendRedirect("viewOrders.jsp?status=failure");
}

%>
