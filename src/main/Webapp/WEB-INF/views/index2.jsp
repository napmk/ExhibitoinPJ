<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="inc/header.jsp" %>
<div id="wrapper" >		
   	<!-- tab 메뉴-->
   	<div>
		   	<div id="exhiPosterWrap">
		   		<h3 class="mgt50">전체공연</h3>
				<ul class="nav nav-tabs mgt20" id="myTab" role="tablist">
				  <li class="nav-item" role="presentation">
				    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">전체공연</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">콘서트</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">연극</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">아동/가족</button>
				  </li>
				 
				</ul>
				<!-- 예매하기 -->
				<div class="tab-content" id="myTabContent">
				  <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
					<!-- 쉬운소스로 -->
					
					<div class="container">
						<ul class="reservationWrap">
								<li>
									<div class="img_title_wrap">
										<!-- 포스터이미지 -->
										<div class="exhiPoster">
									      <img src = "${pageContext.request.contextPath}/resources/image/22009226_p.gif" width="280" height="360" />
								        </div> 
								         <!-- 포스터이미지 -->
									</div>
									<div class="rv_btnset">
										<ul>
											<li>
											<button type="button" class="btn btn-outline-secondary">
												<i class="material-icons" style="font-size: 16px;">favorite</i>
													좋아요
											</button>
											</li>
											<li>
												<button type="button" class="btn btn-secondary" onclick="location.href='ticketing?tnum=1'">예매하기</button>
												
											</li>
										</ul>
								
									</div>
								</li>
								<li>
									<div class="img_title_wrap">
										<!-- 포스터이미지 -->
										<div class="exhiPoster">
									      <img src = "${pageContext.request.contextPath}/resources/image/22017804_p.gif" width="280" height="360" />
								        </div> 
								         <!-- 포스터이미지 -->
									</div>
									<div class="rv_btnset">
										<ul>
											<li>
											<button type="button" class="btn btn-outline-secondary">
												<i class="material-icons" style="font-size: 16px;">favorite</i>
													좋아요
											</button>
											</li>
											<li>
												<button type="button" class="btn btn-secondary" onclick="location.href='ticketing?tnum=2'">예매하기</button>
												
											</li>
										</ul>
								
									</div>
								</li>
								<li>
									<div class="img_title_wrap">
										<!-- 포스터이미지 -->
										<div class="exhiPoster">
									      <img src = "${pageContext.request.contextPath}/resources/image/22013829_p.gif" width="280" height="360" />
								        </div> 
								         <!-- 포스터이미지 -->
									</div>
									<div class="rv_btnset">
										<ul>
											<li>
											<button type="button" class="btn btn-outline-secondary">
												<i class="material-icons" style="font-size: 16px;">favorite</i>
													좋아요
											</button>
											</li>
											<li>
												<button type="button" class="btn btn-secondary" onclick="location.href='ticketing?tnum=3'">예매하기</button>
												
											</li>
										</ul>
								
									</div>
								</li>
								<li>
									<div class="img_title_wrap">
										<!-- 포스터이미지 -->
										<div class="exhiPoster">
									      <img src = "${pageContext.request.contextPath}/resources/image/22013868_p.gif" width="280" height="360" />
								        </div> 
								         <!-- 포스터이미지 -->
									</div>
									<div class="rv_btnset">
										<ul>
											<li>
											<button type="button" class="btn btn-outline-secondary">
												<i class="material-icons" style="font-size: 16px;">favorite</i>
													좋아요
											</button>
											</li>
											<li>
												<button type="button" class="btn btn-secondary" onclick="location.href='ticketing?tnum=4'">예매하기</button>
												
											</li>
										</ul>
								
									</div>
								</li>
						</ul>
					</div>
					<!-- 쉬운소스로 -->
				  </div>
				  <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
						<!-- 리스트 -->
					<div class="container">
						<ul class="reservationWrap">
							<c:forEach items="${showList}" var="showDto" begin="0" end="3" step="1">
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
											<li>
											<button type="button" class="btn btn-outline-secondary">
												<i class="material-icons" style="font-size: 16px;">favorite</i>
													좋아요
											</button>
											</li>
											<li>
												<button type="button" class="btn btn-secondary" onclick="location.href='showview?snum=${showDto.snum}' ">예매하기</button>
												
											</li>
										</ul>
								
									</div>
								</li>
							</c:forEach>	
						</ul>
					</div>
					<!-- 리스트 -->
					</div>
				  <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">...</div>
				  <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">...</div>
				
				</div>
			</div>	
				<!-- //예매하기 -->
			<!-- //tab -->	
			
		   	<div id="eventWrap">
			   	<h3 class="h3">이벤트</h3>
			   		<ul>
			   		<c:forEach items="${eventList}" var="EventBDto" begin="0" end="2" step="1">
			   			<li>
			   				<div class="eventImg"></div>
			   				<div class="eventTitle">${EventBDto.qcontent}</div>
			   				<div class="eventDate">${EventBDto.qdate}</div>
			   			</li>
			   		</c:forEach>
		
			   		</ul>
		   	</div>
		   	<!--  동영상 -->
		   	<div class="focuson">
				<div class="focuson-wrap">
			        <div class="focus-txt"><p class="focus-tit"><span href="#"><img src="http://tkfile.yes24.com/imgNew/main/tit8.png" alt=""></span></p><p class="focus-tit2"><a href="?Gcode=009_212">뮤지컬<br>오페라의 유령</a></p><p class="focus-detail"><a href="?Gcode=009_212">마침내,<br>13년 만의 한국어 공연!</a></p></div><div class="focus-con"><iframe id="playerFocusOn" class="focus-con-movie" frameborder="0" allowfullscreen="1" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" title="YouTube video player" width="640" height="360" src="https://www.youtube.com/embed/?enablejsapi=1&amp;origin=http%3A%2F%2Fticket.yes24.com&amp;widgetid=1"></iframe><div class="focus-con-img"><a href="#" title="PJL5WN4NGLQ"><img src="http://tkfile.yes24.com/Upload2/Display/202212/20221230/오페라의 유령 썸네일.jpg/dims/quality/70/" alt="" class="lazyload"></a></div></div>
				</div>
			</div>
		   	<!--  검색기능 -->
		   
          </form>
			 <form action="search_list">
		   	<section class="now_need">
			<div class="inner_wrap">
				<div class="cont_left">
					<h2 class="title">지금 나에게 딱 맞는 공연은?</h2>
					<p class="txt">enjoysEE가 다양한 공연들을 추천해 드립니다!</p>
					<div class="cont_wrap mobile_none">
						<div class="search_wrap">
							<input type="text" id="search_prd" name="searchKey" class="input_search" placeholder="좋아하는 장르를 검색해보세요!">
							<a href="javascript:search();" class="btn_search"></a>
						</div>
					</div>
				</div>
				<div class="cont_right">
					<div class="category_wrap">
						<a href="/" class="cate01 big_ver">
							<span class="cate_name">콘서트</span>
						</a>
						<a href="/" class="cate02 big_ver">
							<span class="cate_name font_black">뮤지컬</span>
						</a>
						<a href="/" class="cate03 small_ver">
							<span class="cate_name">연극</span>
						</a>
						<a href="/" class="cate04 small_ver">
							<span class="cate_name font_black">클래식</span>
						</a>
						<a href="/" class="cate05 small_ver">
							<span class="cate_name">전시</span>
						</a>
						<a href="/" class="cate06 small_ver">
							<span class="cate_name">가족</span>
						</a>
						<a href="/" class="cate07 big_ver">
							<span class="cate_name">어린이</span>
						</a>
					</div>
				</div>
			</div>
		</section>
		</form>
		   	<!-- 굿즈판매 -->
		   	<div id="goodsWrap" class="mgt50">
			   	<h3>굿즈판매</h3>
			   	<div class="goodslist">
			   		<p class="goodImg"><img width="200" height="200" src="${pageContext.request.contextPath}/resources/image/goods1.jpg"></p>
			   		<div class="good_r">
			   			<div class="goodsTitle">앤서니 브라운 </div>
			   			<div class="goodsText">이상한 나라의 엘리스 직소퍼즐300피스</div>
			   			<button type="button" class="btn btn-outline-secondary"
					        style="--bs-btn-padding-y: .35rem; --bs-btn-padding-x: .7rem; --bs-btn-font-size: .85rem;">
					 바로가기
					</button>
			   		</div>
			   		
			   	</div>	
			   	<div class="goodslist floatR">
			   	<p class="goodImg"><img width="200" height="200" src="${pageContext.request.contextPath}/resources/image/goods2.jpg"></p>
			   		<div class="good_r">
			   			<div class="goodsTitle">하리보 골드베렌 100주년</div>
			   			<div class="goodsText">이상한 나라의 엘리스 직소퍼즐300피스<br> QR code를 촬영해 보세요</div>
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