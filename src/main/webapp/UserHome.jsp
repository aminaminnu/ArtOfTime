<%@page import="model.CustomerDao"%>
<%@page import="model.Customer"%>
<%@page import="java.util.List"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<div class="container mt-4">
        <h2 class="text-center">User Dashboard</h2>
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Password</th>
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
                        <td>${c.password}</td>
                        <td>${c.ctype}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>