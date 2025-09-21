<%@ page import="java.util.List, model.SellerWatch, model.SellerWatchDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Watches</title>
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
    <h2>My Watches</h2>

    <%
        Integer sellerId = (Integer) session.getAttribute("userId");
        if (sellerId == null) {
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
        } else {
            List<SellerWatch> watchList = SellerWatchDao.getWatchesBySeller(sellerId);
            if (watchList.isEmpty()) {
                out.println("<p>No watches added yet.</p>");
            } else {
    %>
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Condition</th>
                        <th>Price</th>
                    </tr>
    <%
                for (SellerWatch watch : watchList) {
    %>
                    <tr>
                        <td><%= watch.getId() %></td>
                        <td><%= watch.getWatchname() %></td>
                        <td><%= watch.getBrand() %></td>
                        <td><%= watch.getModel() %></td>
                        <td><%= watch.getWatchcondition() %></td>
                        <td><%= watch.getPrice() %></td>
                    </tr>
    <%
                }
            }
        }
    %>
                </table>
                </div>

</html>
