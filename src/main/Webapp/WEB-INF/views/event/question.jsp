<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/board.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha512-rxThY3LYIfYsVCWPCW9dB0k+e3RZB39f23ylUYTEuZMDrN/vRqLdaCBo/FbvVT6uC2r0ObfPzotsfKF9Qc5W5g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/datepicker.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/jquery-ui.css">
<title>이벤트 등록하기</title>
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
					  <label for="exampleFormControlInput1" class="form-label" placeholder="제목을 입력해주세요">이벤트제목</label>
					  <input class="form-control" type="text" name="qname" >
				</div>
				<div class="mb-3">
					  <label class="form-label">이벤트 내용</label>
					  <div class="form-floating">
						  <textarea class="form-control" name="qcontent" placeholder="내용을 입력해주세요" style="height: 100px"></textarea>
						  <label for="floatingTextarea2">이벤트 내용을 입력해주세요</label>
					  </div>
				</div>
				<div class="mb-3">
					  <label class="form-label">이벤트 기간</label>
					  	<div class="input-group mb-3">
						  <span class="input-group-text" id="basic-addon1">day</span>
						   <input type="text" id="pickDate" name="qemail"  class="form-control" placeholder="이벤트기간을 선택해주세요">
						</div>
				</div>
				
			   <!-- 이벤트 이미지  -->
				 <div class="mb-3" >
					  <label for="exampleFormControlTextarea1" class="form-label">이벤트 이미지등록</label>
					  <input type="file" name="files" class="form-control"  placeholder="이미지를 등록해주세요" value="">
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