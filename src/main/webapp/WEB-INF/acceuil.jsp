<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="theme-color" content="#7952b3">
    <link href="CSS/sticky-footer-navbar.css" rel="stylesheet">
    <link rel="stylesheet" href="CSS/bootstrap.min.css"/>
    <script src="js/bootstrap.min.js"/>
    <script src="js/jquery.js"/>
</head>
<body  class="d-flex flex-column h-100">

    <c:import url="barremenu.jsp">
    	<c:param name="page" value="1"/>
    </c:import>

</body>
</html>