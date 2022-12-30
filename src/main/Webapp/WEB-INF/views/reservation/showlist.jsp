<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연등록페이지</title>
</head>
<body>
	<%@ include file="../inc/header.jsp" %>
	<div id="wrapper" class="mgt50">
		<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">no</th>
			      <th scope="col">공연제목</th>
			      <th scope="col">공연날짜</th>
			      <th scope="col">글쓴이</th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider">
			  <c:forEach items="${showList}" var="showDto">
			    <tr>
			      <th scope="row">${showDto.snum} </th>
			      <td>
			      	  <a href="showview?snum=${showDto.snum}">${showDto.stitle}</a>
			      	</td>
			      <td>${showDto.stime}</td>
			      <td>${showDto.userid}</td>
			    </tr>
			  </c:forEach> 
			  </tbody>
		</table>
		<button type="button" class="btn btn-dark" onclick="location.href='showwrite' ">공연등록하기</button>
	</div>
	<%@ include file="../inc/footer.jsp" %>

</body>
</html>