<%@page import="model.CustomerDao"%>
<%@page import="model.Customer"%>
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
   int id=Integer.parseInt(request.getParameter("id"));
   Customer c=CustomerDao.getCustomerById(id);
   request.setAttribute("user", c);
%>
 <div class="right-section">
            <form action="updateform.jsp" method="post" class="form-container">
                <h2>Sign Up</h2>
                <input type="hidden" placeholder="Enter Your id"  name="id" value="${user.id}" >
                <input type="text" placeholder="Enter your first name"  name="fname" required value="${user.fname}">
                <input type="text" placeholder="Enter your last name" name="lname" required value="${user.lname}">
                <input type="tel" placeholder="Enter your Number" name="phone" required value="${user.phone}">
                <input type="email" id="email" name="email" placeholder="Enter Your Email" required value="${user.email}">
                 <input type="password" id="password" name="password" placeholder="Enter Your Password" required value="${user.password}">
                <label>User Type:</label>
                 
                <select name="utype" id="userType" onchange="showSubOption()">
                   <option>${user.utype }</option>
                    <option value="admin">Admin</option>
                    <option value="user">Customer</option>
                </select>

                <!-- Sub-option for Customer -->
                <div id="subOptionDiv">
                    <label>Customer Type:</label>
                    <select name="customerType">
                        <option>${user.ctype }</option>
                        <option value="buyer">Buyer</option>
                        <option value="seller">Seller</option>
                    </select>
                </div>

                <button type="submit">Submit</button>
            </form>
        </div>
</body>
</html>