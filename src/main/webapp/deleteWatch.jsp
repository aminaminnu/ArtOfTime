<%@ page import="model.SellerWatchDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    int sellerId = (Integer) session.getAttribute("sellerId");
    SellerWatchDao.deleteWatch(id, sellerId);
    response.sendRedirect("SellerWatch.jsp");
%>
</body>
</html>