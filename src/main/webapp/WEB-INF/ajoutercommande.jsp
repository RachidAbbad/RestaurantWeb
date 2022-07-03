<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Votre panier</title>
    <link href="CSS/sticky-footer-navbar.css" rel="stylesheet">
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/font-awesome.min.css">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery.js"></script>
</head>
<body style="height: 90vh">


<c:import url="menu.jsp">
    <c:param name="page" value="5"/>
</c:import>
<div class="mx-3" style="height: 100%">
    <div class="h4 my-5 text-center">Votre panier</div>
    <div class="d-flex flex-column align-items-center justify-content-center" style="height: 100%;">

        <% request.setAttribute("totalPrix", 0); %>
        <% request.setAttribute("totalItems", 0); %>
        <form action="index.do" method="post" style="width: 100%">

            <div class="row mx-5" style="height: 100vh">
                <div class="col-md-9" style="height: 100%">
                    <div style="height: 100%; overflow-y: auto">
                        <table class="table table-hover">
                            <tbody>
                            <c:forEach var="ligne" items="${panier}">
                                <tr>
                                    <td>
                                        <img
                                                height="80px"
                                                width="80px"
                                                class="mr-3 rounded"
                                                src="Images/${ligne.menu.image}"
                                        />
                                    </td>
                                    <td class="align-middle">
                                        <h4>${ligne.menu.titre}</h4>
                                    </td>

                                    <td class="align-middle">${ligne.menu.prix} DH</td>

                                    <c:set var="totalPrix" value="${totalPrix+(ligne.menu.prix*ligne.quantite)}"/>
                                    <td class="align-middle">Qty : ${ligne.quantite}</td>

                                    <c:set var="totalItems" value="${totalItems+ligne.quantite}"/>
                                    <td class="align-middle">Total : ${ligne.quantite*ligne.menu.prix} DH</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-3">
                    <p><b>Total Prix : </b>${totalPrix} DH</p>
                    <p><b>Total Menus : </b>${totalItems} Menus</p>
                    <button <c:if test='${totalPrix==0}'>disabled</c:if> name="action" value="Passer la commande" type="submit" class="btn-primary btn">Commander</button>
                </div>
            </div>

        </form>
    </div>
</div>
</body>
</html>