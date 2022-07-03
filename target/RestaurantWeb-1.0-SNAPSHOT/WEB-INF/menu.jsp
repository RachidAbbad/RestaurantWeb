<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
  <nav class="navbar navbar-expand-md navbar-dark  bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="index.do">SIGL Resataurant</a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <c:if test='${isAdmin==true}'>
            <li class="nav-item">
              <a class="nav-link <c:if test='${ param.page==1}'>active</c:if>"  aria-current="page" href="index.do?page=1" >Ajouter Menu</a>
            </li>

          </c:if>
          <li class="nav-item">
            <a class="nav-link  <c:if test='${ param.page==2}'>active</c:if>" href="index.do?page=2">Menus</a>
          </li>
          <c:if test='${isAdmin==false}'>
            <li class="nav-item">
              <a class="nav-link  <c:if test='${ param.page==5}'>active</c:if>" href="index.do?page=5">Panier</a>
            </li>
            <li class="nav-item">
              <a class="nav-link  <c:if test='${ param.page==6}'>active</c:if>" href="index.do?page=6">Commandes</a>
            </li>
          </c:if>
          <li class="nav-item">
            <a class="nav-link  <c:if test='${ param.page==9}'>active</c:if>" href="index.do?page=9">Profil</a>
          </li>
        </ul>

        <form method="post" action="index.do" class="d-flex">
          <input class="form-control me-2" name="search" type="search" placeholder="Search" aria-label="Search">
          <input type="submit" class="btn btn-outline-success" name="action" value="search" />
        </form>
        <span class="mx-1" style="color:white"><b>${sessionScope.login }</b></span>
        <a href="index.do?page=3"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
          <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
          <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
        </svg></a>
      </div>
    </div>
  </nav>
</header>