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
	<nav id="wrapper">
		<div class="top-menu">
	        <div class="left-link">
	            <a href="/goods/store" title="굿즈스토어">굿즈스토어</a>
	            <a href="/membership/membership" title="멤버십">멤버십</a>
	            <a href="/support" title="고객센터">고객센터</a>
	        </div>
	
	        <div class="right-link">
	            <!-- 로그인전 -->
	            <% if(sessionId == null) { %>
	            <div class="before">
	                <a href="login" title="로그인">로그인</a>
	                <a href="join" title="회원가입">회원가입</a>
	            </div>
				<% } else { %> 
	            <!-- 로그인후 -->
		        <div class="after">
		            <a href="logout" title="로그아웃">로그아웃</a>
		            <a href="mypage" title="마이페이지">마이페이지</a>
	                <a href="mypage" title="예매확인/취소">예매확인/취소</a>
	            </div>
	           
	           <% } %> 
	        </div>
	        
	    </div>
	    <div class="middle-menu">
	    	<ul>
	    		<li>예매</li>
	    		<li>이벤트</li>
	    		<li>랭킹</li>
	    		<li>혜택/할인</li>
	    	</ul>
	    </div>
   </nav> 
    <div class="middle-area" style="display:none">
	    <div class="link-area">
	        <a href="#layer_sitemap" class="header-open-layer btn-layer-sitemap" title="사이트맵">사이트맵</a>
	        <a href="#layer_header_search" class="header-open-layer btn-layer-search" title="검색">검색</a>
	        <a href="/booking/timetable" class="link-ticket" title="상영시간표">상영시간표</a>
	        <a href="#layer_mymega" class="header-open-layer btn-layer-mymega" title="나의 메가박스">나의 메가박스</a>
	    </div>
           <li class=""><a href="/movie" class="gnb-txt-movie" title="영화">영화</a>
                <div class="gnb-depth2">
                    <ul>
                        <li><a href="/movie" title="전체영화">전체영화</a></li>


                        <li><a href="/curation/specialcontent" title="큐레이션">큐레이션</a></li>
                        
                        <li id="festivalArea" style="display: none;"><a href="/festival" title="영화제">영화제</a></li>
                        <li><a href="/moviepost/all" title="무비포스트">무비포스트</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="/booking" class="gnb-txt-reserve" title="예매">예매</a>
                <div class="gnb-depth2">
                    <ul>
                        <li><a href="/booking" title="빠른예매">빠른예매</a></li>
                        <li><a href="/booking/timetable" title="상영시간표">상영시간표</a></li>
                        <li><a href="/booking/privatebooking" title="더 부티크 프라이빗 예매">더 부티크 프라이빗 예매</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="/theater/list" class="gnb-txt-theater" title="극장">극장</a>
                <div class="gnb-depth2">
                    <ul>
                        <li><a href="/theater/list" title="전체극장">전체극장</a></li>
                        <li><a href="/specialtheater/list" title="특별관">특별관</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="javascript:void(0)" onclick="NetfunnelChk.aTag('EVENT_LIST','/event');return false;" class="gnb-txt-event" title="이벤트">이벤트</a>
                <div class="gnb-depth2">
                    <ul>
                        <li><a href="javascript:void(0)" onclick="NetfunnelChk.aTag('EVENT_LIST','/event');return false;" title="진행중 이벤트">진행중 이벤트</a></li>
                        <li><a href="javascript:void(0)" onclick="NetfunnelChk.aTag('EVENT_LIST','/event/end');return false;" title="지난 이벤트">지난 이벤트</a></li>
                        <li><a href="javascript:void(0)" onclick="NetfunnelChk.aTag('EVENT_LIST','/event/winner/list');return false;" title="당첨자발표">당첨자발표</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="javascript:void(0)" onclick="NetfunnelChk.aTag('STORE_LIST','/store');return false;" class="gnb-txt-store" title="스토어">스토어</a></li>
            <li><a href="/benefit/membership" class="gnb-txt-benefit" title="혜택">혜택</a>
                <div class="gnb-depth2">
                    <ul>
                        <li><a href="/benefit/membership" title=" 멤버십">멤버십</a></li>
                        <li><a href="/benefit/discount/guide" title="제휴/할인">제휴/할인</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
    
	
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