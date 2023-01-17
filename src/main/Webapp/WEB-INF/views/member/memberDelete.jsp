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
	    <div id="loginWrap" class="mgt100">
			<h3 class="mgb20">회원탈퇴</h3>
	    	<form action="memberDeleteOk" method="post">
		       	<div>
		       		<label class="form-label">아이디 </label>
		   			<input type="text" class="form-control" value="${memberId }" name="mid" readonly="readonly" >
				</div>
				<div class="mgt8">
					<span class="content_text01">비밀번호 </span>
					<input type="password" name="mpw" class="form-control">
				</div>
				
				<div class="btn2set mgt20">
					<div class="firbtn"><input type="submit" class="btn btn btn-secondary"  value="회원탈퇴"></div>
					<div class="secbtn"><input type="button" class="btn btn-dark" value="돌아가기" onclick="script:window.location='index'"></div>
			   </div>
			   
			   

	        </form>
		</div>	
<%@ include file="../inc/footer.jsp" %>	
</body>
</html>