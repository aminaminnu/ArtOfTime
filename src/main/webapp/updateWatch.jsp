<%@ page import="model.SellerWatchDao, model.SellerWatch" %>
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
    SellerWatch watch = SellerWatchDao.getWatchesBySeller(id).get(0); // Assuming single watch
%>
<form action="saveWatchUpdate.jsp" method="post">
    <input type="hidden" name="id" value="<%= watch.getId() %>">
    
    <label>Watch Name:</label>
    <input type="text" name="name" value="<%= watch.getWatchname() %>" required><br>

    <label>Brand:</label>
    <input type="text" name="brand" value="<%= watch.getBrand() %>" required><br>
    <label>Condition:</label>
    <select name="condition" required>
        <option value="New" <%= watch.getWatchcondition().equals("New") ? "selected" : "" %>>New</option>
        <option value="Old" <%= watch.getWatchcondition().equals("Old") ? "selected" : "" %>>Old</option>
        
    </select><br>

    <label>Price:</label>
    <input type="number" step="0.01" name="price" value="<%= watch.getPrice() %>" required><br>

    

    <button type="submit">Update</button>
</form>
</body>
</html>