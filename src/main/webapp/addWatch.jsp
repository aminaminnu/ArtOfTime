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
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(10px);
        padding: 30px 40px;
        border-radius: 16px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
        width: 90%;
        max-width: 600px;
    }

    h2 {
        text-align: center;
        color: #800000;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .form-container {
        display: flex;
        flex-direction: column;
        gap: 15px;
        margin-top: 20px;
    }

    .form-group {
        display: flex;
        flex-direction: column;
    }

    .form-group label {
        margin-bottom: 6px;
        font-weight: bold;
        color: #800000;   /* 🔥 Changed to maroon */
    }

    .form-group input,
    .form-group select {
        padding: 10px 14px;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 15px;
        transition: 0.3s;
    }

    .form-group input:focus,
    .form-group select:focus {
        border-color: #800000;
        outline: none;
        box-shadow: 0 0 6px rgba(128,0,0,0.4);
    }

    .center-button {
        display: flex;
        justify-content: center;
        margin-top: 15px;
    }

    .btn {
        padding: 10px 20px;
        background-color: #800000;
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-weight: 600;
        transition: 0.3s;
    }

    .btn:hover {
        background-color: #a10000;
        transform: scale(1.05);
    }

    .success {
        color: #800000;   /* 🔥 Success now maroon */
        background: #f8eaea;
        padding: 10px;
        border-radius: 6px;
        margin-bottom: 10px;
        text-align: center;
        font-weight: bold;
    }

    .error {
        color: #800000;   /* 🔥 Error also maroon */
        background: #fce0e0;
        padding: 10px;
        border-radius: 6px;
        margin-bottom: 10px;
        text-align: center;
        font-weight: bold;
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
        <p class="error">You need to log in as a seller to add a watch.</p>
        <form action="login2.jsp" method="GET">
            <div class="center-button">
                <button type="submit" class="btn">Login</button>
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
    <p class="success">✅ Watch added successfully!</p>
<%
    } else if ("fail".equals(status)) {
%>
    <p class="error">❌ Failed to add watch. Please try again.</p>
<%
    }
%>

<h2>Add a Watch</h2>
<form action="addWatch.jsp" method="POST" class="form-container">
    <div class="form-group">
        <label for="watchname">Watch Name</label>
        <input type="text" name="watchname" placeholder="Enter watch name" required>
    </div>

    <div class="form-group">
        <label for="brand">Brand</label>
        <input type="text" name="brand" placeholder="Enter brand name" required>
    </div>

    <div class="form-group">
        <label for="model">Model</label>
        <input type="text" name="model" placeholder="Enter model number" required>
    </div>

    <div class="form-group">
        <label for="watchcondition">Condition</label>
        <select name="watchcondition" required>
            <option value="" disabled selected>Select condition</option>
            <option value="New">New</option>
            <option value="Like New">Like New</option>
            <option value="Used">Used</option>
            <option value="Vintage">Vintage</option>
        </select>
    </div>

    <div class="form-group">
        <label for="price">Price (₹)</label>
        <input type="text" name="price" placeholder="Enter price" 
               pattern="^\d+(\.\d{1,2})?$" title="Enter a valid price" required>
    </div>

    <div class="center-button">
        <button type="submit" class="btn">➕ Add Watch</button>
    </div>
</form>

<form action="logout.jsp" method="post" style="text-align:center; margin-top:15px;">
    <button type="submit" class="btn" style="background-color:#333;">Logout</button>
</form>
</div>
</body>
</html>
