<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
nav{display:none}
</style>
</head>
<body>
	<%@ include file="inc/header.jsp" %>
		<div id="loginWrap" class="mgt100">
			<a class="mgb20 center" href="/" ><img src="${pageContext.request.contextPath}/resources/image/logo5.jpg" style="width: 150px;"></a>
			<form action="loginOk" method="post" class="mgt20">
				<div>
					<label class="form-label" placeholder="아이디를 입력해주세요">아이디</label>
					<input type="text" name="mid" class="form-control">
				</div>
				<div class="mgt8">
					<label class="form-label" placeholder="비밀번호를 입력해주세요">비밀번호</label>
					<input type="password" name="mpw" class="form-control">
				</div>			
				<input type="submit" value="로그인" class="btn btn-dark my-2 mgt20" style="width:100%">
			</form>	
			<div class="memberckBox">
				<ul>
					<li><a href=" ">비밀번호 찾기<a></li>
					<li><a href=" ">아이디 찾기</a></li>
					<li><a href="join">회원가입</a></li>
				</ul>
			</div>
			<a class="login_banner" href="/showview?snum=12">
				<img src="${pageContext.request.contextPath}/resources/image/banner01.jpg">
			</a>
		</div>
	  <%@ include file="inc/footer.jsp" %>		
</body>
</html>