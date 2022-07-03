<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Votre profile</title>
    <link href="CSS/sticky-footer-navbar.css" rel="stylesheet">
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/font-awesome.min.css">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery.js"></script>

</head>
<body style="height: 90vh">


<c:import url="menu.jsp">
    <c:param name="page" value="9"/>
</c:import>
<div class="my-3" style="height: 100%">
    <div class="d-flex flex-column justify-content-center align-items-center" style="height: 100%;">
        <div class="h4 my-5">Profile</div>
        <div class="row justify-content-around">
            <img class="col-md-4" src="Images/avatar.png"/>
            <div class="col-md-8">
                <div class="form-floating mb-2">
                    <input type="text" name="nom" disabled value="${client.nom}" class="form-control disabled" id="nom" placeholder="Nom">
                    <label for="nom">Nom</label>
                </div>
                <div class="form-floating mb-2">
                    <input type="text" name="prenom" disabled value="${client.prenom}" class="form-control" id="prenom"  placeholder="Prenom">
                    <label for="prenom">Prénom</label>
                </div>
                <div class="form-floating mb-2">
                    <input type="email" name="email" disabled value="${client.email}" class="form-control" id="email" placeholder="Email">
                    <label for="email">Email</label>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>