<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Search</title>

<!-- 검색 스크립트 -->
  <script>
  window.console = window.console || function(t) {};
  
  if (document.location.search.match(/type=embed/gi)) {
	    window.parent.postMessage("resize", "*");
	  }
</script>
<!-- //검색 스크립트 -->
  <style>


/* Base styling */


</style>

</head>
<body>
	<%@ include file="inc/header.jsp" %>
	

	
	<div id="wrapper" class="mgt50">
		<!-- total search  -->
		<div id="total_search">
			<div id="total" class="count-total"><i class="material-icons" style="font-size: 18px;">lyrics</i> 총 <b>${boardCount }</b>개의 공연정보가 있습니다.</div>
	          
	          <!-- 검색 -->
	
          
	          
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
	          <!-- //검색 -->
	        </div> 
	        <!-- //total search 끝 -->
        
		<table class="table mgt40">
			  <thead>
			    <tr>
				  <th scope="col">번호</th>
				  <th scope="col">공연제목</th>
				  <th scope="col">공연위치장소</th>
				  <th scope="col">공연날짜</th>
				  <th scope="col">공연시간</th>
				  <th scope="col">관람나이</th>
				  <th scope="col">공연가격</th>
				  <th scope="col">공연종류</th>
				 </tr>
			  </thead>
			  <tbody class="table-group-divider">
					<c:forEach items="${qdtos }" var="showDto">
					<tr>
						<td class="board_content01">${showDto.snum }</td>
						<td class="board_content01">${showDto.stitle }</td>
					    <td class="board_content01">${showDto.slocation }</td>
						<td class="board_content01">${showDto.sdday }</td>
						<td class="board_content01">${showDto.stime }</td>
						<td class="board_content01">${showDto.sage }</td>
						<td class="board_content01">${showDto.sprice }</td>
						<td class="board_content01">${showDto.skind }</td>
					</tr>	
					</c:forEach>
					
				</tbody>
		</table>
		
		
		 
		 
		<!-- 페이징 -->
		<div class="paging">
			<c:if test="${pageMaker.prev }">
				<a href="boardList?pageNum=${pageMaker.startPage-5 }">Prev</a>&nbsp;&nbsp;&nbsp;
			</c:if>										
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="snum">
				<c:choose>
					<c:when test="${currPage == snum}">
						<u>${snum}</u>&nbsp;&nbsp;&nbsp;
					</c:when>
					<c:otherwise>
						 <a href="boardList?pageNum=${snum}&searchKey=${searchKeyValue}&searchOption=${searchKeyOption}">${snum}</a>
					</c:otherwise>
				</c:choose>																					
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<a href="boardList?pageNum=${pageMaker.startPage+5 }">Next</a>
			</c:if>	
		</div>
		<!-- //페이징 -->
	
	</div>
	<%@ include file="inc/footer.jsp" %>
</body>
</html>