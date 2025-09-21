<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.WishlistDao, model.Watch, model.Customer, java.util.List" %>
<%
    HttpSession sessionObj = request.getSession();
    Customer user = (Customer) sessionObj.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login3.jsp");
        return;
    }

    int userId = user.getId();
    WishlistDao wishlistDao = new WishlistDao();
    List<Watch> wishlist = wishlistDao.getWishlistItems(userId);
%>


<!DOCTYPE html>
<html>
<head>
    <title>My Wishlist</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f7f7f7;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #007bff;
            font-weight: 700;
        }
        .wishlist-container {
            display: flex;
            flex-wrap: wrap;
            gap: 25px;
            justify-content: center;
        }
        .wishlist-item {
            background: #fff;
            border-radius: 12px;
            padding: 15px;
            width: 260px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .wishlist-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }
        .wishlist-item img {
            width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 10px;
        }
        .wishlist-item h5 {
            font-weight: 500;
            margin-bottom: 8px;
            color: #333;
        }
        .wishlist-item p {
            font-size: 16px;
            font-weight: 500;
            color: #555;
            margin-bottom: 12px;
        }
        .btn {
            margin: 5px 5px 0 5px;
            width: 110px;
        }
        .empty-wishlist {
            text-align: center;
            font-size: 18px;
            color: #666;
        }
    </style>
</head>
<body>
<%
    String message = (String) session.getAttribute("wishlistMessage");
    if (message != null) {
%>
    <div class="alert alert-info text-center"><%= message %></div>
<%
        session.removeAttribute("wishlistMessage"); // clear after showing
    }
%>
<div class="container my-5">
    <h2>🌟 My Wishlist</h2>

    <% if (wishlist == null || wishlist.isEmpty()) { %>
        <p class="empty-wishlist">Your wishlist is empty!</p>
        <div class="text-center">
            <a href="products.jsp" class="btn btn-primary">Shop Watches</a>
        </div>
    <% } else { %>
        <div class="wishlist-container">
            <% for (Watch w : wishlist) { %>
                <div class="wishlist-item">
                    <img src="Assets/<%= w.getImage() %>" alt="<%= w.getName() %>">
                    <h5><%= w.getName() %></h5>
                    <p>₹<%= w.getPrice() %></p>

                    <a href="addToCart.jsp?watchId=<%= w.getId() %>" class="btn btn-warning btn-sm">Add to Cart</a>
                    <a href="removeFromWishlist.jsp?watchId=<%= w.getId() %>" class="btn btn-danger btn-sm">Remove</a>
                </div>
            <% } %>
        </div>
    <% } %>
</div>
</body>
</html>
