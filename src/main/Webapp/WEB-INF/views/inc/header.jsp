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

<!--     Modal popup     -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js" integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<title>sEEvisit</title>

</head>

<body>

			<!-- Modal -->
				<div class="modal fade" id="ourModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="ourModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered modal-lg">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="ourModalLabel">메일 문의</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				       	<form action="">
				       		<div class="mb-3">
				       			<label for="yourName" class="form-label">이름</label>
				       			<input type="text" id="yourName" class="form-control" placeholder="이름을 입력해주세요">
				       		</div>
				       		<div class="row">
				       			<div class="col-md-6 mb-3">
				       				<label for="yourPhone" class="form-label">연락처</label>
				       				<input type="tel"  id="yourPhone" class="form-control" placeholder="ex)010-1234-5678">
				       			</div>
				       			<div class="col-md-6 mb-3">
				       				<label for="yourEmail" class="form-label">이메일</label>
				       				<input type="email"  id="yourEmail" class="form-control" placeholder="ex)you@email.com">
				       			</div>
				       		</div>
				       			<div class="mb-3">
				       				<label for="yourTextarea" class="form-label">문의내용</label>
				       				<textarea rows="3" cols="30" name="" id="yourTextarea" class="form-control" placeholder="문의 내용을 입력해 주세요"></textarea>
				       			</div>
				       			<div class="form-check mb-3">
				       				<input type="checkbox" id="yourFormCheck" class="form-check-input">
				       				<label for="yourFormCheck" class="form-check-label">
				       					개인정보 확인
				       				</label>
				       			</div>
				       			<button class="btn btn-secondary" type="submit">메일전송</button>
				       	</form>
				       
				      </div>
				    </div>
				  </div>
				</div>
				<!--// Modal -->
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
		            <a href="memberDelete" title="회원탈퇴">회원탈퇴</a>
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
			    		<li><a href="ranking">랭킹</a></li>
			    		<li><a href="guide">이용안내</a></li>
			    		<li><a data-bs-toggle="modal" data-bs-target="#ourModal">메일문의</a></li>
			    	</ul>
			    	<!-- 검색 -->
			    	<div class="menutop_search dodbogi" >
			    	<div class="input-search"><input class="search__input" type="text" name="searchKey" placeholder="Search" onclick="location.href='boardList' " style="cursor: pointer;"></div>
			    	 <!--  	<a  href="boardList"><i class="material-icons" style="font-size: 24px;">search</i></a>-->
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