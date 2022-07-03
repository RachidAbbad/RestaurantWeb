<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
       <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Notre menus</title>
	<link href="CSS/sticky-footer-navbar.css" rel="stylesheet">
	<link rel="stylesheet" href="CSS/bootstrap.min.css">
	<link rel="stylesheet" href="CSS/font-awesome.min.css">
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery.js"></script>
	<script>
		$().ready(()=>{
			let delete1=$("button");
			delete1.on("click",(event)=>{	
				let id=event.target.value;
				$.get("index.do",{'page':4,'id':id},(data)=>{
					$('body').html(data);
				});
			})
		})
	</script>
</head>
<body style="height: 90vh">


<c:import url="menu.jsp">
	<c:param name="page" value="2"/>
</c:import>
<div class="my-3" style="height: 100%">
	<div class="d-flex flex-column justify-content-center align-items-center" style="height: 100%;">
		<div class="h4 my-5">Notre menus</div>
		<div class="row justify-content-around">
			<c:forEach var="menu" items="${model.menus}">
				<div class="col-md-4 mb-3 d-flex justify-content-center align-items-center">
					<img
							height="150px"
							width="150px"
							class="me-3 rounded"
							src="Images/${menu.image}"
					/>
					<div class="border-right pe-3">
						<h4>${menu.titre}</h4>
						<p>${menu.prix} DH</p>
						<c:if test="${isAdmin==true}">
							<a href="/RestaurantWeb-1.0-SNAPSHOT/index.do?page=8&menu=${menu.id}" class="btn-danger btn">Supprimer</a>
						</c:if>

					</div>

					<c:if test="${isAdmin==false}">
						<form method="post" action="index.do" class="d-flex flex-column ms-3" style="width: 150px">
							<div class="d-flex align-items-center mb-2">Qty : <input type="number" name="quantite" style="width: 70px" class="form-control ms-1"/></div>
							<input value="Ajouter au panier" name="action" type="submit" class="btn btn-primary" />
							<input value="${menu.id}" name="menu_id" class="d-none" />
						</form>
					</c:if>

				</div>
			</c:forEach>
		</div>
	</div>
</div>
</body>
</html>