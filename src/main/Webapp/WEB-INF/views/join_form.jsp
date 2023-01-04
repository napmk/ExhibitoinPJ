<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
nav{display:none}
</style>
</head>
<body>
	<%@ include file="inc/header.jsp" %>
	<div id="loginWrap" class="mgt100">
		<a href="/" class="center">Ticketaid</a>
		<form action="joinOk" method="post" name="join_frm">
	
			<div>
				<label class="form-label">아이디</label>
				<input type="text" name="mid" class="form-control" placeholder="아이디를 입력해주세요">
			</div>
			<div class="mgt20">
				<label class="form-label">비밀번호</label>
				<input type="password" name="mpw" class="form-control"  placeholder="비밀번호를 입력해주세요">
			</div>
			<div class="mgt20">
				<label class="form-label" >이름</label>
				<input type="text" name="mname" class="form-control" placeholder="이름을 입력해주세요" >
			</div>
			<div class="mgt20">
				<label class="form-label" >이메일</label>
				<input type="text" name="memail" class="form-control" placeholder="이메일을 입력해주세요">
			</div>
			<div class="btn2set mgt20">
				<div class="firbtn"><input type="submit" value="회원가입" class="btn btn-warning my-2" onclick="joinCheck()"></div>
				<div class="secbtn"><input type="text" value="취소" class="btn btn-secondary" onclick="window.open('/')"></div>
			</div>
		
			
		</form>
	</div>		
	<%@ include file="inc/footer.jsp" %>
</body>
</html>