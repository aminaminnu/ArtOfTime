<%@ page import="model.CustomerDao" %>
<%@ page import="model.Customer" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>WatchStore | User Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f9f9f9;
        }
        .navbar {
            background-color: #222;
        }
        .navbar-brand {
            font-weight: bold;
            color: #fff !important;
        }
        .dashboard-title {
            margin-top: 30px;
            margin-bottom: 20px;
            color: #333;
        }
        .table th {
            background-color: #343a40;
            color: white;
        }
        .table td {
            vertical-align: middle;
        }
        footer {
            background-color: #222;
            color: #ccc;
            padding: 15px 0;
            margin-top: 50px;
            text-align: center;
        }
    </style>
</head>
<body>

<%
    Customer user = (Customer) session.getAttribute("user");
    if (user == null || !"user".equals(user.getUtype())) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Customer> li = CustomerDao.getAllCustomers("user", user.getId());
    request.setAttribute("clist", li);
%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="#"><i class="fa-solid fa-clock"></i> WatchStore</a>
    </div>
</nav>

<div class="container">
    <h2 class="text-center dashboard-title">Welcome, ${user.fname}! Here’s your dashboard.</h2>

    <div class="table-responsive">
        <table class="table table-striped table-bordered shadow-sm">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <!-- <th>Password</th> -->
                    <th>Customer Type</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="c" items="${clist}">
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.fname}</td>
                        <td>${c.lname}</td>
                        <td>${c.phone}</td>
                        <td>${c.email}</td>
                        <!-- <td>${c.password}</td> --> <!-- Don't display passwords -->
                        <td>${c.ctype}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Footer -->
<footer>
    <div class="container">
        &copy; 2025 WatchStore. All rights reserved.
    </div>
</footer>

<!-- Bootstrap JS (Optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
