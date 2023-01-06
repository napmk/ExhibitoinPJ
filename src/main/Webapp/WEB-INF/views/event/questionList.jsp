<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../inc/header.jsp" %>
	<div id="wrapper" class="mgt50">
		<div>
		<h4>HOT 이벤트</h4>
			<ul>
			<c:forEach items="${qdtos }" var="qdto">
				
				<li>
					<a href="questionView?qnum=${qdto.qnum }">
					<div class="card" style="width: 18rem;">
					  <img src="..." class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title">Card title</h5>
					    <p class="card-text">
							
								<c:choose>
									<c:when test="${fn:length(qdto.qcontent) > 23 }">
										<c:out value="${fn:substring(qdto.qcontent,0,22) }"></c:out>...
									</c:when>
									<c:otherwise>
											<c:out value="${qdto.qcontent }"></c:out>
										</c:otherwise>
								 </c:choose>
							
						</p>
					    <div>${fn:substring(qdto.qdate,0,10) }</div>
					  </div>
					</div>
					</a>
				</li>
				
				
					
			</c:forEach>			
						
				<li>
					<div class="card" style="width: 18rem;">
					  <img src="..." class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title">Card title</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn btn-primary">Go somewhere</a>
					  </div>
					</div>
				</li>
				
				<li>
					<div class="card" style="width: 18rem;">
					  <img src="..." class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title">Card title</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn btn-primary">Go somewhere</a>
					  </div>
					</div>
				</li>
				<li>
					<div class="card" style="width: 18rem;">
					  <img src="..." class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title">Card title</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn btn-primary">Go somewhere</a>
					  </div>
					</div>
				</li>
				
			</ul>
		</div>
	
	
		<table class="table">
			<thead>
				<tr>
					<th scope="col">no</th>
					<th scope="col">이벤트제목</th>
				    <th scope="col">글쓴이</th>
					<th scope="col">등록일</th>
				</tr>
			 </thead>
			<tbody class="table-group-divider">
				<c:forEach items="${qdtos }" var="qdto">
					<tr>
					   <td scope="row">${qdto.qnum } </td>
					    <td>
					      <a href="questionView?qnum=${qdto.qnum }">
							<c:choose>
								<c:when test="${fn:length(qdto.qcontent) > 23 }">
									<c:out value="${fn:substring(qdto.qcontent,0,22) }"></c:out>...
								</c:when>
								<c:otherwise>
									<c:out value="${qdto.qcontent }"></c:out>
								</c:otherwise>
						  </c:choose>
						</a>
						</td>
					   <td>${qdto.qname }</td>
					   <td>${fn:substring(qdto.qdate,0,10) }</td>
					</tr>
			   </c:forEach> 
			</tbody>
				 
		</table>
		<!-- 페이징 -->
		<div class="paging">
			<c:if test="${pageMaker.prev }">
				<a href="event?pageNum=${pageMaker.startPage-5 }">Prev</a>&nbsp;&nbsp;&nbsp;
			</c:if>										
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
				<c:choose>
					<c:when test="${currPage == num}">
						<u>${num}</u>&nbsp;&nbsp;&nbsp;
					</c:when>
					<c:otherwise>
						<a href="event?pageNum=${num}">${num}</a>&nbsp;&nbsp;&nbsp;
					</c:otherwise>
				</c:choose>																					
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<a href="event?pageNum=${pageMaker.startPage+5 }">Next</a>
			</c:if>	
		</div>
		<!-- //페이징 -->
				
						
		<button type="button" class="btn btn-dark" onclick="location.href='eventwrite' ">이벤트 등록하기</button>
		</div>
	
	
	<%@ include file="../inc/footer.jsp" %>
</body>
</html>