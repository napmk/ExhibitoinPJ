<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트페이지</title>
<style>
/* main */
.c_check_warp{overflow:hidden}
.c_check_warp .c_box{float:left; display:block; width:199px; height:260px; text-align:center; border-right:1px solid #dedace}
.c_check_warp .c_tit{display:block; padding-top:135px; font-size:16px; color:#222; letter-spacing:-0.059em; /*background:url(../images/sub/customer/bg_c_check.png) no-repeat*/}
.c_check_warp .c_txt{display:block; margin:11px 0px 17px; font-size:12px; color:#666; letter-spacing:-0.042em}
.c_check_warp .c_txt + a{overflow:hidden; display:block; width:80px; margin:0 auto; font-size:12px; color:#fff; letter-spacing:-0.042em; line-height:23px; text-align:center; background-color:#666; border-radius:4px}

.c_check_warp .c_box.qna_search{width:200px; background:#fb4357 url('${pageContext.request.contextPath }/resources/image/ico_search.png') center 50px scroll no-repeat; background-size:50px; border-right:none}
  .qna_search .c_tit{color:#fff}
  .qna_search .search_box{overflow:hidden; display:inline-block; width:160px; height:30px; margin:12px 0px 9px; text-align:left; background-color:#fff}
  .qna_search .search_box input{float:left; width:126px; height:12px; padding:9px 0; font-size:12px; line-height:12px; text-indent:7px; vertical-align:middle; border:none; background-color:#fff}
  .qna_search .search_box .btn_search{float:right; display:block; width:34px; height:30px; font-weight:500; font-size:0; line-height:30px; background:transparent url('${pageContext.request.contextPath }/resources/image/bth_search.png') center scroll no-repeat; background-size:16px}

  .qna_search .c_qu a{margin-left:4px; font-size:11px; color:#fff; vertical-align:top}

  .talk_inquiry{background:#f8f8f8 url('${pageContext.request.contextPath }/resources/image/ico_talk.png') center 50px scroll no-repeat; background-size:50px;}
  .email_inquiry{background:#f8f8f8 url('${pageContext.request.contextPath }/resources/image/ico_email.png') center 50px scroll no-repeat; background-size:50px;}
  .my_advice{background:#f8f8f8 url('${pageContext.request.contextPath }/resources/image/ico_myAdvice.png') center 50px scroll no-repeat; background-size:50px;}

.customer_notice_area{overflow:hidden;margin-top:36px;}
.service_area .tit, .notice_area .tit{color:#222;font-size:16px;font-weight:500;}
.service_area{float:left;width:267px; height:287px;}
.service_area .list{padding-top:15px;margin:-5px 0px 0px -5px;*zoom:1;}
.service_area .list:after {display:block;content:'';clear:both;}
.service_area .list li {margin:5px 0px 0px 5px;float:left;}
.service_area .list li a{padding:24px 20px 25px 17px;display:block;width:94px;height:32px;color:#222;line-height:150%;font-weight:500;background:url(${pageContext.request.contextPath }/resources/image/bg_c_main.png) no-repeat 0 -287px;}
.service_area .list .off a {color:rgba(149, 149, 143, 0.5); background-position: 0 -377px;}

.notice_area{position:relative;left:0;top:0;float:right;width:473px; height:287px;} 
.notice_area .txt{margin-top:15px;}
.notice_area .txt li:first-child{margin-top:0;}
.notice_area .txt li{text-align:right;margin-top:13px;vertical-align:top;}
.notice_area .txt li a{float:left;overflow:hidden;display:block;width:400px;color:#222;white-space:nowrap;text-overflow:ellipsis;text-align:left;}
.notice_area .txt li a:hover, .notice_area .txt li a:active{font-weight:500;text-decoration:underline;}
.notice_area .txt .day{color:#222;font-size:11px;}
.notice_area .more{position:absolute;top:0;left:75px;display:inline-block;width:20px;height:19px;background:url(${pageContext.request.contextPath }/resources/image/bg_c_main.png) no-repeat -159px -287px;text-indent:-999px;}
.noti_ban_area{position:absolute; left:0; right:0; bottom:0; overflow:hidden;margin-top:36px;}
.noti_ban_area:after {display:block; content:''; clear:both;}
.noti_ban_area .ban_preview{float:left; display:block;width:231px;height:95px;background:url(${pageContext.request.contextPath }/resources/image/bg_c_main.png) no-repeat 0 -163px;text-indent:-999px;*zoom:1;*display:inline;*zoom:1;}
.noti_ban_area .ban_discount{float:right; display:block;width:232px;height:95px;background:url(${pageContext.request.contextPath }/resources/image/bg_c_main.png) no-repeat -241px -163px;text-indent:-999px;*display:inline;*zoom:1;}

.shortcu_area{overflow:hidden;margin-top:60px;padding:30px 0px 35px 0px;color:#222;border-top:solid 1px #cacac1;border-bottom:solid 1px #cacac1;}
.shortcu_area li:first-child{margin-left:0;}
.shortcu_area li{float:left;width:25%;}
.shortcu_area .tit_shortcut{display:inline-block;height:33px;line-height:33px;font-size:16px;background:url(${pageContext.request.contextPath }/resources/image/bg_c_main.png) no-repeat;}
.shortcu_area .ico_lost{padding-left:48px;background-position:-3px -88px;}
.shortcu_area .ico_general{padding-left:53px;background-position:-158px -88px;}
.shortcu_area .ico_vipinfo{padding-left:49px;background-position:-361px -88px;}
.shortcu_area .ico_vipcustomer{padding-left:38px;background-position:-513px -88px;}
.shortcu_area .txt{display:block;margin:10px 30px 13px 0px;line-height:150%;}
.shortcu_area .round.on.gray{height:20px;}

.tel_inquiry{overflow:hidden;margin-top:20px;font-size:14px;color:#222;}
.tel_inquiry li:first-child{margin-left:0;padding-left:0;border-left:0;}
.tel_inquiry li{float:left;margin-left:18px;padding-left:14px;border-left:solid 1px #bebdb4;}
.tel_inquiry .time{font-size:12px;}

.accordion{--bs-accordion-active-color: #000;}
</style>
</head>
<body>
<%@ include file="../inc/header.jsp" %>
	<div id="wrapper" class="mgt50">
		<div class="eventList_wrapper">
		<h4>FAQ TOP 5</h4>
		<div class="accordion" id="accordionExample">
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		        [티켓결제] 예매한 티켓의 결제 수단을 변경할 수 있나요?
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        '무통장입금'을 선택하여 예매한 경우 입금 완료 전 신용카드로 결제 수단을 변경할 수 있습니다.<br><br>
				PC>MY공연>예매확인/취소 상세에서 직접 변경하시거나<br>
				고객센터 전화(1544-6399) 또는 일대일문의를 남겨주시면 처리 가능합니다.<br><br>
				단, 신용카드로 결제한 경우 다른 카드로 변경 또는 할부 개월 수 변경 등은 하실 수 없으니 카드 결제 시 유의해 주시기 바랍니다.<br>
				* 공연에 따라 결제 수단 변경이 불가할 수 있으므로 공지 및 공연 상품 상세 정보에서 확인해 주시기 바랍니다.<br>

		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingTwo">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		        [티켓결제] 무통장입금의 입금은행을 변경하고 싶습니다.
		      </button>
		    </h2>
		    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		       입금은행 변경을 원하시는 경우, 번거로우시겠지만 이전 주문을 취소하고 새로 주문을 해주셔야 합니다.<br>
				입금은행을 변경하여 입금하신 후, 3~4시간 후에도 입금확인 메일이 도착하지 않은 경우 1:1 문의를 통해 연락주시면 확인해드리겠습니다.
		        </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingThree">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		       [티켓결제] 무통장입금 결제는 어떻게 이용하나요?
		      </button>
		    </h2>
		    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		      예매 시 '무통장입금'을 선택하시면 가상계좌를 발급해드립니다.<br>

발급된 가상 계좌로 예매 후 익일 오후 11시 29분까지 입금해주셔야 예매가 완료됩니다.<br>

단, 상품에 따라 예매 당일 밤 11시 29분에 마감되는 경우가 있으니 예매 전후 반드시 확인해주시기 바랍니다.<br><br>

 

* 이용 가능 은행: 우리, 국민, 농협, 신한, KEB하나, 기업, SC제일, 우체국<br>

 

'무통장입금'  결제 수단은 관람일 4일 전 예매 시 까지만 이용할 수 있으나, 특정 공연, 특정 기간 동안 해당 결제 수단 사용 제한이 있을 수 있습니다.<br><br>

 

ATM 기기기로는 가상계좌 입금이 안 되는 경우가 있으니 가급적 인터넷 뱅킹, 모바일 뱅킹 등을 이용해주시고, 은행마다 은행 이용 마감 시간 또는 점검으로 인해 입금 처리가 안 될 수 있으니 은행별 이용 가능 시간을 꼭 확인해주시기 바랍니다.<br>
		       </div>
		    </div>
		  </div>
		  
		   <div class="accordion-item">
		    <h2 class="accordion-header" id="headingFour">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
		       [티켓결제] 현금 영수증은 어떻게 발급 받나요?
		      </button>
		    </h2>
		    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		    무통장입금, 공연예매권, YES상품권, 예치금 등을 사용하신 결제 금액에 대해 현금 영수증 발급 신청이 가능합니다.<br>

 

 * MY공연>예매확인/취소 에서 직접 현금영수증 발급 신청    (예매일 ~ 공연관람일 이후 1년간 발급 신청 가능합니다.)<br>

 

※ 네이버페이 결제 건의 경우,티켓마켓 고객센터로 문의 후 발급 가능합니다.<br>

 

 발급 후 영수증 확인은 국세청 홈페이지에서 3~4일 이내에 확인하실 수 있습니다.</div>
		    </div>
		  </div>
		  
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingFive">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
		       [티켓결제] 문화상품권으로 결제가 가능한가요?FAQ 보기/감추기

		      </button>
		    </h2>
		    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		   문화진흥원에서 발행한 문화상품권(컬쳐캐쉬)은  티켓 결제가 불가합니다.</div>
		    </div>
		  </div>
		  
	   </div>
</div>
</div>
	

<%@ include file="../inc/footer.jsp" %>
</body>
</html>