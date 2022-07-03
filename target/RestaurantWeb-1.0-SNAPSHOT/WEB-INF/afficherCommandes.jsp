<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Votre commandes</title>
    <link href="CSS/sticky-footer-navbar.css" rel="stylesheet">
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/font-awesome.min.css">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery.js"></script>
</head>
<body style="height: 90vh">


<c:import url="menu.jsp">
    <c:param name="page" value="6"/>
</c:import>
<div class="container" style="height: 100%">
    <div class="d-flex flex-column align-items-center justify-content-center" style="height: 100%;">
        <div class="h4 my-5 ">Votre Commandes</div>

                    <% request.setAttribute("totalPrix", 0); %>
                    <% request.setAttribute("totalItems", 0); %>
                    <div style="height: 100%; overflow-y: auto">

                        <table class="table table-light table-hover w-100">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Libelle</th>
                                <th scope="col">Total Menus</th>
                                <th scope="col">Total Prix</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="cmd" items="${commandes}">
                                <tr>
                                    <td>${cmd.id}</td>
                                    <td>${cmd.libelle}</td>

                                <c:forEach var="ligne" items="${cmd.commandes}">
                                    <c:set var="totalPrix" value="${totalPrix+(ligne.menu.prix*ligne.quantite)}"/>


                                    <c:set var="totalItems" value="${totalItems+ligne.quantite}"/>

                                </c:forEach>
                                    <td>${totalItems}</td>
                                    <td>${totalPrix} DH</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
    </div>
</div>
</body>
</html>
