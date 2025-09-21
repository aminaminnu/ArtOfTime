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
    String email = request.getParameter("email");
    String pass = request.getParameter("password");

    Customer c = CustomerDao.checkLogin(email, pass);

    // Debugging prints
  if (c != null) {
    out.println("<p>Customer ID: " + c.getId() + "</p>");
    out.println("<p>User Type (utype): " + c.getUtype() + "</p>");
    out.println("<p>Customer Type (ctype): " + c.getCtype() + "</p>");
} else {
    out.println("<p>CustomerDao.checkLogin() returned null.</p>");
}

if (c != null && c.getId() != 0 && "user".equalsIgnoreCase(c.getUtype()) && "buyer".equalsIgnoreCase(c.getCtype())) {
    session.invalidate();
    session = request.getSession(true);

    session.setAttribute("user", c);
    session.setAttribute("userId", c.getId());
    session.setAttribute("userType", c.getUtype());
    session.setAttribute("customerType", c.getCtype());
    session.setAttribute("userEmail", email);

    response.sendRedirect("cart.jsp");
} else {
    request.setAttribute("errorMessage", "Invalid seller credentials.");
    request.getRequestDispatcher("login3.jsp").forward(request, response);
}

%>


</body>
</html>
