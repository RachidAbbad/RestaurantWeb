<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#7952b3">
    <title>Ajouter un menu</title>
    <link href="CSS/sticky-footer-navbar.css" rel="stylesheet">
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/font-awesome.min.css">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery.js"></script>
    <script>
        /* Cette fonction permet d'afficher une vignette pour chaque image sélectionnée */
        function readFilesAndDisplayPreview(files) {
            let imageList = document.querySelector('#list');
            imageList.innerHTML = "";

            for (let file of files) {
                let reader = new FileReader();

                reader.addEventListener("load", function (event) {
                    let span = document.createElement('span');
                    span.innerHTML = '<img height="60" src="' + event.target.result + '" />';
                    imageList.appendChild(span);
                });

                reader.readAsDataURL(file);
            }
        }
    </script>

</head>
<body style="height: 90vh">


<c:import url="menu.jsp">
    <c:param name="page" value="1"/>
</c:import>
<div class="container" style="height: 100%">
    <div class="d-flex flex-column align-items-center justify-content-center" style="height: 100%;">

        <div class="row">
            <div class="col-md-6">
                <div class="h4 mb-5">Ajouter un menu</div>
                <form method="post" enctype="multipart/form-data" class="text-end">
                    <table>
                        <tr>
                            <td class="p-3"><label for="titre">Titre:</label></td>
                            <td class="p-3"><input type="text" name="titre" id="titre" class="form-control"/></td>
                        </tr>
                        <tr>
                            <td class="p-3"><label for="description">Discription:</label></td>
                            <td class="p-3"><textarea rows="" cols="" name="description" id="description"
                                                      class="form-control"></textarea></td>
                        </tr>
                        <tr>
                            <td class="p-3"><label for="prix">Prix:</label></td>
                            <td class="p-3"><input type="number" name="prix" id="prix" class="form-control"/></td>
                        </tr>
                        <tr>
                            <td class="p-3"><label for="cat">Categorie:</label></td>
                            <td class="p-3">
                                <select name="cat" id="cat" class="form-control">
                                    <c:forEach var="cat" items="${categories}">
                                        <option value="${cat.id}">${cat.titre}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="p-3"><label for="image">Image:</label></td>
                            <td class="p-3"><input type="file" name="image" id="image"
                                                   onchange="readFilesAndDisplayPreview(this.files);"
                                                   class="form-control"/>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" name="action" value="Enregistrer le menu" class="btn btn-primary m-2"/>
                </form>
            </div>
            <div class="col-md-6">
                <div class="h4 mb-5">Ajouter une categorie</div>
                <form method="post" enctype="multipart/form-data" class="text-end">
                    <table>
                        <tr>
                            <td class="p-3"><label for="nomcat">Nom categorie:</label></td>
                            <td class="p-3"><input type="text" name="nomcat" id="nomcat" class="form-control"/></td>
                        </tr>
                    </table>
                    <input type="submit" name="action" value="Enregistrer categorie" class="btn btn-primary m-2"/>
                </form>
            </div>
        </div>

    </div>
</div>
</body>
</html>