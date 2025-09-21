<%@page import="model.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="c" class="model.Customer"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>
<%
   int id=Integer.parseInt(request.getParameter("id"));
   int i=CustomerDao.deleteCustomer(id);
   response.sendRedirect("view.jsp");
%>
</body>
</html>