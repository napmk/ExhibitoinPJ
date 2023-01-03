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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/jquery-ui.css">
<title>예약뷰페이지</title>

<style>
.checked {
  color: orange;
}
</style>
<script type="text/javascript">


      <!--      달력 추가 js 시작       -->
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#pickDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 minDate: 0,
                 maxDate: "+10Y",                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", selectedDate );
                 }    
 
            });
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 
                 maxDate: "+2Y",                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
                 }    
 
            });    
    });
    
   
    <!--      달력 추가 js 끝       -->

</script>
</head>

<body>

<%@ include file="../inc/header.jsp" %>

	<div id="wrapper" class="boardWrap">
	<div id="centerWrap">
	   	
	   		<form action="writeOk" method="post" enctype="multipart/form-data">
	   			<input type="hidden" name="_csrf" value="66d7889b-8c0c-48ad-9f7f-54ba1d2d71e8">
	   			<h2>공연등록하기</h2>
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
				<div class="btn2set mgt20">
					<div class="firbtn"><input type="submit" value="등록하기"  class="btn btn-dark"></div>
					<div class="secbtn"><input type="text" value="취소" class="btn btn-secondary" onclick="window.open('index')" ></div>
				</div>
	   		</form>
	   </div>

	

<%@ include file="../inc/footer.jsp" %>
</body>
</html>