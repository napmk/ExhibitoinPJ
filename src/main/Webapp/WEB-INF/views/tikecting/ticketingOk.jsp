<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<title>예매 확인 후 결제</title>
</head>
<body>
<%@ include file="../inc/header.jsp" %>

	<div id="loginWrap" class="mgt100">
		<h2 style="font-weight:700">${ticketName}</h2>
		<h3>예매가 완료 되었습니다.</h3>
		
	   <form action ="ticketingOk?num=${param.num}" method="post" class="mgt20"> 
	   <input type="hidden" value="${ticket.tnum }" name="tnum">
	      <form action="reservationOk" method="post" name="reservation_frm">
	        <div>
				<label class="form-label" >예매한 아이디 :</label>
				${id}
			</div>
			<div class="mgt8">
				<label class="form-label" >전시회 이름 : </label>
				${ticketName}
			</div>
			<div class="mgt8">
				<label class="form-label" >관람날짜 : </label>
				 ${rday }
			</div>
			
			
			<div class="mgt8">
				<label class="form-label" >1장당 가격 : </label>
				${price }원
			</div>
			<div class="mgt8">
				<label class="form-label" >매 수 : </label>
				 ${count }장
			</div>
			<div class="mgt8">
				<label class="form-label" >총 구매한 가격 : </label>
				${price * count } 원
			</div>
			
			<input type="hidden" name = "id" value="${mid} }">
			<input type="hidden" name = "ticketName" value="${ticketName}">
			<input type="hidden" name = "selectedDate" value="${selectedDate}">
			<input type="hidden" name = "ticketName" value="${count}">
									
			<!-- 버튼 -->
			<div class="btn2set mgt20">
		   		<div style="width:100%"><input  class="btn btn-secondary" type="button" value="확인" onclick="script:window.location='ticket'"></div>
		   	</div>	
			<!-- //버튼 -->
		         </form>
		 </form>                        
    </div>
 
<%@ include file="../inc/footer.jsp" %>
</body>
</html>