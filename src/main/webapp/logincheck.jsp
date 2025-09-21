<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Customer, model.CustomerDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Processing</title>
</head>
<body>
<%
    // Fetching email and password from login form
    String email = request.getParameter("email");
    String pass = request.getParameter("password");

    // Check if the login credentials are correct
    Customer c = CustomerDao.checkLogin(email, pass);

    if (c != null && c.getId() != 0) {
        // Prevent session fixation attacks by invalidating the session first
        session.invalidate();
        session = request.getSession(true);

        // Store user info in the session
        session.setAttribute("user", c);           // Store the Customer object
        session.setAttribute("userId", c.getId());  // Store the user's ID
        session.setAttribute("userType", c.getUtype()); // Store the user type (admin, seller, etc.)
        session.setAttribute("userEmail", email);    // Store the user's email

        // Redirect based on user type (admin, seller, or buyer)
        if ("admin".equalsIgnoreCase(c.getUtype())) {
            response.sendRedirect("AdminHome.jsp");  // Admin home page
        } else if ("seller".equalsIgnoreCase(c.getUtype())) {
            response.sendRedirect("SellerHome.jsp"); // Redirect seller to their home page
        } else if ("buyer".equalsIgnoreCase(c.getUtype())) {
            response.sendRedirect("BuyerHome.jsp"); // Redirect buyer to their home page
        } else {
            response.sendRedirect("UserHome.jsp"); // Redirect to a default page if the user type is unexpected
        }
    } else {
        // Invalid credentials, set an error message and forward to login page
        request.setAttribute("errorMessage", "Invalid email or password.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>
</body>
</html>
