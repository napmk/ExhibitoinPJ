<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트페이지</title>
<style>

/*2차 추가*/
.content-min-wrap{min-width:1300px;overflow:hidden;padding-bottom:100px;}
.guide-big-tit{font-size:45px;text-align:center;color:#333;padding:90px 0 60px 0;}
.guide-division{width:auto; font-size:0;margin-bottom:70px;}
.guide-division a{display:inline-block;box-sizing:border-box;border:1px solid #ddd;border-right:0 none;width:14.2857%;height:68px;line-height:68px;text-align:center;font-size:16px;color:#333;}
.guide-division a:last-child{border-right:1px solid #ddd;}
.guide-division a.on{background:#ec7d2c;border-color:#ec7d2c;color:#fff;font-weight:bold;}
.brochure{width:1400px;margin:0 auto 80px 0;height:240px;background:#f6f6f6;overflow:hidden;}
.brochure > div{float:left;width:420px;height:240px;}
.brochure > div:nth-child(1){padding-left:180px;background:url('http://tkfile.yes24.com/imgNew/guide/brochure-bg-01.png')no-repeat left 60px;}
.brochure > div:nth-child(2){padding-left:140px;background:url('http://tkfile.yes24.com/imgNew/guide/brochure-bg-02.png')no-repeat left 60px;}
.brochure div p:nth-child(1){font-size:20px;color:#333;padding:64px 0 10px 0;position:relative;font-family:'Noto Sans KR', 'NanumBarunGothic', '맑은 고딕', 'Malgun Gothic', sans-serif;}
.brochure div p:nth-child(1):after{content:"";display:block; width:36px;height:3px;background:#ec7d2c;position:absolute;bottom:0;left:0;}
.brochure div p a{display:inline-block;width:78px;height:32px;line-height:32px;text-align:center;font-size:13px;color:#ec7d2c;border:1px solid #ec7d2c;position:absolute; top:61px;left:84px;}
.brochure div dl{overflow:hidden;font-size:15px;color:#666;line-height:25px;padding-top:14px;}
.brochure div dl dt{float:left;}
.brochure div dl dd{clear:right;margin-left:64px;}
.brochure div p:nth-child(2){font-size:15px;color:#666;line-height:25px;padding-top:14px;letter-spacing:-0.03em;}
.brochure div p:nth-child(2) span{font-size:15px;color:#ec7d2c;text-decoration:underline;position:relative;padding-left:23px;}
.brochure div p:nth-child(2) span:before{content:"";display:block;width:20px;height:18px;position:absolute;left:0;top:-2px;background:url('http://tkfile.yes24.com/imgNew/common/ico-brochure.png')no-repeat;}
.guidebox{display:none;width:1400px; padding-bottom:150px;}
.gb01 > div{padding:66px 0 80px 0;}
.gb01-con{text-align:center;border-bottom:1px solid #ddd;}
.gb01-con:last-child{border:0 none;}
.gb01-con img{margin-top:60px;}
.gb01-con-tit{font-size:30px;font-weight:bold;color:#333;margin-bottom:42px;font-family:'Noto Sans KR', 'NanumBarunGothic', '맑은 고딕', 'Malgun Gothic', sans-serif;}
.gb01-con-txt{font-size:14px;color:#666;line-height:24px;}
.gb01-con-txt span{color:#f43142;}
.gb01-con-2way{overflow:hidden;display:table;width:100%;text-align:left;margin-top:54px;}
.gb01-con-2way div{display:table-cell;vertical-align:middle;}
.gb01-con-2way div:nth-child(1){width:647px;}
.gb01-con-2way div img{margin:0 0 0 104px;}
.gb01-con-2way p img{margin:0;}
.gb01-con-2way .gb01-con-txt span{text-decoration:underline;}
.gb-txt-smaller{font-size:12px;text-decoration:none !important;}
.gb02-list{margin-bottom:60px;}
.gb02-list li{font-size:14px;color:#333;line-height:25px;padding-left:15px;position:relative;}
.gb02-list li:before{content:"";display:block;width:3px;height:3px;background:#999;position:absolute;top:10px;left:4px;border-radius:50%;}
.gbnm-con{overflow:hidden;}
.gbnm-con > div{float:left;}
.gbnm-con .gbnm-con-tit{width:242px;font-size:30px;font-weight:bold;letter-spacing:-0.03em;line-height:40px;font-family:'Noto Sans KR', 'NanumBarunGothic', '맑은 고딕', 'Malgun Gothic', sans-serif;}
.gbnm-con .gbnm-con-box{width:calc(100% - 242px);margin-top:5px;border-top:1px solid #333;padding:35px 0 70px 0;}
.gbnm-con-txt{font-size:14px;color:#333;line-height:28px;}
.gbnm-con-txt span{color:#f43142;}
.gbnm-con-txt em{text-decoration:underline;}
.gbnm-con-txts{font-size:14px;color:#333;line-height:28px;padding-left:10px;position:relative;color:#555;margin-top:14px;}
.gbnm-con-txts:before{content:"*";display:block;position:absolute; top:0;left:0;}
.gbnm-con-txtf{font-size:13px;color:#999;line-height:24px;padding:3px 0 0 8px;}
.gbnm-con-txtg{font-size:14px;color:#555;line-height:28px;font-weight:bold;margin-top:35px;}
.gbnm-con-box table{width:100%;border-top:1px solid #ccc;margin-top:20px;}
.gbnm-con-box table th{background:#fbe5d5;font-size:14px;color:#333;vertical-align:middle;border-bottom:1px solid #ccc;}
.gbnm-con-box table td{padding:15px 0 12px 30px;font-size:14px;color:#333;line-height:24px;vertical-align:middle;border-bottom:1px solid #ccc;}
.gb03 .gbnm-con-box table{margin-bottom:20px;}
.gb03 .gbnm-con-box table th{height:39px;line-height:39px;}
.gb03 .gbnm-con-box table td{text-align:center;padding:10px 0;}
.gb04 .gbnm-con-box table{margin-bottom:20px;}
.gb04 .gbnm-con-box table th{height:39px;line-height:39px;}
.gb04 .gbnm-con-box table td{text-align:center;padding:10px 0;}
.gbnm-con-subtit{font-size:15px;color:#333;font-weight:bold;margin-bottom:15px;}
.gbnm-con-subtit + .gbnm-con-txt{margin-bottom:28px;}
.gbnm-coment{background:#fdf2ea;overflow:hidden;width:100%;height:90px;}
.gbnm-coment > p{float:left;}
.gbnm-coment > p:nth-child(1){font-size:15px;color:#333;font-weight:bold;line-height:90px;padding:0 43px 0 50px;background:url('http://tkfile.yes24.com/imgNew/common/ico-letter.png')no-repeat right center;}
.gbnm-coment > p:nth-child(2){margin:23px 0 0 68px;font-size:13px;line-height:24px;color:#666;}
.gbnm-etc span{display:block;padding-top:20px;}
.guide-faq-srch{width:630px;height:60px;line-height:60px;font-size:15px;color:#999;position:relative;margin:0 auto 64px 0;text-align:center;}
.guide-faq-srch input{display:block;position:absolute;top:0;left:0;width:616px;height:56px;line-height:56px;border:2px solid #333;padding:0 5px;background:none;}
.guide-faq-srch input:focus{background:#fff;}
.guide-faq-srch a{display:block;width:58px;height:56px;background:url('http://tkfile.yes24.com/imgNew/common/ico-guide-srch.png')no-repeat 8px center;position:absolute;top:2px;right:2px;}
.guide-faq-btns{font-size:0;margin-bottom:83px;}
.guide-faq-btns a{display:inline-block;width:14.2857%;height:62px;line-height:62px;border-bottom:2px solid #333;font-size:16px;color:#333;text-align:center;}
.guide-faq-btns a.on{color:#ec7d2c;border-bottom:2px solid #ec7d2c;}
.guide-faq-list{border-top:1px solid #999;border-bottom:1px solid #999;margin-bottom:30px;}
.guide-faq-list > a{display:block;width:100%;height:49px;line-height:49px;border-bottom:1px solid #ddd;font-size:14px;color:#333;}
.guide-faq-list > a span{display:inline-block;width:184px;text-align:center;margin-right:46px;}
.guide-faq-list > a.on{background:#f6f6f6;}
.guide-faq-list > a:hover{background:#f6f6f6;}
.guide-faq-list div a{font-size:14px;color:#999;line-height:24px;} 
.guide-faq-list div{display:none;padding:25px 25px 25px 228px;border-bottom:1px solid #ddd;font-size:14px;color:#999;line-height:24px;}
.guide-faq-pager{text-align:center;}
.guide-faq-pager a{display:inline-block; width:32px;height:32px;line-height:32px;text-align:center;font-size:15px;color:#666;margin:0 3px;border:1px solid #ddd;}
.guide-faq-pager a img{vertical-align:middle;}
.guide-faq-pager a.on{border:1px solid #333; color:#333;}
.guide-faq-pager a.list-page-next img, .guide-faq-pager a.list-page-last img{transform:rotate(180deg);}
.guide-faq-pager div{display:inline-block; margin:0 14px;}
.guide-faq-result{position:relative;}
.guide-faq-result p{position:absolute;left:0;top:-30px;font-size:14px;color:#999;}
.guide-faq-result p span{color:#ec7d2c;}
.guide-faq-result p em{color:#333;}
.guide-faq-nolist{height:179px;border-top:1px solid #999;border-bottom:1px solid #999;text-align:center;font-size:14px;color:#ccc;line-height:24px;}
.guide-faq-nolist span{display:inline-block;color:#333;margin:48px 0 20px 0;}
.gb07box{background:#fdf2ea;padding:50px 52px 40px 52px;margin-bottom:50px;}
.gb07box p{display:inline-block;font-size:30px;color:#333;font-weight:bold;border-bottom:3px solid #ec7d2c;padding-bottom:10px;margin-bottom:22px;letter-spacing:-0.03em;font-family:'Noto Sans KR', 'NanumBarunGothic', '맑은 고딕', 'Malgun Gothic', sans-serif;}
.gb07box ul li{font-size:14px;color:#555;line-height:28px;padding-left:8px;position:relative;}
.gb07box ul li:before{content:""; display:block;width:3px;height:3px;background:#999;border-radius:50%;position:absolute;top:12px;left:0;}
.bg07btns{margin-top:100px;overflow:hidden;padding-left:1px;}
.bg07btns li{float:left;width:400px;height:167px;border:1px solid #ddd;margin-left:-1px;box-sizing:border-box;}
.bg07btns li:nth-child(1){padding:59px 0 0 165px;background:url('http://tkfile.yes24.com/imgNew/guide/ico-bg07btns1.jpg')no-repeat 49px center;}
.bg07btns li:nth-child(2){padding:59px 0 0 172px;background:url('http://tkfile.yes24.com/imgNew/guide/ico-bg07btns2.jpg')no-repeat 63px center;}
.bg07btns li:nth-child(3){padding:59px 0 0 169px;background:url('http://tkfile.yes24.com/imgNew/guide/ico-bg07btns3.jpg')no-repeat 44px center;}
.bg07btns li p{font-size:20px;color:#333;font-family:'Noto Sans KR', 'NanumBarunGothic', '맑은 고딕', 'Malgun Gothic', sans-serif;}
.bg07btns li a{display:block;width:78px;height:32px;line-height:32px;text-align:center;font-size:13px;color:#ec7d2c;border:1px solid #ec7d2c;margin-top:13px;}


</style>
</head>
<body>
<%@ include file="../inc/header.jsp" %>
	<div id="wrapper">
	<div class="content-min-wrap">
	    <h3 class="mgt40 mgb20">이용안내</h3>
	    <div class="brochure">
		    <div>
			    <p><span>고객센터</span></p>
			    <dl>
				    <dt>전화문의 : </dt>
				    <dd>1544-6399</dd>
				    <dt>이용시간 : </dt>
				    <dd>평일 09:00~18:00 / 토요일 09:00~17:00<br>(점심시간: 12:00~13:00 / 일요일, 공휴일 휴무)</dd>
			    </dl>
		    </div>
		    <div>
			    <p><span>1:1문의</span><a href="/" target="_blank">문의하기</a></p>
			    <p>
				    평일 오후 5시 이후 문의는 당일 답변이 어려울 수 있습니다.<br>
				    토,일요일/공휴일 문의는 운영 시간 내 순차적으로 답변 드리겠습니다.<br>
				    <span>잠깐!</span> 1:1 문의 전 FAQ 를 먼저 확인해보세요.
			    </p>
		    </div>
	    </div>
	    <div class="guide-division">
		    <a href="#" class="">예매방법</a>
		    <a href="#">결제방법</a>
		    <a href="#">수수료</a>
		    <a href="#">취소/환불</a>
		    <a href="#">티켓수령</a>
		    <a href="#">FAQ</a>
		    <a href="#" class="on">티켓판매/제휴문의</a>
	    </div>
	    <div class="guidebox gb01" style="display: none;"><img src="http://tkfile.yes24.com/imgNew/guide/guide-img1.jpg" alt="">
		<div class="gb01-con">
			<p class="gb01-con-tit">1. 본인인증/로그인</p>
			<p class="gb01-con-txt">
				빠른 예매를 위해 로그인을 먼저 해주세요. <br>
				예매는 <span>본인인증된 ID로만 가능</span>합니다.<br>
				개인 정보 보호 및 관리를 위해 예매 전 가입된 회원 정보를 확인해주시기 바라며, 주기적으로 비밀번호를 변경해주시기 바랍니다.
			</p>
			<img src="http://tkfile.yes24.com/imgNew/guide/guide-img2.jpg" alt="">
		</div>
		<div class="gb01-con">
			<p class="gb01-con-tit">2. 공연 및 관람일시 선택</p>
			<p class="gb01-con-txt">
				관람 원하는 공연 선택  &gt; [예매하기] 버튼 클릭 &gt; 관람하실 날짜와 시간을 선택합니다.<br>
				(공연 상세페이지에서 관람일 및 회차를 선택 한 경우 이후 단계에 자동 적용 됩니다.)
			</p>
			<img src="http://tkfile.yes24.com/imgNew/guide/guide-img3.jpg" alt="">
		</div>
		<div class="gb01-con">
			<p class="gb01-con-tit">3. 좌석 선택</p>
			<div class="gb01-con-2way">
				<div><img src="http://tkfile.yes24.com/imgNew/guide/guide-img4.jpg" alt=""></div>
				<div>
					<p class="gb01-con-txt">
						좌석도에서 원하는 좌석을 선택합니다. 좌석 선택 시 티켓 결제 가격이 자동 적용 됩니다.<br>
						규모가 큰 공연장은 미니맵을 이용하여 구역, 층을 이동하여 다른 좌석을 선택할 수 있습니다. <br>
						다른 일시로의 변경을 원하는 경우  좌석도 상단에서 관람일/회차 변경을 선택해주세요. <br>
						<span class="gb-txt-smaller">
						- 동시 접속 회원이 많아 예매가 집중되면, 간혹 선택한 좌석이 다른 회원과 중복될 수 있습니다. <br>
						　이 때는 결제를 먼저 완료한 분께 좌석이 지정됩니다.<br>
						- 좌석을 선점한 경우에도 일정 시간이 지나도록 결제 완료를 하지 않으면 선점 해제가 됩니다. 
						</span><br><br>
						비지정석 공연의 경우 좌석 선택 단계 없이 등급/매수만 선택합니다. <br>
						* 안내되어 있는 잔여석 정보는 현재 예매 진행 중인(결제 전) 좌석이 포함되어 있어 실제 예매 가능 좌석수와 다를 수 있습니다.
					</p>
				</div>
			</div>
		</div>
		<div class="gb01-con">
			<p class="gb01-con-tit">4. 할인/쿠폰 선택</p>
			<div class="gb01-con-2way">
				<div><img src="http://tkfile.yes24.com/imgNew/guide/guide-img5.jpg" alt=""></div>
				<div>
					<p class="gb01-con-txt">
						적용 받고자 하는 할인 종류와 매수를 선택합니다.<br>
						장애인, 국가유공자 할인 등 증빙이 필요한 할인이 있을 수 있으니 반드시<br>유의사항을 확인해주시기 바랍니다. <br>
						신용카드 할인을 선택한 경우 해당 카드로만 결제가 가능합니다. <br><br>
						사용 가능한 쿠폰이 있는 경우 해당 쿠폰을 선택합니다. 
					</p>
				</div>
			</div>
		</div>
		<div class="gb01-con">
			<p class="gb01-con-tit">5. 수령방법 선택</p>
			<div class="gb01-con-2way">
				<div><img src="http://tkfile.yes24.com/imgNew/guide/guide-img6.jpg" alt=""></div>
				<div>
					<p class="gb01-con-txt">
						현장수령, 배송 중 원하는 수령 방법을 선택합니다.(상품의 특성에 따라 수령<br>방법 선택이 제한될 수 있습니다.)<br><br><span>현장 수령</span> 은 공연 당일 매표소에서 예매자 본인 신분증,<br>예매내역서(예약번호) 로 본인 확인 후 티켓을 수령하는 방법입니다.<br><span class="gb-txt-smaller">* 공연에 따라 예매자 본인 외 티켓 수령이 불가할 수 있습니다. </span><br><br>	<span>배송</span> 인 경우 배송비가 추가 결제 되며, 예매 완료 후 영업일 기준 5~7일<br>이내에 수령 가능합니다. (단, 일괄배송 상품은 배송 시작일이 지정되어<br>있습니다.)<br>배송 선택 시 수령자 정보를 정확히 입력합니다.<br><span class="gb-txt-smaller">* 티켓 분실 시 재발행 되지 않으니, 보관에 유의하시기 바랍니다.</span>
					</p>
				</div>
			</div>
		</div>
		<div class="gb01-con">
			<p class="gb01-con-tit">6. 결제방법 선택</p>
			<div class="gb01-con-2way">
				<div><img src="http://tkfile.yes24.com/imgNew/guide/guide-img7.jpg" alt=""></div>
				<div>
					<p class="gb01-con-txt">
						원하는 결제 수단을 선택합니다.<br>
						상품별로 사용 가능한 결제 수단에 제한이 있을 수 있습니다.<br><br>
						<img src="http://tkfile.yes24.com/imgNew/guide/guide-img7-2.jpg" alt="">
					</p>
				</div>
			</div>
		</div>
		<div class="gb01-con">
			<p class="gb01-con-tit">7. 정책 동의</p>
			<div class="gb01-con-2way">
				<div><img src="http://tkfile.yes24.com/imgNew/guide/guide-img8.jpg" alt=""></div>
				<div>
					<p class="gb01-con-txt">
						취소 마감 시간 및 취소 수수료 정책을 확인하고 이에 동의합니다. <br>
						예매/관람 서비스 제공을 위한 제3자 정보 제공을 확인하고 이에 동의합니다.
					</p>
				</div>
			</div>
		</div>
		<div class="gb01-con">
			<p class="gb01-con-tit">8. 예매내역 확인</p>
			<p class="gb01-con-txt">
				결제 완료 후 예매 내역은 회원 정보 상의 이메일 또는 카카오톡 알림톡/SMS 로 발송되며, MY티켓의 [예매확인/취소] 에서도 확인 가능합니다.
			</p>
		</div></div><!--guidebox gb01 예매방법-->
	    <div class="guidebox gb02" style="display: none;">
	    </div><!--guidebox gb02 결제방법-->
	    <div class="guidebox gb03" style="display: none;">
	    </div><!--guidebox gb03 수수료-->
	    <div class="guidebox gb04" style="display: none;">
	    </div><!--guidebox gb04 취소/환불-->
	    <div class="guidebox gb05" style="display: none;">
	    </div><!--guidebox gb05 티켓수령-->
	    <div class="guidebox gb06" style="display: none;">
		    <div class="guide-faq-srch">
			    궁금하신 내용을 입력해주세요.
			    <input id="SearchTextbox" onkeypress="if (event.keyCode==13){ onSearch();event.returnValue=false}" type="text" autocomplete="off">
			    <a href="javascript:;" onclick="onSearch();"></a>
		    </div>
		    <div class="guide-faq-btns">
			    <a href="#" onclick="getFaq();" class="on">전체(<span id="faqTap">0</span>)</a>
			    <a href="#" onclick="getFaq(10);">회원(<span id="faqTap10">0</span>)</a>
			    <a href="#" onclick="getFaq(11);">예매/결제(<span id="faqTap11">0</span>)</a>
			    <a href="#" onclick="getFaq(12);">취소/환불(<span id="faqTap12">0</span>)</a>
			    <a href="#" onclick="getFaq(13);">티켓수령(<span id="faqTap13">0</span>)</a>
			    <!--<a href="#" onclick="getFaq(14);">팬클럽(<span id="faqTap14">0</span>)</a>//-->
			    <a href="#" onclick="getFaq(15);">기타(<span id="faqTap15">0</span>)</a>
                <a>&nbsp;</a>
		    </div>
		    <div class="guide-faq-result" style="display:none;">
			    <p><span id="divSearchText"></span>에 대한 검색결과 <em id="divSearchCount"></em></p>
		    </div>
		    <div class="guide-faq-list">
		    </div>
		    <p class="guide-faq-nolist" style="display:none;">
			    <span>검색된 FAQ 가 없습니다.</span><br>
			    궁금하신 사항은 1:1문의를 남겨주시거나 고객센터(T.1544-6399)를 이용해 주시면<br>
			    친절하고 정확하게 안내해드리겠습니다.
		    </p>
		    <div class="guide-faq-pager">
		    </div>
	    </div><!--guidebox gb06 FAQ-->
	    <div class="guidebox gb07" style="display: block;">
		    <div class="gb07box">
			    <p>판매 상담 및 계약</p>
			    <ul>
				    <li>판매 대행 의뢰할 공연에 대한 개요를 대표 E-mail 로 발송해주시면, 담당자가 확인 후 기획사 담당자에게 연락을 드립니다. yesticket@yes24.com</li>
				    <li>담당자와 공연 판매 대행 관련 상담 및 계약을 진행합니다. </li>
				    <li>연간계약과 단일계약 중 선택하여 계약하고 관련 서류 작업을 완료합니다.</li>
			    </ul>
		    </div>
		    <div class="gb07box">
			    <p>공연/상품 등록</p>
			    <ul>
				    <li>공연 등록 의뢰서 작성 후 각 담당자 E-mail 또는 yesticket@yes24.com 로 보내주세요. </li>
				    <li>공연 등록에 필요한 이미지, 좌석배치도 등과 함께 사업자등록증, 통장 사본을 전달주시면 더욱 빠르게 처리 가능합니다.</li>
				    <li>등록 자료 접수 후 영업일 기준 3~4일 이내에 등록됩니다.</li>
				    <li>필요한 경우 티켓 오픈 관련 공지사항을 게시할 수 있습니다. </li>
			    </ul>
		    </div>
		    <div class="gb07box">
			    <p>판매/마케팅</p>
			    <ul>
				    <li>판매는 티켓마켓를 비롯하여 제휴사에서도 함께 판매됩니다. </li>
				    <li>판매 현황은 어드민을 통해 확인하실 수 있습니다.   ▶ 기획사 어드민: tms.yes24.com</li>
				    <li>초대권 등 티켓 발권은 대표 E-mail (yesticket@yes24.com) 으로 신청 가능합니다. </li>
				    <li>공연 당일 해당 티켓 발송 또는 판매담당자 지원 가능합니다. 사전에 담당자와 협의해주시기 바랍니다. </li>
				    <li>마케팅은 영업 담당자와 협의하시거나 tikcketmd@yes24.com 로 메일로 보내주시면 됩니다. </li>
			    </ul>
		    </div>
		    <div class="gb07box">
			    <p>정산</p>
			    <ul>
				    <li>공연 종료되면 3일 이내에 정산서를 보내드립니다. 조정 사항이 있는 경우 담당자와 협의합니다.</li>
				    <li>7일 이내에 판매수수료를 제외한 정산금액을 입금하여 드립니다.</li>
			    </ul>
		    </div>
		    <ul class="bg07btns">
			    <li>
				    <p>티켓 등록 의뢰서</p>
				    <a>다운</a>
			    </li>
			    <li>
				    <p>티켓마켓 CI</p>
				    <a>다운</a>
			    </li>
			    <li>
				    <p>배너 제작 가이드</p>
				    <a>다운</a>
			    </li>
		    </ul>
	    </div><!--guidebox gb07 티켓판매/제휴문의-->
    </div>
</div>
	

<%@ include file="../inc/footer.jsp" %>
</body>
</html>