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
		<h2 style="font-weight:700">${stitle}</h2>
		<h3 class="mgb40">예매가 완료 되었습니다.</h3>
		
	     
	        <div>
				<label class="form-label" >예매한 아이디 :</label>
				${userid}
			</div>
			<div class="mgt8">
				<label class="form-label" >전시회 이름 : </label>
				${stitle}
			</div>
			<div class="mgt8">
				<label class="form-label" >관람날짜 : </label>
				 ${selectedDate }
			</div>
			<div class="mgt8">
				<label class="form-label" >관람연령 : </label>
				 ${sage }
			</div>
			
			
			<div class="mgt8">
				<label class="form-label" >1장당 가격 : </label>
				${sprice }원
			</div>
			<div class="mgt8">
				<label class="form-label" >매 수 : </label>
				 ${count }장
			</div>
			<div class="mgt8 mgb40">
				<label class="form-label" >총 구매한 가격 : </label>
				${count * sprice } 원
			</div>
			
		
									
			<!-- 버튼 -->
			<div class="btn2set mgt20">
		   		<div style="width:100%"><input  class="btn btn-dark" type="button" value="확인" onclick="script:window.location='/'"></div>
		   	</div>	
			<!-- //버튼 -->
		   
	                       
    </div>
 
<%@ include file="../inc/footer.jsp" %>
</body>
</html>