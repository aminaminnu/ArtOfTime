<%@ page import="java.math.BigDecimal, model.SellerWatch, model.SellerWatchDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Watch</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('Assets/loginsample.jpg'); /* Change to your actual image path */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .content-wrapper {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 30px 40px;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 900px;
        }

        h2 {
            text-align: center;
            color: #800000;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 12px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: #800000;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        button {
            padding: 10px 16px;
            background-color: #800000;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
        }

        button:hover {
            background-color: #a10000;
        }

        p {
            color: red;
            text-align: center;
            font-weight: bold;
        }
        .center-button {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .btn {
        padding: 10px 20px;
        background-color: #800000;
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
    }

    .btn:hover {
        background-color: #a10000;
    }
    </style>
</head>
<body>
<div class="content-wrapper">
<%
    Integer sellerId = (Integer) session.getAttribute("userId");
    String customerType = (String) session.getAttribute("customerType");

    if (sellerId == null || !"seller".equalsIgnoreCase(customerType)) {
%>
    <div style="text-align: center; margin-top: 20px;">
    <p style="color:red; font-weight: bold;">You need to log in as a seller to add a watch.</p>
    <form action="login2.jsp" method="GET">
    <div class="center-button">
        <button type="submit" style="padding: 10px 20px; background-color: #800000; color: white; border: none; border-radius: 8px; cursor: pointer;">
            Login
        </button>
</div>
    </form>
</div>
<%
        return;
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String watchname = request.getParameter("watchname");
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        String watchcondition = request.getParameter("watchcondition");
        BigDecimal price = new BigDecimal(request.getParameter("price"));

        SellerWatch watch = new SellerWatch();
        watch.setSellerid(sellerId);
        watch.setWatchname(watchname);
        watch.setBrand(brand);
        watch.setModel(model);
        watch.setWatchcondition(watchcondition);
        watch.setPrice(price);

        int status = SellerWatchDao.addWatch(watch);

        if (status > 0) {
            response.sendRedirect("addWatch.jsp?status=success");
        } else {
            response.sendRedirect("addWatch.jsp?status=fail");
        }
    }
%>

<%
    String status = request.getParameter("status");
    if ("success".equals(status)) {
%>
    <p class="success">Watch added successfully!</p>
<%
    } else if ("fail".equals(status)) {
%>
    <p class="error">Failed to add watch. Please try again.</p>
<%
    }
%>

<h2>Add a Watch</h2>
<form action="addWatch.jsp" method="POST">
    <label for="watchname">Watch Name:</label>
    <input type="text" name="watchname" required>

    <label for="brand">Brand:</label>
    <input type="text" name="brand" required>

    <label for="model">Model:</label>
    <input type="text" name="model" required>

    <label for="watchcondition">Condition:</label>
    <input type="text" name="watchcondition" required>

    <label for="price">Price:</label>
    <input type="text" name="price" pattern="^\d+(\.\d{1,2})?$" title="Enter a valid price" required>

    <input type="submit" value="Add Watch">
</form>

<form action="logout.jsp" method="post">
    <button type="submit">Logout</button>
</form>
</div>
</body>
</html>
