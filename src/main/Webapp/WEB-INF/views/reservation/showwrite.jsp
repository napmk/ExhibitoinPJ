<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/board.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha512-rxThY3LYIfYsVCWPCW9dB0k+e3RZB39f23ylUYTEuZMDrN/vRqLdaCBo/FbvVT6uC2r0ObfPzotsfKF9Qc5W5g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/datepicker.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/jquery-ui.css">
<title>예약뷰페이지</title>

<style>
.checked {
  color: orange;
}
</style>

</head>

<body>

<%@ include file="../inc/header.jsp" %>


	<div id="centerWrap">
	   	
	   		<form action="writeOk" method="post" enctype="multipart/form-data">
	   			<input type="hidden" name="_csrf" value="66d7889b-8c0c-48ad-9f7f-54ba1d2d71e8">
	   			<h2 class="mgt50">공연등록하기</h2>
		   		<div class="mb-3 mgt20">
					  <label for="exampleFormControlInput1" class="form-label">공연제목</label>
					  <input type="text" class="form-control" name="stitle"  placeholder="제목을 입력해주세요" value="">
				</div>
				<div class="mb-3">
					  <label for="exampleFormControlTextarea1" class="form-label">공연장소</label>
					  <input type="text" class="form-control" name="slocation"  placeholder="장소를 입력해주세요" value="">
				</div>
				
			    <div class="mb-3">
					  <label for="exampleFormControlTextarea1" class="form-label">공연날짜</label>
					 
					  	<div class="input-group mb-3">
						  <span class="input-group-text" id="basic-addon1">@</span>
						   <input type="text" id="pickDate" name="sdday"  class="form-control" placeholder="공연날짜를 선택해주세요">
						</div>
				</div>
				<div class="mb-3">
					  <label for="exampleFormControlTextarea1" class="form-label">공연시간</label>
					  <input type="text" class="form-control" name="stime"  placeholder="시간을 입력해주세요" value="">
				</div>
				<div class="mb-3">
					  <label for="exampleFormControlTextarea1" class="form-label">관람연령</label>
					  <input type="text" class="form-control" name="sage"  placeholder="관람연령을 입력해주세요" value="">
				</div>
				<div class="mb-3">
					  <label for="exampleFormControlTextarea1" class="form-label">가격</label>
					  <input type="text" class="form-control" name="sprice"  placeholder="가격을 입력해주세요" value="">
				</div>
				<div class="mb-3">
					  <label for="exampleFormControlTextarea1" class="form-label">공연이미지등록</label>
					  <input type="file" name="files" class="form-control"  placeholder="포스터 이미지를 등록해주세요" value="">
				</div>
				<div class="mb-3">
					  <label for="exampleFormControlTextarea1" class="form-label">공연타입</label>
					   <select name="skind" class="form-select">
			                <option value="콘서트">콘서트</option>
			                <option value="연극">연극</option>
			                <option value="어린이/가족">어린이/가족</option>
			                <option value="뮤지컬">뮤지컬</option>
			                <option value="클래식">클래식</option>
			                <option value="전시회">전시회</option>
			              </select>
			            </div>
            
			
				<div class="btn2set mgt20">
					<div class="firbtn"><input type="submit" value="등록하기"  class="btn btn-dark"></div>
					<div class="secbtn"><input type="text" value="취소" class="btn btn-secondary" onclick="window.open('index')" ></div>
				</div>
				
			
	   		</form>
	   </div>

	

<%@ include file="../inc/footer.jsp" %>
</body>
</html>