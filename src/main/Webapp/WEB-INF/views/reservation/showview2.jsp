<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/board.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha512-rxThY3LYIfYsVCWPCW9dB0k+e3RZB39f23ylUYTEuZMDrN/vRqLdaCBo/FbvVT6uC2r0ObfPzotsfKF9Qc5W5g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/datepicker.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
<title>예약뷰페이지</title>
<!-- 좋아요 -->
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">
<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
<link rel="mask-icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111">
<!-- //좋아요 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/datepicker.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/jquery-ui.css">

<style>
.input_type01{border: 0;}
.likes{margin-top:12px}
.ui-widget.ui-widget-content {border: 0;}
.btn_like {
  position: relative;
  margin: 100px auto;
  display: block;
  width: 44px;
  height: 44px;
  border: 1px solid #e8e8e8;
  border-radius: 44px;
  font-family: notokr-bold,sans-serif;
  font-size: 14px;
  line-height: 16px;
  background-color: #fff;
  color: #DD5D54;
  box-shadow: 0 2px 2px 0 rgba(0,0,0,0.03);
  transition: border .2s ease-out,box-shadow .1s ease-out,background-color .4s ease-out;
  cursor: pointer;
}

.btn_like:hover {
  border: 1px solid rgba(228,89,89,0.3);
  background-color: rgba(228,89,89,0.02);
  box-shadow: 0 2px 4px 0 rgba(228,89,89,0.2);
}

.btn_unlike .img_emoti {
    background-position: -30px -120px;
}

.img_emoti {
    display: inline-block;
    overflow: hidden;
    font-size: 0;
    line-height: 0;
    background: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/img_emoti.png?v=20180410) no-repeat;
    text-indent: -9999px;
    vertical-align: top;
    width: 20px;
    height: 17px;
    margin-top: 1px;
    background-position: 0px -120px;
    text-indent: 0;
}

.btn_like .ani_heart_m {
    margin: -63px 0 0 -63px;
}

.ani_heart_m {
    display: block;
    position: absolute;
    top: 50%;
    left: 50%;
    width: 125px;
    height: 125px;
    margin: -63px 0 0 -63px;
    pointer-events: none;
}

.ani_heart_m.hi {
    background-image: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/retina/zzim_on_m.png);
    -webkit-background-size: 9000px 125px;
    background-size: 9000px 125px;
    animation: on_m 1.06s steps(72);
}

.ani_heart_m.bye {
    background-image: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/retina/zzim_off_m.png);
    -webkit-background-size: 8250px 125px;
    background-size: 8250px 125px;
    animation: off_m 1.06s steps(66);
}

@keyframes on_m {
  from { background-position: 0 }
  to { background-position: -9000px }
}

@keyframes off_m {
  from { background-position: 0 }
  to { background-position: -8250px }
}
</style>

  
  
  
  <script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>
</head>

<body>

<%@ include file="../inc/header.jsp" %>
  
  <form action ="ticketingOk?snum=${param.snum}" method="post">  
   <input type="hidden" value="${showView.snum }" name="snum">
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
		         
		       
		         
		        <!-- 좋아요 버튼 -->
		        <div class="like-wrapper">
			        <a class="like" type="button" href="reviewlikeStar?snum=${showView.snum}" name="liker">
				        <button type="button" class="btn_like btn_unlike">
						  <span class="img_emoti">좋아요</span>
						  <span class="ani_heart_m hi"></span>
						</button>
						
							<span>좋아요 ${showView.liker}</span>
					</a>
				</div>
				<!-- //좋아요 버튼 -->
			

			</div>
			
			<form action="reservationOk" method="post" name="reservation_frm" novalidate>
			<div class="pright-area">
				 <ul class="show_text">
					<li> 공연 종류 :<input class="input_type01" type="text" name="skind" value="${showView.skind}" readonly="readonly"></li>
				 	<li> 공연 제목 : <input class="input_type01" type="text" name="stitle" value="${showView.stitle}" readonly="readonly"></li>
				 	<li> 공연 위치 : <input class="input_type01" type="text" name="slocation" value="${showView.slocation}" readonly="readonly"></li>
				 	<li> 공연 날짜 : <input class="input_type01" type="text" name="sdday" value="${showView.sdday}" readonly="readonly" style="width:75px"></li>
				 	<li> 공연 시간 : <input class="input_type01" type="text" name="stime" value="${showView.stime}" readonly="readonly"></li>
				 	<li> 공연 장소 : <input class="input_type01" type="text" name="sprice" value="${showView.sprice}" readonly="readonly"></li>
				 	<li> 공연 나이 : <input class="input_type01" type="text" name="sage" value="${showView.sage}" readonly="readonly"></li>
				 	<li style="display:none"> 아이디 : <input class="input_type01" type="text" name="userid" value="${memberId}" readonly="readonly"></li>
		
				 	<li>
					 	<div>티켓 매수
					 
							<select class="form-select form-select-sm"  name="count">
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
					
						 </div>
					</li>
				 </ul>
				
				 <div class="ptselect_txt mgb40">10장이상 단체구매는 1500-3322에 문의하세요</div>
				 <!-- 달력 -->
				
				
				 
			 </div>
				 <!-- 달력 및 예약하기-->
				<div class="floatR">
					<div id="pickDate" class="mgb20"></div>
					<!--  <button onclick="window.open('ticketMain')" type="submit" class="btn btn-warning" style="width: 100%;padding:8px 24px;font-size:20px">예약하기</button>
					<button onclick="window.open('ticketMain', '_blank', 'width=500px,height=400px,toolbars=no,scrollbars=no'); return false;" type="submit" class="btn btn-warning" style="width: 100%;padding:8px 24px;font-size:20px">예약하기</button>-->
					 <input class="btn btn-warning" type="submit" value="예매하기" style="width:100%" > 
				</div>
				 
				<!-- //달력 -->
				</form>
			  </form>
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

</form>
    <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-2c7831bb44f98c1391d6a4ffda0e1fd302503391ca806e7fcc7b9b87197aec26.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script id="rendered-js">
	$('button').click(function () {
	  if ($(this).hasClass('btn_unlike')) {
	    $(this).removeClass('btn_unlike');
	    $('.ani_heart_m').removeClass('hi');
	    $('.ani_heart_m').addClass('bye');
	  } else
	  {
	    $(this).addClass('btn_unlike');
	    $('.ani_heart_m').addClass('hi');
	    $('.ani_heart_m').removeClass('bye');
	  }
	});
//# sourceURL=pen.js
    </script>

  

  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-550eae0ce567d3d9182e33cee4e187761056020161aa87e3ef74dc467972c555.js"></script>


<%@ include file="../inc/footer.jsp" %>
</body>
</html>