<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연뷰페이지</title>
</head>
<body>
	<%@ include file="../inc/header.jsp" %>
	<div id="wrapper" class="mgt50">
	<!-- 검색기능 -->
	
  <form action="boardList" >
	 <div id="search">
	     <div class="search_select">
	         <select name="searchOption" class="form-select">
	             <option value="stitle">공연제목</option>
	             <option value="slocation">공연위치장소</option>
	             <option value="sprice">공연가격</option>
	             <option value="skind">공연종류</option>
	         </select>
	      </div>
	      <div class="search_input">
		     <div class="search__container">
				<div class="input-search"><input class="search__input" type="text" name="searchKey" placeholder="Search"></div>
          		<div class="btn-search"><input type="submit" class="btn btn-secondary" value="검색" ></div>
			</div>
		</div>
	</div>
  </form>
      <!-- //검색기능 -->    
		<div class="container">
			<ul class="reservationWrap">
				<c:forEach items="${showList}" var="showDto" begin="0" end="11" step="1">
				<li class="mgb40">
					<div class="img_title_wrap">
						<p class="poster_title">${showDto.stitle}</p>
							<!-- 포스터이미지 -->
								<div class="exhiPoster">
									<a href="showview?snum=${showDto.snum}" class="banner_img">
										<c:if test="${showDto.fileDto.fileextension =='jpg' or showDto.fileDto.fileextension =='png' or showDto.fileDto.fileextension =='bmp' or showDto.fileDto.fileextension =='gif'}">
									        <img width="280"  height="360" src="${pageContext.request.contextPath}/resources/uploadfiles/${showDto.fileDto.filename}">
									    </c:if>
									     <div class="hover_text">
									        <ul>
									            <li class="ht_title">${showDto.stitle}</li>
									         	<li class="ht_location">${showDto.slocation}</li>
									         	<li class="ht_price">${showDto.sprice}</li>
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
	<%@ include file="../inc/footer.jsp" %>

</body>
</html>