<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<style>


.nav-link  {color:#333!important;}
.nav-tabs .nav-link.active {font-weight:700; }
.tabmenu_cm{position: relative;width: 100%;}
.tabmenu_cm .more{position: absolute;right: 0; color:#999; font-size:14px; padding:10px}
.tabmenu_cm .more:hover{color:#000}
footer {margin-top: 0px!important;}

</style>
</head>
<body>

	<%@ include file="inc/header.jsp" %>
<div id="wrapper" >		

<!-- 배경 사진을 img tag로 표현했을 때 -->

<style>

.banner_img, .banner_bg{
  display:inline-block;
  position: relative;
}
.banner_img:hover:after,
.banner_img:hover > .hover_text,
.banner_bg:hover:after,
.banner_bg:hover > .hover_text
{
  display:block;
}
.banner_img:after,.banner_bg:after,.hover_text{
  display:none;
}
.banner_img:after,.banner_bg:after{
  content:'';
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background: rgba(0, 0, 0, 0.3);
  z-index: 10;
}
.banner_img {
  overflow: hidden;
}
.banner_img img{
  height: 340px;
}
.banner_img:hover img{
  transform: scale(1.2);
  transition: 1s;
}
.hover_text {
  position: absolute;
  top: 140px;
  left: 25px;
  color: #fff;
  z-index: 20;
  font-weight: 600;
  font-size: 20px;
}

/*퀵메뉴*/
#quick {
  position: absolute;
  right: 0;
  top: 100px;
  height: 200px;
  background: #cfa;
  z-index: 2;
}

#footer {
  background: black;
  opacity: .5;
  color: #fff;
  height: 40px;
  margin-top: 0;
}

#sample_page {
  margin-top: 0
}

.po {
  border: 1px solid blue;
  position: relative;
}

.por {
  position: relative;
}

.btn_top {
  position: fixed;
  right: 50px;
  bottom: 50px;
  width: 50px;
  height: 50px;
  background: #555;
  color: #fff;
  line-height: 50px;
  display: none
}

.btn_top a {
  color: #fff;
  display: block;
  text-align: center;
  font-size: 20px;
}
}

</style>
<script type="text/javascript">
$(function() {

	  var UI = {
	    init: function() {
	      this.quickMenuFn();
	      this.topBtn();
	    },

	    initialize: function() {
	      this.id = {
	        target: {
	          quick: '#quick',
	          stickyTop: '#footer'
	        },
	        topBtnClass: 'btn_top'
	      };
	      this.init();
	    },

	    quickMenuFn: function() {
	      var quick = $(this.id.target.quick);
	      var qTop = parseInt(quick.css('top'));

	      $(window).scroll(function() {
	        var winTop = $(window).scrollTop();

	        quick.stop().animate({
	          top: winTop + qTop
	        }, 400);

	      })
	    },

	    topBtn: function() {
	      var btnLocation = $('.' + this.id.topBtnClass);
	      var timerId = 0;

	      $(window).on('scroll', function() {
	        var winTop = $(window).scrollTop();
	        if (winTop > 200) {
	          btnLocation.fadeIn();
	          clearInterval(timerId);
	          timerId = setInterval(btnEffet, 2000);
	        } else {
	          btnLocation.fadeOut();
	          clearInterval(timerId);
	        }

	      });

	      function btnEffet() {
	        btnLocation.fadeTo('300', 0.3).fadeTo('300', 1);
	      }

	      this.scrollTop(btnLocation);
	    },

	    scrollTop: function(eTarget, speed) {
	      var speed = speed || null;
	      eTarget.on('click', function() {
	        $('html, body').animate({
	          scrollTop: $("body").offset().top
	        }, speed)
	      })
	    }

	  };

	  $(function() {
	    UI.initialize();
	  })

	})
</script>
<div id="quick">스크롤 퀵 메뉴</div>
   	<!-- tab 메뉴-->
   	<div>
		   	<div id="exhiPosterWrap">
		   		<h3 class="mgt50">전체공연</h3>
		   		<div class="tabmenu_cm">
					<ul class="nav nav-tabs mgt20" id="myTab" role="tablist">
					  <li class="nav-item" role="presentation">
					    <button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-bs-target="#all-tab-pane" type="button" role="tab" aria-controls="all-tab-pane" aria-selected="true">전체공연</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="musical-tab" data-bs-toggle="tab" data-bs-target="#musical-tab-pane" type="button" role="tab" aria-controls="musical-tab-pane" aria-selected="false">뮤지컬</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="classic-tab" data-bs-toggle="tab" data-bs-target="#classic-tab-pane" type="button" role="tab" aria-controls="classic-tab-pane" aria-selected="false">클래식</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="concert-tab" data-bs-toggle="tab" data-bs-target="#concert-tab-pane" type="button" role="tab" aria-controls="concert-tab-pane" aria-selected="false">콘서트</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="theater-tab" data-bs-toggle="tab" data-bs-target="#theater-tab-pane" type="button" role="tab" aria-controls="theater-tab-pane" aria-selected="false">연극</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="kids-tab" data-bs-toggle="tab" data-bs-target="#kids-tab-pane" type="button" role="tab" aria-controls="kids-tab-pane" aria-selected="false">아동/가족</button>
					  </li>
					  <a class="more" href="/showlist"> + 더 보기</a>
				 	</ul>
				 	
				 </div>
				<!-- 예매하기 -->
				<div class="tab-content" id="myTabContent">
				  <div class="tab-pane fade show active" id="all-tab-pane" role="tabpanel" aria-labelledby="all-tab" tabindex="0">
					<div class="container">
						<ul class="reservationWrap">
							<c:forEach items="${showList}" var="showDto" begin="0" end="3" step="1">
								<li>
									<div class="img_title_wrap">
										<p class="poster_title" style="display:none">${showDto.stitle}</p>
										
										<!-- 포스터이미지 -->
										<div class="exhiPoster">
									      <a href="showview?snum=${showDto.snum}" class="banner_img">
										     <c:if test="${showDto.fileDto.fileextension =='jpg' or showDto.fileDto.fileextension =='png' or showDto.fileDto.fileextension =='bmp' or showDto.fileDto.fileextension =='gif'}">
									        	<img width="280"  height="360" src="${pageContext.request.contextPath}/resources/uploadfiles/${showDto.fileDto.filename}">
									         </c:if>
									         <div class="hover_text">
									         	<ul>
									         		<li>${showDto.stitle}</li>
									         		<li>${showDto.sdday}</li>
									         		<li>${showDto.sprice}</li>
									         		<li>${showDto.sage}</li>
									         	</ul>
									         </div>
								          </a>
								        </div> 
								         <!-- 포스터이미지 -->
									</div>
									<div class="rv_btnset">
										<ul>
											<li class="good-btn">
											<div class="like">
								               <a type="button"  class="btn btn-outline-danger" name="liker">
											   		♥좋아요${showView.liker}<span class="badge text-bg-secondary" ></span>
											   	</a> 
										   	</div>
			   	
											<button type="button" class="btn btn-outline-secondary" style="display:none">
												<i class="material-icons" style="font-size: 16px;">favorite</i>
													좋아요
											</button>
											</li>
											<li>
												<button style="background:#212529;border-color:#999" type="button" class="btn btn-dark rebtn" onclick="location.href='showview?snum=${showDto.snum}' ">예매하기</button>
												<!-- background:#8364c4;border-color:#a659bc-->
											</li>
										</ul>
								
									</div>
								</li>
							</c:forEach>	
						</ul>
					</div>
				  </div>
				  <div class="tab-pane fade" id="musical-tab-pane" role="tabpanel" aria-labelledby="musical-tab" tabindex="0">
					 <div class="container">
						<ul class="reservationWrap">
							<c:forEach items="${showMusicalList}" var="showDto" begin="0" end="3" step="1">
								<li>
									<div class="img_title_wrap">
										<p class="poster_title" style="display:none">${showDto.stitle}</p>
										
										<!-- 포스터이미지 -->
										<div class="exhiPoster">
									      <c:if test="${showDto.fileDto.fileextension =='jpg' or showDto.fileDto.fileextension =='png' or showDto.fileDto.fileextension =='bmp' or showDto.fileDto.fileextension =='gif'}">
								        	<img width="280"  height="360" src="${pageContext.request.contextPath}/resources/uploadfiles/${showDto.fileDto.filename}">
								         </c:if>
								        </div> 
								         <!-- 포스터이미지 -->
									</div>
									<div class="rv_btnset">
										<ul>
											<li class="good-btn">
											<button type="button" class="btn btn-outline-secondary">
												<i class="material-icons" style="font-size: 16px;">favorite</i>
													좋아요
											</button>
											</li>
											<li>
												<button style="background:#666;border-color:#999" type="button" class="btn btn-dark rebtn" onclick="location.href='showview?snum=${showDto.snum}' ">예매하기</button>
												<!-- background:#8364c4;border-color:#a659bc-->
											</li>
										</ul>
								
									</div>
								</li>
							</c:forEach>	
						</ul>
					</div>
				  </div>
				  <div class="tab-pane fade" id="classic-tab-pane" role="tabpanel" aria-labelledby="classic-tab" tabindex="0">
					<div class="container">
						<ul class="reservationWrap">
							<c:forEach items="${showClassicList}" var="showDto" begin="0" end="3" step="1">
								<li>
									<div class="img_title_wrap">
										<p class="poster_title" style="display:none">${showDto.stitle}</p>
										
										<!-- 포스터이미지 -->
										<div class="exhiPoster">
									      <c:if test="${showDto.fileDto.fileextension =='jpg' or showDto.fileDto.fileextension =='png' or showDto.fileDto.fileextension =='bmp' or showDto.fileDto.fileextension =='gif'}">
								        	<img width="280"  height="360" src="${pageContext.request.contextPath}/resources/uploadfiles/${showDto.fileDto.filename}">
								         </c:if>
								        </div> 
								         <!-- 포스터이미지 -->
									</div>
									<div class="rv_btnset">
										<ul>
											<li class="good-btn">
											<button type="button" class="btn btn-outline-secondary">
												<i class="material-icons" style="font-size: 16px;">favorite</i>
													좋아요
											</button>
											</li>
											<li>
												<button style="background:#666;border-color:#999" type="button" class="btn btn-dark rebtn" onclick="location.href='showview?snum=${showDto.snum}' ">예매하기</button>
												<!-- background:#8364c4;border-color:#a659bc-->
											</li>
										</ul>
								
									</div>
								</li>
							</c:forEach>	
						</ul>
					</div>
				  </div>
				  <div class="tab-pane fade" id="concert-tab-pane" role="tabpanel" aria-labelledby="concert-tab" tabindex="0">
					<div class="container">
						<ul class="reservationWrap">
							<c:forEach items="${showConsertList}" var="showDto" begin="0" end="3" step="1">
								<li>
									<div class="img_title_wrap">
										<p class="poster_title" style="display:none">${showDto.stitle}</p>
										
										<!-- 포스터이미지 -->
										<div class="exhiPoster">
									      <c:if test="${showDto.fileDto.fileextension =='jpg' or showDto.fileDto.fileextension =='png' or showDto.fileDto.fileextension =='bmp' or showDto.fileDto.fileextension =='gif'}">
								        	<img width="280"  height="360" src="${pageContext.request.contextPath}/resources/uploadfiles/${showDto.fileDto.filename}">
								         </c:if>
								        </div> 
								         <!-- 포스터이미지 -->
									</div>
									<div class="rv_btnset">
										<ul>
											<li class="good-btn">
											<button type="button" class="btn btn-outline-secondary">
												<i class="material-icons" style="font-size: 16px;">favorite</i>
													좋아요
											</button>
											</li>
											<li>
												<button style="background:#666;border-color:#999" type="button" class="btn btn-dark rebtn" onclick="location.href='showview?snum=${showDto.snum}' ">예매하기</button>
												<!-- background:#8364c4;border-color:#a659bc-->
											</li>
										</ul>
								
									</div>
								</li>
							</c:forEach>	
						</ul>
					</div>
				  </div>
				  <div class="tab-pane fade" id="theater-tab-pane" role="tabpanel" aria-labelledby="theater-tab" tabindex="0">
					<div class="container">
						<ul class="reservationWrap">
							<c:forEach items="${showTheaterList}" var="showDto" begin="0" end="3" step="1">
								<li>
									<div class="img_title_wrap">
										<p class="poster_title" style="display:none">${showDto.stitle}</p>
										
										<!-- 포스터이미지 -->
										<div class="exhiPoster">
									      <c:if test="${showDto.fileDto.fileextension =='jpg' or showDto.fileDto.fileextension =='png' or showDto.fileDto.fileextension =='bmp' or showDto.fileDto.fileextension =='gif'}">
								        	<img width="280"  height="360" src="${pageContext.request.contextPath}/resources/uploadfiles/${showDto.fileDto.filename}">
								         </c:if>
								        </div> 
								         <!-- 포스터이미지 -->
									</div>
									<div class="rv_btnset">
										<ul>
											<li class="good-btn">
											<button type="button" class="btn btn-outline-secondary">
												<i class="material-icons" style="font-size: 16px;">favorite</i>
													좋아요
											</button>
											</li>
											<li>
												<button style="background:#666;border-color:#999" type="button" class="btn btn-dark rebtn" onclick="location.href='showview?snum=${showDto.snum}' ">예매하기</button>
												<!-- background:#8364c4;border-color:#a659bc-->
											</li>
										</ul>
								
									</div>
								</li>
							</c:forEach>	
						</ul>
					</div>
				 </div>
				  <div class="tab-pane fade" id="kids-tab-pane" role="tabpanel" aria-labelledby="kids-tab" tabindex="0">
					<div class="container">
						<ul class="reservationWrap">
							<c:forEach items="${showFamilyList}" var="showDto" begin="0" end="3" step="1">
								<li>
									<div class="img_title_wrap">
										<p class="poster_title" style="display:none">${showDto.stitle}</p>
										
										<!-- 포스터이미지 -->
										<div class="exhiPoster">
									      <c:if test="${showDto.fileDto.fileextension =='jpg' or showDto.fileDto.fileextension =='png' or showDto.fileDto.fileextension =='bmp' or showDto.fileDto.fileextension =='gif'}">
								        	<img width="280"  height="360" src="${pageContext.request.contextPath}/resources/uploadfiles/${showDto.fileDto.filename}">
								         </c:if>
								        </div> 
								         <!-- 포스터이미지 -->
									</div>
									<div class="rv_btnset">
										<ul>
											<li class="good-btn">
											<button type="button" class="btn btn-outline-secondary">
												<i class="material-icons" style="font-size: 16px;">favorite</i>
													좋아요
											</button>
											</li>
											<li>
												<button style="background:#666;border-color:#999" type="button" class="btn btn-dark rebtn" onclick="location.href='showview?snum=${showDto.snum}' ">예매하기</button>
												<!-- background:#8364c4;border-color:#a659bc-->
											</li>
										</ul>
								
									</div>
								</li>
							</c:forEach>	
						</ul>
					</div>
				  </div>
				
				</div>
				
			</div>	
				<!-- //예매하기 -->
			<!-- //tab -->	
			
		   	<div id="eventWrap">
			   	<h3 class="h3">이벤트</h3>
			   		<ul>
			   		
			   		<c:forEach items="${eventList}" var="EventBDto" begin="0" end="2" step="1">
			   			<a href="questionView?qnum=${EventBDto.qnum }">
				   			<li>
				   				<div class="eventImg"></div>
				   				<div class="eventTitle">${EventBDto.qcontent}</div>
				   				<div class="eventDate">${EventBDto.qdate}</div>
				   			</li>
			   			</a>
			   		</c:forEach>
					
			   		</ul>
		   	</div>
		   	<!--  동영상 -->
		   	<div class="focuson" style="display:none">
				<div class="focuson-wrap">
			        <div class="focus-txt"><p class="focus-tit"><span href="#"><img src="http://tkfile.yes24.com/imgNew/main/tit8.png" alt=""></span></p><p class="focus-tit2"><a href="?Gcode=009_212">뮤지컬<br>오페라의 유령</a></p><p class="focus-detail"><a href="?Gcode=009_212">마침내,<br>13년 만의 한국어 공연!</a></p></div><div class="focus-con"><iframe id="playerFocusOn" class="focus-con-movie" frameborder="0" allowfullscreen="1" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" title="YouTube video player" width="640" height="360" src="https://www.youtube.com/embed/?enablejsapi=1&amp;origin=http%3A%2F%2Fticket.yes24.com&amp;widgetid=1"></iframe><div class="focus-con-img"><a href="#" title="PJL5WN4NGLQ"><img src="http://tkfile.yes24.com/Upload2/Display/202212/20221230/오페라의 유령 썸네일.jpg/dims/quality/70/" alt="" class="lazyload"></a></div></div>
				</div>
			</div>
		   	<!--  검색기능 -->
		   	<section class="now_need">
			<div class="inner_wrap">
				<div class="cont_left">
					<h2 class="title">지금 나에게 딱 맞는 공연은?</h2>
					<p class="txt">티켓켓이 다양한 공연들을 추천해 드립니다!</p>
					<div class="cont_wrap mobile_none">
						<div class="search_wrap">
							<input type="text" id="search_prd" class="input_search" placeholder="좋아하는 장르를 검색해보세요!">
							<a onclick="script:window.location='boardList'"  class="btn_search"></a>
						</div>
					</div>
				</div>
				<div class="cont_right">
					<div class="category_wrap">
						<a href="/boardList?searchOption=skind&searchKey=콘서트" class="cate01 big_ver">
							<span class="cate_name">콘서트</span>
						</a>
						<a href="/boardList?searchOption=skind&searchKey=뮤지컬" class="cate02 big_ver">
							<span class="cate_name font_black">뮤지컬</span>
						</a>
						<a href="/boardList?searchOption=skind&searchKey=연극" class="cate03 small_ver">
							<span class="cate_name">연극</span>
						</a>
						<a href="/boardList?searchOption=sprice&searchKey=free" class="cate04 small_ver">
							<span class="cate_name font_black">무료공연</span>
						</a>
						<a href="/boardList?searchOption=slocation&searchKey=예술의전당" class="cate05 small_ver">
							<span class="cate_name">예술의전당</span>
						</a>
						<a href="/boardList?searchOption=skind&searchKey=가족" class="cate06 small_ver">
							<span class="cate_name">가족</span>
						</a>
						<a href="/boardList?searchOption=skind&searchKey=어린이" class="cate07 big_ver">
							<span class="cate_name">어린이</span>
						</a>
					</div>
				</div>
			</div>
		</section>
		   	<!-- 굿즈판매 -->
		   	<div id="goodsWrap" class="mgt50">
			   	<h3>굿즈 스토어</h3>
			   	<div class="goodslist">
			   		<p class="goodImg"><img width="200" height="200" src="${pageContext.request.contextPath}/resources/image/goods1.png"></p>
			   		<div class="good_r">
			   			<div class="goodsTitle">앤서니 브라운 </div>
			   			<div class="goodsText">사냥꾼을 만난 꼬마곰 문구셋트 출시<br>책부터 연필까지 꼬마곰과 함께 하세요!</div>
			   			<button type="button" class="btn btn-outline-secondary"
					        style="--bs-btn-padding-y: .35rem; --bs-btn-padding-x: .7rem; --bs-btn-font-size: .85rem;">
					 바로가기
					</button>
			   		</div>
			   		
			   	</div>	
			   	<div class="goodslist floatR">
			   	<p class="goodImg"><img width="200" height="200" src="${pageContext.request.contextPath}/resources/image/goods2.png"></p>
			   		<div class="good_r">
			   			<div class="goodsTitle">하리보 골드베렌 100주년</div>
			   			<div class="goodsText">귀여운 곰돌이가 궁금하다면 <br> QR code를 촬영해 보세요</div>
			   			<button type="button" class="btn btn-outline-secondary"
					        style="--bs-btn-padding-y: .35rem; --bs-btn-padding-x: .7rem; --bs-btn-font-size: .85rem;">
					 바로가기
					</button>
			   		</div>
			   	</div>	
		   	</div>
   		</div>
 
  </div>
<!-- 배너 -->
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	 
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="${pageContext.request.contextPath}/resources/image/sbanner01.png" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath}/resources/image/sbanner02.png" class="d-block w-100" alt="...">
	    </div>
	    
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	
	
    <%@ include file="inc/footer.jsp" %> 	
</body>
</html>