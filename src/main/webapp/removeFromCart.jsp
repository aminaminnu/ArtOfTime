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

    CartDao cartDAO = new CartDao();
    boolean success = cartDAO.removeFromCart(userId, watchId);

    if (success) {
        response.sendRedirect("cart.jsp"); // Refresh cart after removal
    } else {
        out.println("Failed to remove item from cart.");
    }
%>
