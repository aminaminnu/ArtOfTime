<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, model.Watch, model.CartDao, java.math.BigDecimal" %>

<%
    HttpSession sessionObj = request.getSession();
    Integer userId = (Integer) sessionObj.getAttribute("userId");

    if (userId == null) {
        response.sendRedirect("login3.jsp");
        return;
    }

    CartDao cartDAO = new CartDao();
    List<Watch> cartItems = cartDAO.getCartItems(userId);

    BigDecimal totalPrice = BigDecimal.ZERO;
    for (Watch watch : cartItems) {
        totalPrice = totalPrice.add(watch.getPrice().multiply(BigDecimal.valueOf(watch.getQuantity())));
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        .cart-container { display: flex; flex-wrap: wrap; justify-content: center; gap: 20px; }
        .cart-item { 
            border: 1px solid #ddd; 
            padding: 15px; 
            border-radius: 10px; 
            background: #fff; 
            box-shadow: 2px 2px 10px rgba(0,0,0,0.1); 
            width: 250px;
            text-align: center;
        }
        .cart-item img {
            width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
        }
        .btn { 
            padding: 8px 12px; 
            text-decoration: none; 
            background: #007bff; 
            color: white; 
            border-radius: 5px; 
            display: inline-block; 
            margin-top: 5px; 
            border: none; 
            cursor: pointer; 
        }
        .btn-danger { background: #dc3545; }
        .total-container {
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
        }
        .order-all-container {
            margin-top: 20px;
        }
    </style>
</head>

<body>

<h2>Your Cart</h2>

<% if (cartItems.isEmpty()) { %>
    <p>🛒 Your cart is empty!</p>
    <a href="products.jsp" class="btn">Continue Shopping</a>
<% } else { %>
    <div class="cart-container">
        <% for (Watch watch : cartItems) { %>
            <div class="cart-item">
                <img src="<%= request.getContextPath() %>/Assets/<%= watch.getImage() %>" alt="Watch Image">
                <h3><%= watch.getName() %></h3>
                <p>Brand: <%= watch.getBrand() %></p>
                <p>Price: $<%= watch.getPrice() %></p>
                <p>Quantity: <%= watch.getQuantity() %></p>

                <!-- Place Single Order -->
                <form action="placeOrder.jsp" method="post">
                    <input type="hidden" name="watchId" value="<%= watch.getId() %>">
                    <input type="hidden" name="quantity" value="<%= watch.getQuantity() %>">
                    <button type="submit" class="btn">Order Now</button>
                </form>

                <a href="removeFromCart.jsp?watchId=<%= watch.getId() %>" class="btn btn-danger">Remove</a>
            </div>
        <% } %>
    </div>

    <!-- Display Total Price -->
    <div class="total-container">
        <p><strong>Total Price:</strong> $<%= totalPrice %></p>
    </div>

    <!-- Place All Orders -->
    <div class="order-all-container">
        <form action="placeOrder.jsp" method="post">
            <input type="hidden" name="orderAll" value="true">
            <button type="submit" class="btn">Place All Orders</button>
        </form>
    </div>
    <a href="viewOrders.jsp" class="btn">View Your Orders</a>
    
<% } %>

</body>
</html>
