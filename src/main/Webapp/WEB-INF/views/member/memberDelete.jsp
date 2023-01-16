<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>

	<%@ include file="../inc/header.jsp" %>
	    
	    	<form action="memberDeleteOk" method="post">
		       	<div class="input-form-box">
		       		<span class="content_text01">아이디 </span>
		   			<input type="text" class="form-control" value="${memberId }" name="mid" style="width:30%">
				</div>
				<div class="input-form-box">
					<span class="content_text01">비밀번호 </span>
					<input type="password" name="mpw" class="form-control" style="width:30%">
				</div>
				<div class="button-login-box" >
					<input type="submit" class="btn btn-dark btn-xs" 
					style="width:30%" value="회원탈퇴">
					
					<input type="button" class="btn btn-dark btn-xs" 
					style="width:30%" value="돌아가기" onclick="script:window.location='index'">
				</div>
	        </form>
				
<%@ include file="../inc/footer.jsp" %>	
</body>
</html>