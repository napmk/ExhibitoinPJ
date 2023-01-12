<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/join.js"></script>
<title>전시회 예매</title>
</head>
<body>
	<%@ include file="../inc/header.jsp" %>
	<div id="loginWrap" class="mgt100">
			<h3 class="mgb20">회원정보 수정 확인</h3>
			<form action="memberModifyOk" method="post" name="join_frm">
				<div>
					<label class="form-label" >아이디</label>
					<div>${memberDto.mid }</div>
					
				</div>
				<div class="mgt8">
					<label class="form-label">비밀번호</label>
					<div>${memberDto.mpw }</div>
				
				</div>
				<div class="mgt8">
					<label class="form-label" >이름</label>
					<div>${memberDto.mname }</div>
				
				</div>
				<div class="mgt8">
					<label class="form-label" >이메일</label>
					<div>${memberDto.memail }</div>
				
				</div>			
				
				<div class="btn2set mgt20">
					<div class="firbtn"><input class="btn btn-secondary" type="button" value="정보수정" onclick="script:window.location='mypage'"></div>
					<div class="secbtn"><input class="btn btn-secondary" type="button" value="수정완료" onclick="script:window.location='/'"></div>
			   </div>
			</form>	
		</div>
	

	<%@ include file="../inc/footer.jsp" %>
</body>
</html>