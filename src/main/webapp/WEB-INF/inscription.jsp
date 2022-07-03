<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Inscription</title>

    <!-- Bootstrap core CSS -->
    <link href="CSS/bootstrap.min.css" rel="stylesheet">

    <meta name="theme-color" content="#7952b3">


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="CSS/signin.css" rel="stylesheet">
</head>
<body class="text-center">

<main class="form-signin">
    <form method="post" action="index.do">
        <h1 class="h3 mb-3 fw-normal">Inscription</h1>

        <div class="form-floating">
            <input type="text" name="nom" class="form-control" id="nom" placeholder="Nom">
            <label for="nom">Nom</label>
        </div>
        <div class="form-floating">
            <input type="text" name="prenom" class="form-control" id="prenom"  placeholder="Prenom">
            <label for="prenom">Prénom</label>
        </div>
        <div class="form-floating">
            <input type="email" name="email" class="form-control" id="email" placeholder="Email">
            <label for="email">Email</label>
        </div>
        <div class="form-floating">
            <input type="password" name="password" class="form-control" id="password" placeholder="Mot de passe">
            <label for="password">Mot de passe</label>
        </div>


        <button class="w-100 btn btn-lg btn-primary" name="action" value="inscription" type="submit">Inscripiton</button>
        <p class="mt-5 mb-3 text-muted">&copy; 2021–2022</p>
    </form>
</main>
</body>
</html>