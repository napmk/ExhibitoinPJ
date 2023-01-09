<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회예매</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reservation.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/jquery-ui.css">

<script type="text/javascript">
      <!--      달력 추가 js 시작       -->
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#pickDate" ).datepicker({
            	 showOn: "button",
                 buttonImage:"${pageContext.request.contextPath }/resources/image/icon_cal.png",
                 buttonImageOnly: true,
            	 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 minDate: 0,
                 maxDate: "+10Y",                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( rday ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", rday );
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
                 dateFormat: "yy-mm-dd",
                 
                 maxDate: "+2Y",                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( rday ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", rday );
                 }    
 
            });    
    });
    
   
    <!--      달력 추가 js 끝       -->
</script>
</head>
<body>
<%@ include file="../inc/header.jsp" %>
	<div id="loginWrap" class="mgt100">
		<h3>예매하기</h3>
		
	   <form action ="ticketingOk?num=${param.num}" method="post" class="mgt20"> 
	   <input type="hidden" value="${ticket.tnum }" name="tnum">
	      <form action="reservationOk" method="post" name="reservation_frm">
	        <div>
				<label class="form-label" >아이디</label>
				<input class="form-control" type="text" name="mid" value="${memberId}">
			</div>
			<div class="mgt8">
				<label class="form-label" >전시회 이름</label>
				<input class="form-control" type="text" name="ticketName" value="${ticket.ticketName}">
			</div>
			<div class="mgt8">
				<label class="form-label" >관람날짜</label>
				<input class="form-control" id="pickDate" type="text" name="rday">
			</div>
			<div class="mgt8">
				<label class="form-label" >가격</label>
				<input class="form-control" type="text" name="price" value="${ticket.price}">
				<select name="count" class="form-select form-select-sm" style="margin-top:4px">
					  <option selected>구매장수를 선택해 주세요</option>
					  <option value="1">1</option>
					  <option value="2">2</option>
					  <option value="3">3</option>
					  <option value="4">4</option>
					  <option value="5">5</option>
					  
					</select>

				
			</div>
   
		   <!-- 버튼 -->
		   <div class="btn2set mgt20">
			   <div class="firbtn"><input type="submit" value="예매하기" class="btn btn-warning my-2"></div>
			   <div class="secbtn"><input type="button" value="예매취소"  class="btn btn-secondary"  onclick="script:window.location='index'"></div>
		   </div>
		   <!-- //버튼 -->
		         </form>
		 </form>                        
    </div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>