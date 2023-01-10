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
   <center>
   <table width="75%" border="0" cellspacing="0" cellpadding="20">
      <tr>
         <td class="titlebox">
            <span class="title01">예매 확인 및 취소</span>
         </td>
      </tr>
      <tr>
         <td>
            <center>
          
                       <form action="ticketDelete" method="get" >
                       <c:forEach items="${ticketConfirmList}" var="ticketRev">
                       <tr>
                              <td><span class="content_text01">예매번호 : </span></td>
                              <td><input class="input_type01" type="text" name="snum" value="${ticketRev.snum }" readonly="readonly"></td>
                           </tr>
                           <tr>
                              <td><span class="content_text01">아 이 디 : </span></td>
                              <td><input class="input_type01" type="text" name="userid" value="${ticketRev.userid }" readonly="readonly"></td>
                           </tr>
                           <tr>
                              <td><span class="content_text01">예약한 사람 : </span></td>
                              <td><input class="input_type01" type="text" name="mname" value="${ticketRev.memberDto.mname }" readonly="readonly"></td>
                           </tr>
                           <tr>
                              <td><span class="content_text01">전시회 이름 :</span></td>
                              <td colspan="2"><textarea class="textarea_text01" rows="5" cols="30" name="stitle">${ticketRev.stitle }</textarea></td>
                           </tr>
                           <tr>
                              <td><span class="content_text01">이용날짜  :</span></td>
                              <td colspan="2"><textarea class="textarea_text01" rows="5" cols="30" name="sdday">${ticketRev.sdday }</textarea></td>
                           </tr>
                            <tr>
                              <td><span class="content_text01">매수  :</span></td>
                              <td colspan="2"><textarea class="textarea_text01" rows="5" cols="30" name="count">${ticketRev.count  }</textarea></td>
                           </tr>
                              <tr>
                              <td><span class="content_text01">1장 당 가격 :</span></td>
                              <td colspan="2"><textarea class="textarea_text01" rows="5" cols="30" name="sprice">${ticketRev.sprice  }</textarea></td>
                           </tr>
                          
                           <tr>
                                 <td colspan="2" align="center">
                                   <input class="button_type01" type="button" value="예매취소" onclick="script:window.location='ticketDelete?snum=${ ticketRev.snum}'">
                                   <input class="button_type01" type="button" value="처음으로" onclick="script:window.location='index'">
                               </td>
            
                           </tr>
                           </c:forEach>
                          
                     </center>
                  </td>
               </tr>
            </table>
            </center>
         </td>
      </tr>
   </table>
   </center>
<div id="wrapper" class="confirm-cancel-wrap mgt50" style="display:none">
	<h5>예매 확인 및 취소</h5>
	<form action="ticketDelete" method="get" >
		<ul class="mgt8">
		<c:forEach items="${ticketConfirmList}" var="ticketRev" >
			<li>
				<div class="card" style="width: 18rem;">
				  <div class="card-body">
				    <h5 class="card-smtitle">예매번호 : ${ticketRev.snum  }</h5>
				    <h5 class="card-title">${ticketRev.stitle }</h5>
				    <h5 class="card-date">공연 날짜 : ${ticketRev.sdday }</h5>
				    <p class="card-count">매수 : ${ticketRev.count  } 장</p>
				    <p class="card-price">한 장당 가격 : ${ticketRev.price  }</p>
				    <input class="btn btn-outline-dark mgt8" type="button" value="예매취소" onclick="script:window.location='ticketDelete?tnum=${ ticketRev.tnum}'">
				  </div>
				</div>
			</li>
			</c:forEach>
		</ul>
	</form>
</div>

<%@ include file="../inc/footer.jsp" %>
</body>
