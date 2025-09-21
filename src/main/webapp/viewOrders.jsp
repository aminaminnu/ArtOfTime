<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, model.Order, model.OrderDao" %>

<%
    HttpSession sessionObj = request.getSession();
    Integer userId = (Integer) sessionObj.getAttribute("userId");

    if (userId == null) {
        response.sendRedirect("login3.jsp");
        return;
    }

    OrderDao orderDAO = new OrderDao();
    List<Order> orders = orderDAO.getUserOrders(userId);

    String status = request.getParameter("status"); // Get status message from redirect
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Orders</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin: 50px; background-color: #f5f5f5; }
        .container { max-width: 1000px; margin: auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); }
        .message { font-size: 18px; margin: 20px 0; padding: 10px; border-radius: 5px; }
        .success { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .error { background: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        table, th, td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        th { background: #007bff; color: white; }
        tr:nth-child(even) { background: #f9f9f9; }
        .btn { padding: 10px 15px; background: #007bff; color: white; text-decoration: none; border-radius: 5px; display: inline-block; }
        .btn-cancel { background: #dc3545; color: white; padding: 5px 10px; border: none; border-radius: 5px; cursor: pointer; }
        .product-img { width: 80px; height: 80px; object-fit: cover; border-radius: 5px; }
    </style>
</head>
<body>

<div class="container">
    <% if (status != null) { %>
        <p class="message <%= "success".equals(status) ? "success" : "error" %>">
            <% if ("success".equals(status)) { %>
                ✅ Order placed successfully!
            <% } else if ("canceled".equals(status)) { %>
                ✅ Order canceled successfully!
            <% } else if ("failure".equals(status)) { %>
                ❌ Order placement failed. Please try again!
            <% } else { %>
                ❌ Something went wrong. Try again later.
            <% } %>
        </p>
    <% } %>

    <h2>Your Orders</h2>

    <% if (orders.isEmpty()) { %>
        <p>No orders found.</p>
        <a href="products.jsp" class="btn">Continue Shopping</a>
    <% } else { %>
        <table>
            <tr>
                <th>Image</th>
                <th>Order ID</th>
                <th>Watch Name</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Order Date</th>
                <th>Action</th>
            </tr>
            <% for (Order order : orders) { %>
                <tr>
                    <td>
                        <img src="<%= request.getContextPath() %>/Assets/<%= order.getImageUrl() %>" alt="Watch Image" class="product-img">
                    </td>
                    <td><%= order.getId() %></td>
                    <td><%= order.getWatchName() %></td>
                    <td><%= order.getQuantity() %></td>
                    <td>$<%= order.getTotalPrice() %></td>
                    <td><%= order.getOrderDate() %></td>
                    <td>
                        <a href="removeOrder.jsp?orderId=<%= order.getId() %>" class="btn-cancel"
                           onclick="return confirm('Are you sure you want to cancel this order?');">
                            Cancel
                        </a>
                    </td>
                </tr>
            <% } %>
        </table>
    <% } %>
</div>

</body>
</html>
