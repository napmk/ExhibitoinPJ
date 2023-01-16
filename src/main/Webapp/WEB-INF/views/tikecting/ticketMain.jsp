<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
	<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<title>예매진행</title>

	<% 
		String sessionId = (String) session.getAttribute("memberId");
		//로그인중이라면 로그인한 아이디가 저장되고 비로그인 중이면 sessionId==null 임
	%>
</head>

<body>
	<div id="wrapper" class="boardWrap">
		<div class="board_title">
		 	<h4>${showView.stitle}</h4>
		 	<div class="star">
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star"></span>
				<span class="fa fa-star"></span>
				<span>9.1</span>
			</div>
		</div>
		<div class="show_detail">	
			 <div class="show_poster">
			 	<!-- 포스터이미지 -->
			      <c:if test="${fileDto.fileextension =='jpg' or fileDto.fileextension =='png' or fileDto.fileextension =='bmp' or fileDto.fileextension =='gif'}">
		        	<img width="300" src="${pageContext.request.contextPath}/resources/uploadfiles/${fileDto.filename}">
		         </c:if>
		         <!--// 포스터이미지 -->
				<ul class="likes">
					<li><i class="material-icons">favorite</i></li>
					<li>50</li>
					<li>좋아요</li>
				</ul>
			</div>
			<div class="pright-area">
				 <ul class="show_text">
				 	<li>장소 : ${showView.slocation}</li>
				 	<li>공연기간 : ${showView.sdday}</li>
				 	<li>공연시간 : ${showView.stime}</li>
				 	<li>관람연령 : ${showView.sage}</li>
				 	<li>가격 : <b>${showView.sprice}</b> 원</li>
				 	<li>
					 	<div>티켓 매수
					 	<form method="post" action="ticket_sheets">
							<select class="form-select form-select-sm" >
							  <option selected>장 수를 선택해 주세요</option>
							  <option value="1">1</option>
							  <option value="2">2</option>
							  <option value="3">3</option>
							  <option value="4">4</option>
							  <option value="5">5</option>
							  <option value="6">6</option>
							  <option value="7">7</option>
							  <option value="8">8</option>
							  <option value="9">9</option>
							  <option value="10">10</option> 
							 </select>
					  </form>
						 </div>
					</li>
				 </ul>
				 <div class="ptselect_txt mgb40">10장이상 단체구매는 1500-3322에 문의하세요</div>
				 <!-- 달력 -->
				
				
				 
			 </div>
			 <!-- 달력 및 예약하기-->
			<div class="floatR">
				<div id="pickDate" class="mgb20"></div>
				<!--  <button onclick="window.open('ticketMain')" type="submit" class="btn btn-warning" style="width: 100%;padding:8px 24px;font-size:20px">예약하기</button>-->
				<button onclick="window.open('ticketMain', '_blank', 'width=500px,height=400px,toolbars=no,scrollbars=no'); return false;" type="submit" class="btn btn-warning" style="width: 100%;padding:8px 24px;font-size:20px">예약하기</button>
			
			</div>
<!-- 달력 -->
		
		 </div>
  <!-- tab컨텐츠 -->
	<nav class="showview_tab clear mgt50">
	  <div class="nav nav-tabs" id="nav-tab" role="tablist">
	    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">관람후기</button>
	    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">캐스팅정보</button>
	    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">판매정보</button>
	    <button class="nav-link" id="nav-disabled-tab" data-bs-toggle="tab" data-bs-target="#nav-disabled" type="button" role="tab" aria-controls="nav-disabled" aria-selected="false">공연정보</button>
	  </div>
	</nav>
	<div class="tab-content" id="nav-tabContent">
	  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
		관람후기
	 </div>
	  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">캐스팅정보</div>
	  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">판매정보</div>
	  <div class="tab-pane fade" id="nav-disabled" role="tabpanel" aria-labelledby="nav-disabled-tab" tabindex="0">공연정보</div>
	</div>
	</div>
	<!-- tab컨텐츠 -->
		
	
		
		
	</div>
</body>
</html>