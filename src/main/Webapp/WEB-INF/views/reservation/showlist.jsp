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
	
	<form action="search_list">
          <div id="search">
            <div class="search_select">
              <select name="searchOption" class="form-select">
                <option value="stitle">공연제목</option>
                <option value="sdday">공연날짜</option>
                <option value="kind">공연종류</option>
              </select>
            </div>
            <div class="search_input"><input type="text"  class="form-control" name="searchKey" placeholder="제목,날짜,공연스타일"></div>
            <div class="search_btn"><input type="image"></div>
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
								<button type="button" class="btn btn-primary" onclick="location.href='showview?snum=${showDto.snum}' ">예매하기</button>
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