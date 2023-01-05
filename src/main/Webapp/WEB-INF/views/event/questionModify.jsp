<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/board.js"></script>
<title></title>
</head>
<body>	
	<%@ include file="../inc/header.jsp" %>
	
	<div id="loginWrap" class="mgt100">
			<h3>이벤트 페이지 수정</h3>
			<form action="questionModify" method="post" name="board_frm">
			<input type="hidden" value="${qdto.qnum }" name="qnum">
				<div class="mb-3 mgt20">
					<label class="form-label" >아이디</label>
					<input class="form-control"  type="text" name="qid" value="${qdto.qid }" readonly="readonly">
				</div>
				<div class="mb-3 mgt20">
					<label class="form-label" >이름</label>
					<input class="form-control"  type="text" name="qname" value="${qdto.qname }" >
				</div>
				<div class="mb-3 mgt20">
					<label class="form-label" >내용</label>
					<div class="form-floating">
						  <textarea class="form-control" name="qcontent"  style="height: 100px">${qdto.qcontent}</textarea>
						  <label for="floatingTextarea2">이벤트 내용을 수정해주세요</label>
					 </div>
				</div>
				<div class="mb-3 mgt20">
					<label class="form-label" >등록일</label>
					<input class="form-control" type="text" name="qdate" value="${qdto.qdate }">
				
				</div>
				<div class="mb-3 mgt20">
					<label class="form-label" >이메일</label>
					<input class="form-control" type="text"  name="qemail" value="${qdto.qemail }"></td>
				
				</div>			
				
				<div class="btn2set mgt20">
					<div class="firbtn"><input type="submit" value="수정완료" class="btn btn-warning my-2"></div>
					<div class="secbtn"><input class="button_type01" type="button" value="삭제" onclick="script:window.location='questionDelete?qnum=${qdto.qnum}'"></div>
					<div class="secbtn"><input class="button_type01" type="button" value="글목록" onclick="script:window.location='list'"></div>
			   
			                            									
									
			   </div>
			</form>	
		</div>
		
	

	<%@ include file="../inc/footer.jsp" %>
</body>
</html>