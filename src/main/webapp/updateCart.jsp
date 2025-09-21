<%@ page import="java.sql.* " %>
<%@ page import="model.CartDao" %>

<%
    HttpSession sessionObj = request.getSession();
    Integer userId = (Integer) sessionObj.getAttribute("userId");

    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int watchId = Integer.parseInt(request.getParameter("watchId"));
    int quantity = Integer.parseInt(request.getParameter("quantity"));

    CartDao cartDAO = new CartDao();
    boolean success = cartDAO.updateCartQuantity(userId, watchId, quantity);

    if (success) {
        response.sendRedirect("cart.jsp"); // Refresh cart after update
    } else {
        out.println("Failed to update cart.");
    }
%>
