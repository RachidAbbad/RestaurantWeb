<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
  <nav class="navbar navbar-expand-md navbar-dark  bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="index.do">Sigl Restau</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link <c:if test='${ param.page==1}'>active</c:if>"  aria-current="page" href="index.do?page=1" >Ajouter Menu</a>
          </li>
          <li class="nav-item">
            <a class="nav-link  <c:if test='${ param.page==2}'>active</c:if>" href="index.do?page=2">Menus</a>
          </li>
          <li class="nav-item">
            <a class="nav-link  <c:if test='${ param.page==5}'>active</c:if>" href="index.do?page=2">Panier</a>
          </li>
          <li class="nav-item">
            <a class="nav-link  <c:if test='${ param.page==6}'>active</c:if>" href="index.do?page=2">Commandes</a>
          </li>

        </ul>
        <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">FSearch</button>
        </form>
      </div>
    </div>
  </nav>
</header>