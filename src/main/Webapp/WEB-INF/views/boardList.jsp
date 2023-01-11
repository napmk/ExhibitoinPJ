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

.menutop_search{width:200px; float:right; margin-top:6px}
.search__input {
        width: 100%;
        padding: 8px 20px;
        background-color: transparent;
        transition: transform 250ms ease-in-out;
        font-size: 14px;
        line-height: 18px;
        color: #575756;
        background-color: transparent;
        background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E%3Cpath d='M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z'/%3E%3Cpath d='M0 0h24v24H0z' fill='none'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-size: 18px 18px;
        background-position: 95% center;
        border-radius: 50px;
        border: 1px solid #575756;
        transition: all 250ms ease-in-out;
        backface-visibility: hidden;
        transform-style: preserve-3d;
    }

.search__input::placeholder {
            color: rgba(87, 87, 86, 0.8);
            letter-spacing: 1.5px;
        }

.search__input:hover,
        .search__input:focus {
            padding: 8px 0;
            outline: 0;
            border: 1px solid transparent;
            border-bottom: 1px solid #575756;
            border-radius: 0;
            background-position: 100% center;
        }

.credits__container {
        margin-top: 24px;
    }

.credits__text {
        text-align: center;
        font-size: 13px;
        line-height: 18px;
    }

.credits__link {
        color: #ff8b88;
        text-decoration: none;
        transition: color 250ms ease-in;
    }

.credits__link:hover,
        .credits__link:focus {
            color: rgb(191, 137, 135);
        }
        
        /*showlist*/
#search{float:right;width: 400px;  }
#search .search_select{width: 120px;float:left;margin-right:4px} 
#search .search_input{float:left;width:200px;margin-right:4px}
#search .search_btn{float:left}	
</style>

</head>
<body>
	<%@ include file="inc/header.jsp" %>
	
	<div id="wrapper" class="mgt50">
		<!-- total search  -->
		<div id="total_search">
			<div id="total">▷ 총 ${boardCount }개의 게시물이 있습니다.</div>
	          
	          <!-- 검색 -->
	          <form action="search_list">
	          <div id="search">
	            <div class="search_select">
	              <select name="searchOption" class="form-select">
	                <option value="stitle">공연제목</option>
	                <option value="slocation">공연위치장소</option>
	                <option value="sprice">공연가격</option>
	              </select>
	            </div>
	            <div class="search_input">
					<div class="search__container">
						<input class="search__input" type="text" placeholder="Search">
					</div>
			      </div>
	          </div>
	          </form>
	          <!-- //검색 -->
	        </div> 
	        <!-- //total search 끝 -->
        
		<table class="table">
			  <thead>
			    <tr>
				  <th scope="col">번호</th>
				  <th scope="col">공연제목</th>
				  <th scope="col">공연위치장소</th>
				  <th scope="col">공연날짜</th>
				  <th scope="col">공연시간</th>
				  <th scope="col">관람나이</th>
				  <th scope="col">공연가격</th>
				 </tr>
			  </thead>
			  <tbody class="table-group-divider">
					 <c:forEach items="${boardList }" var="showDto">
					<tr>
						<td class="board_content01">${showDto.snum }</td>
						<td class="board_content01">${showDto.stitle }</td>
						<td class="board_content01">${showDto.slocation }</td>
						<td class="board_content01">${showDto.sdday }</td>
						<td class="board_content01">${showDto.stime }</td>
						<td class="board_content01">${showDto.sage }</td>
						<td class="board_content01">${showDto.sprice }</td>
					</tr>	
					</c:forEach>
					<tr>
						<td colspan="5" align="center">
							<c:if test="${pageMaker.prev }">
								<a href="boardList?pageNum=${pageMaker.startPage-5 }">Prev</a>&nbsp;&nbsp;&nbsp;
							</c:if>										
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="snum">
								<c:choose>
									<c:when test="${currPage == snum}">
										<u>${snum}</u>&nbsp;&nbsp;&nbsp;
									</c:when>
								<c:otherwise>
									<a href="boardList?pageNum=${snum}">${snum}</a>&nbsp;&nbsp;&nbsp;
								</c:otherwise>
								</c:choose>																					
							</c:forEach>
							<c:if test="${pageMaker.next }">
								<a href="boardList?pageNum=${pageMaker.startPage+5 }">Next</a>
							</c:if>	
						</td>
					</tr>	
				</tbody>
		</table>
		
	
	<%@ include file="inc/footer.jsp" %>
</body>
</html>