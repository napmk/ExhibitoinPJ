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
			    <tr>
			      <th scope="row">1</th>
			      <td>뮤지컬 〈물랑루즈!〉 아시아 초연 (Moulin Rouge! The Musical)</td>
			      <td>2022.12.16</td>
			      <td>admin</td>
			    </tr>
			   <tr>
			      <th scope="row">2</th>
			      <td>뮤지컬 〈빨래〉</td>
			      <td>2022.12.16</td>
			      <td>admin</td>
			    </tr>
			    <tr>
			      <th scope="row">3</th>
			      <td>뮤지컬 [우리가 사랑했던 그날]</td>
			      <td>2022.12.31</td>
			      <td>admin</td>
			    </tr>
			  </tbody>
		</table>
		<button type="button" class="btn btn-dark" onclick="location.href='showwrite' ">공연등록하기</button>
	</div>
	<%@ include file="../inc/footer.jsp" %>

</body>
</html>