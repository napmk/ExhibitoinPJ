<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/board.js"></script>
<title>views</title>
</head>
<body>
	<%@ include file="../inc/header.jsp" %>


	<div id="centerWrap">
	   	
	   		<form action="questionOk" method="post" name="board_frm">
	   			
	   			<h2 class="mgt50">이벤트등록하기</h2>
		   		<div class="mb-3 mgt20">
					  <label for="exampleFormControlInput1" class="form-label">작성자</label>
					  <input class="form-control" type="text" name="qid" value="${memberId }" readonly="readonly">
				</div>
				<div class="mb-3 mgt20">
					  <label for="exampleFormControlInput1" class="form-label">이름</label>
					  <input class="form-control" type="text" name="qname" >
				</div>
				<div class="mb-3">
					  <label class="form-label">이벤트 제목</label>
					  <div class="form-floating">
						  <textarea class="form-control" name="qcontent" placeholder="제목을 입력해주세요" style="height: 100px"></textarea>
						  <label for="floatingTextarea2">이벤트 내용을 입력해주세요</label>
					  </div>
				</div>
				<div class="mb-3">
					  <label class="form-label">이벤트 기간</label>
					 	<input class="form-control" type="text" name="qemail" >
				</div>
				
			   <!-- 이벤트 이미지  -->
				 <div class="mb-3" style="display:none">
					  <label for="exampleFormControlTextarea1" class="form-label">이벤트 이미지등록</label>
					  <input type="file" name=" " class="form-control"  placeholder="이미지를 등록해주세요" value="">
				</div>
				
				<div class="btn2set mgt20">
					<div class="firbtn"><input class="btn btn-dark" type="button" value="등록하기" onclick="boardCheck()"> </div>
					<div class="secbtn"><input type="text" value="취소" class="btn btn-secondary" onclick="window.open('/')" ></div>
				</div>
				
			
	   		</form>
	   </div>
	   


	<%@ include file="../inc/footer.jsp" %>
</body>
</html>