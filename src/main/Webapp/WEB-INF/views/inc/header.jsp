<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
	<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<title>sEEvisit</title>

</head>

<body>
	<% 
		String sessionId = (String) session.getAttribute("memberId");
		//로그인중이라면 로그인한 아이디가 저장되고 비로그인 중이면 sessionId==null 임
	%>
	<nav>
		<div class="top-menu">
	         <div class="basic_lo">
	            <!-- 로그인전 -->
	            <% if(sessionId == null) { %>
	           
	                <a href="login" title="로그인">로그인</a>
	                <a href="join" title="회원가입">회원가입</a>
	           
				<% } else { %> 
	            <!-- 로그인후 -->
		            <a><%= sessionId %>님 <i class="material-icons" style="font-size: 16px;">face</i></a>
		            <a href="logout" title="로그아웃">로그아웃</a>
		            <a href="mypage" title="내정보수정">내정보수정</a>
	                <a href="ticketConfirm" title="예매확인/취소">예매확인/취소</a>
	                
	           
	           
	           <% } %> 
	        
	          		<a href="/support" title="고객센터">고객센터</a>
	       </div>
	    </div>
	    <div class="middle-menu">
	    	<div class="basic_lo">
			    <a class="logo" href="/" ><img src="${pageContext.request.contextPath}/resources/image/logo5.jpg" ></a>
			    	<ul>
			    		<li><a href="showlist">예매</a></li>
			    		<li><a href="event">이벤트</a></li>
			    		<li><a href="void(0);" onclick="alert('준비중입니다.');return false;">랭킹</a></li>
			    		<li><a href="void(0);" onclick="alert('준비중입니다.');return false;">
혜택/할인</a></li>
			    	</ul>
			    	<!-- 검색 -->
			    	<div class="menutop_search dodbogi" >
			    	 	<a  href="boardList"><i class="material-icons" style="font-size: 24px;">search</i></a>
			    	</div>
			    	<!-- //검색 -->
		    </div>
		   <!--  <div>
		    	<li><i class="material-icons">calendar_month</i></li>
		    </div> -->
	    </div>
   </nav> 
   
    
	
	<nav class="navbar navbar-expand-lg bg-light" style="display:none">
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
	              <a class="nav-link" href="event">이벤트</a>
	            </li>
	            <li class="nav-item">
	            <% if(sessionId == null) { %>
	              <a class="nav-link" sec:authorize="isAnonymous()"  href="login">
	              	로그인
	              </a>
	             <% } else { %> 
	              <a class="nav-link" sec:authorize="isAuthenticated()" href="logout">로그아웃</a>
	             <% } %> 
	            </li>
	            <% if(sessionId == null) { %>
	            <li class="nav-item">
             		<a class="nav-link" sec:authorize="isAnonymous()"  href="join">회원가입</a>
          		</li>
          		<% } else { %> 
          		<li class="nav-item">
             		<a class="nav-link" sec:authorize="isAnonymous()"  href="mypage">예매확인/취소</a>
          		</li>
          		<li class="nav-item">
             		<a class="nav-link" sec:authorize="isAnonymous()"  href="mypage">마이페이지</a>
          		</li>
          		<% } %>	
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