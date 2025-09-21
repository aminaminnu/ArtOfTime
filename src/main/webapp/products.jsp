<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, model.Watch, model.WatchDAO" %>

<%
    WatchDAO watchDAO = new WatchDAO();
    List<Watch> watches = watchDAO.getAllWatches();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Luxury Watches</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #fff;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        }
        .product-card {
            border: none;
            text-align: center;
            padding: 20px;
            transition: transform 0.3s;
        }
        .product-card:hover {
            transform: translateY(-5px);
        }
        .product-card img {
            max-height: 220px;
            object-fit: contain;
            margin-bottom: 15px;
        }
        .product-title {
            font-size: 16px;
            font-weight: 600;
            letter-spacing: 1px;
            text-transform: uppercase;
        }
        .product-price {
            font-size: 18px;
            font-weight: 500;
            margin: 5px 0 10px;
        }
        .actions {
            margin-top: 10px;
        }
        .action-link {
            display: block;
            text-align: center;
            margin: 5px 0;
            font-weight: bold;
            color: #b71c1c; /* deep red */
            text-decoration: none;
            font-size: 15px;
        }
        .action-link:hover {
            color: #d32f2f;
            text-decoration: underline;
        }
        form .action-link {
            background: none;
            border: none;
            padding: 0;
            cursor: pointer;
            width: 100%; /* match <a> width */
        }
        .top-bar {
            background-color: white;
            border-bottom: 2px solid #eee;
            padding: 12px 20px;
        }
    </style>
</head>
<body>

    <!-- Sticky Top Navbar -->
    <div class="top-bar d-flex justify-content-between align-items-center sticky-top">
        <h4 class="m-0">⌚ Luxury Watches</h4>
        <a href="cart.jsp" class="btn btn-outline-danger fw-bold">🛒 View Cart</a>
    </div>

    <div class="container my-4">
        <div class="row g-4">
            <% for (Watch watch : watches) { %>
            <div class="col-md-4 col-lg-3">
                <div class="product-card">
                    <img src="<%= request.getContextPath() %>/Assets/<%= watch.getImage() %>" alt="Watch Image">
                    <div>
                        <p class="product-title"><%= watch.getName() %></p>
                        <p class="text-muted">Brand: <%= watch.getBrand() %></p>
                        <p class="product-price">₹<%= watch.getPrice() %></p>

                        <!-- Aligned Action Links -->
                        <div class="actions">
                            <a href="addToCart.jsp?watchId=<%= watch.getId() %>" class="action-link">➕ ADD TO CART</a>
                            
                            <form action="placeOrder.jsp" method="POST" class="m-0 p-0">
                                <input type="hidden" name="watchId" value="<%= watch.getId() %>">
                                <input type="hidden" name="quantity" value="1">
                                <button type="submit" class="action-link">⚡ BUY NOW</button>
                            </form>
                             <!-- Wishlist Button -->
     <a href="addToWishlist.jsp?watchId=<%= watch.getId() %>" class="action-link">❤️ ADD TO WISHLIST</a>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
