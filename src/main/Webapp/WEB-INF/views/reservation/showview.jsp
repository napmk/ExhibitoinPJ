<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/resources/css/test.css" rel="stylesheet" >
<title>예약뷰페이지</title>
</head>
<script type="text/javascript">    
	$(".star").on('click',function(){
	   var idx = $(this).index();
	   $(".star").removeClass("on");
	     for(var i=0; i<=idx; i++){
	        $(".star").eq(i).addClass("on");
	   }
	 });</script>
<body>
<%@ include file="../inc/header.jsp" %>
	<div id="wrapper">
	 <h4>뮤지컬 〈물랑루즈!〉 아시아 초연 (Moulin Rouge! The Musical)</h4>
	 <div>
	 <style>
	 	*{margin:0; padding:0;}
		.star{
		  display:inline-block;
		  width: 30px;height: 60px;
		  cursor: pointer;
		}
		.star_left{
		  background: url(https://cdn-icons.flaticon.com/png/512/2550/premium/2550223.png?token=exp=1658206826~hmac=853093603ce7f8188af247e705aef276) no-repeat 0 0; 
		  background-size: 60px; 
		  margin-right: -3px;
		}
		.star_right{
		  background: url(https://cdn-icons.flaticon.com/png/512/2550/premium/2550223.png?token=exp=1658206826~hmac=853093603ce7f8188af247e705aef276) no-repeat -30px 0; 
		  background-size: 60px; 
		  margin-left: -3px;
		}
		.star.on{
		  background-image: url(https://cdn-icons.flaticon.com/png/512/2550/premium/2550357.png?token=exp=1658206869~hmac=205ea741a33853793221c4343f94576a);
		}
	 </style>
	 <!-- 별점 -->
		<div class="star-box">
			  <span class="star star_left"></span>
			  <span class="star star_right"></span>
			
			  <span class="star star_left"></span>
			  <span class="star star_right"></span>
			
			  <span class="star star_left"></span>
			  <span class="star star_right"></span>
			
			 <span class="star star_left"></span>
			 <span class="star star_right"></span>
			
			 <span class="star star_left"></span>
			 <span class="star star_right"></span>
		</div>
	</div>
	 <div>
	 	<p><img id="login_title" src="${pageContext.request.contextPath}/resources/image/22014586_p.gif"></p>
	 </div>
	 <ul>
	 	<li>장소 :장소블루스퀘어 신한카드홀</li>
	 	<li>공연기간 : 2022.12.16 ~ 2023.03.05</li>
	 	<li>공연시간 : 170분(인터미션 20분 포함)</li>
	 	<li>관람연령 : 14세 이상 관람가</li>
	 	<li>가격 : VIP석 180,000원 </li>
	 </ul>

	
	<nav style="display:none">
	  <div class="nav nav-tabs" id="nav-tab" role="tablist">
	    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">공연정보</button>
	    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">캐스팅정보</button>
	    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">판매정보</button>
	    <button class="nav-link" id="nav-disabled-tab" data-bs-toggle="tab" data-bs-target="#nav-disabled" type="button" role="tab" aria-controls="nav-disabled" aria-selected="false">관람후기</button>
	  </div>
	</nav>
	<div class="tab-content" id="nav-tabContent">
	  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">


	  </div>
	  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">...</div>
	  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">...</div>
	  <div class="tab-pane fade" id="nav-disabled" role="tabpanel" aria-labelledby="nav-disabled-tab" tabindex="0">...</div>
	</div>
	</div>
	

<%@ include file="../inc/footer.jsp" %>
</body>
</html>