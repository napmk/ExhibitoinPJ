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
			<h3 class="mgb20">내 정보 수정</h3>
			<form action="memberModifyOk" method="post" name="join_frm">
				<div>
					<label class="form-label" >아이디</label>
					<input class="form-control"  type="text" name="mid" value="${memberDto.mid }" readonly="readonly" >
				</div>
				<div class="mgt8">
					<label class="form-label" placeholder="비밀번호를 입력해주세요">비밀번호</label>
					<input type="password" name="mpw" class="form-control">
				
				</div>
				<div class="mgt8">
					<label class="form-label" >비밀번호 확인</label>
					<input  class="form-control" type="password" name="mpw" placeholder="비밀번호를 입력해주세요">
				
				</div>
				<div class="mgt8">
					<label class="form-label" >이름</label>
					<input class="form-control" type="text" name="mname" value="${memberDto.mname }">
				
				</div>
				<div class="mgt8 mgb20">
					<label class="form-label" placeholder="비밀번호를 입력해주세요">이메일</label>
					<input class="form-control" type="text" name="memail" value="${memberDto.memail }">
				
				</div>			
				
				<div class="btn2set">
					<div class="firbtn"><input type="submit" value="수정완료" class="btn btn-warning my-2" onclick="joinCheck()"></div>
					<div class="secbtn"><input class="btn btn-secondary" type="button" value="취소" onclick="script:window.location='index'">
					<input type="button" class="btn btn-danger"   value="회원탈퇴" onclick="script:window.location='memberDelete'"></input>
			   </div>
			</form>	
		</div>
		

	<%@ include file="../inc/footer.jsp" %>
</body>
</html>