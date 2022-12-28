<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet" >
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
	<!--     Fonts and icons     -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<title>menu</title>


</head>
<body>
	<nav class="navbar navbar-expand-lg bg-light">
	      <div class="container-fluid">
	        <a class="navbar-brand" href="/">Seevisit</a>
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
	          <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
	          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	            <li class="nav-item">
	              <a class="nav-link active" aria-current="page" href="#">예매</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="#">스토어</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" sec:authorize="isAnonymous()"  th:href="@{/login}">로그인</a>
	              <a class="nav-link" sec:authorize="isAuthenticated()" th:href="@{/logout}">로그아웃</a>
	            </li>
	            <li class="nav-item">
             		<a class="nav-link" sec:authorize="isAnonymous()" th:href="@{/join}">회원가입</a>
          		</li>
	          </ul>
	          <form class="d-flex" role="search">
	            <input class="form-control me-2" type="search" placeholder="Search" aria-label="검색해주세요">
	            <button class="btn btn-outline-success" type="submit">search</button>
	          </form>
	        </div>
	      </div>
    </nav>
</body>
</html>