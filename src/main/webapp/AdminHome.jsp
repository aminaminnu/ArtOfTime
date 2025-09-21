<%@page import="model.CustomerDao"%>
<%@page import="model.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>
</head>
<body>
<%
    Customer admin = (Customer) session.getAttribute("user");
    if (admin == null || !"admin".equals(admin.getUtype())) {
        response.sendRedirect("login.jsp");
        return;
    }

    List <Customer> li = CustomerDao.getAllCustomers("admin", 0);
    request.setAttribute("clist", li);
%>

<div class="container mt-4">
        <h2 class="text-center">Admin Panel - Customer List</h2>
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Phone</th>
                    <th>User Type</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Customer Type</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="c" items="${clist}">
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.fname}</td>
                        <td>${c.lname}</td>
                        <td>${c.phone}</td>
                        <td>${c.utype}</td>
                        <td>${c.email}</td>
                        <td>${c.password}</td>
                        <td>${c.ctype}</td>
                        <td><a href="editform.jsp?id=${c.id}" class="btn btn-info btn-sm">Edit</a></td>
                        <td><a href="deleteform.jsp?id=${c.id}" class="btn btn-danger btn-sm">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <div class="text-center mt-3">
        <a href="signup.jsp" class="btn btn-success">New Registration</a>
    </div>
</body>
</html>