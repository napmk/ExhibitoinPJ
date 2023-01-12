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

</style>
</head>
<body>
<%@ include file="../inc/header.jsp" %>
	<div id="wrapper">
	 <div class="tit-util mt70" style="display:none">
	 
	 <div class="c_check_warp">
				<div class="c_box qna_search">
					<strong class="c_tit">자주찾는 질문 빠른검색</strong>
					<legend><label for="searchtext">검색</label></legend>
					<div class="search_box">
						<input id="searchtext" type="text" title="검색어 입력" placeholder="검색어를 입력해 주세요.">
						<button type="button" class="btn_search" title="검색하기" id="btn_search">검색</button>
					</div>
					<div class="c_qu">
                       
						    <a href="#none">현금영수증</a>                       
                        
						    <a href="#none">관람권</a>                       
                        
						    <a href="#none">예매</a>                       
                        
						    <a href="#none">환불</a>                       
                        
						    <a href="#none">취소</a>                       
                        
						    <a href="#none"></a>                       
                        
					</div>
				</div>
                <div class="c_box talk_inquiry" style="cursor:pointer;">
                    <strong class="c_tit">상담톡 이용</strong>
                    <span class="c_txt">상담 톡을 이용해보세요.</span>
                    <a href="javascript:;">문의하기</a>
                </div>
				<div class="c_box email_inquiry" style="cursor:pointer;">
					<strong class="c_tit">이메일 문의</strong>
					<span class="c_txt">24시간 365일 언제든지 문의해주세요.</span>
					<a href="/support/qna/default.aspx">문의하기</a>
                </div>
				<div class="c_box my_advice" style="cursor:pointer;">
					<strong class="c_tit">내 상담 내역 확인</strong>
					<span class="c_txt">문의하신 내용을 확인하실 수 있습니다.</span>
					<a href="/user/mycgv/inquiry/qna/list.aspx?g=1#contaniner" target="_blank" title="새창열기">문의내역 조회</a>
                </div>
			</div>
			
	
		
	</div>
</div>
	

<%@ include file="../inc/footer.jsp" %>
</body>
</html>