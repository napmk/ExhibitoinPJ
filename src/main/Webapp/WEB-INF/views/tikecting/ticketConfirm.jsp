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
<style>
.card-smtitle{font-size:12px;color:#999;margin-bottom:4px}
.card-date{font-size:14px;color:#000}
</style>

<div id="wrapper" class="confirm-cancel-wrap mgt50" >
	<h5>예매 확인 및 취소</h5>
	 <form action="ticketDelete" method="get" >
        <ul class="mgt8">
		 <c:forEach items="${ticketConfirmList}" var="ticketRev">
			<li>
				<div class="card" style="width: 18rem;">
				  <div class="card-body">
				    <h5 class="card-smtitle">예매번호 : ${ticketRev.snum }</h5>
				    <h5 class="card-title">${ticketRev.stitle }</h5>
				    <h5 class="card-date">공연 날짜 : ${ticketRev.sdday }</h5>
				    <p class="card-count">매수 : ${ticketRev.count  } 장</p>
				    <p class="card-price">한 장당 가격 : ${ticketRev.sprice  }</p>
				    <input class="btn btn-outline-dark mgt8" type="button" value="예매취소" onclick="script:window.location='ticketDelete?tnum=${ ticketRev.snum}'">
				  </div>
				</div>
			</li>
			</c:forEach>
		</ul>
	</form>
</div>

<%@ include file="../inc/footer.jsp" %>
</body>
