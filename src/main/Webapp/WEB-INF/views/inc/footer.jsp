<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet" >
<footer>
<style>
<!--top 메뉴-->
#btn-back-to-top {
  position: fixed;
  bottom: 20px;
  right: 20px;
  display: none;
}
</style>
<button type="button" class="btn btn-outline-secondary" style="display: block;border-radius: 100px;height: 50px;" id="btn-back-to-top" >
  <i class="material-icons" style="font-size: 24px;">keyboard_arrow_up</i>
</button>

<script type="text/javascript">
//Get the button
let mybutton = document.getElementById("btn-back-to-top");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () {
  scrollFunction();
};

function scrollFunction() {
  if (
    document.body.scrollTop > 20 ||
    document.documentElement.scrollTop > 20
  ) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}
// When the user clicks on the button, scroll to the top of the document
mybutton.addEventListener("click", backToTop);

function backToTop() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>


    <div class="cont basic_lo">
	    <div class="footer-menu">
		    <a>회사소개</a>
		    <a>이용약관</a>
		    <a class="fb">개인정보처리방침</a>
		    <a>청소년보호정책</a>
		    <a>이용안내</a>
		    <a>티켓판매안내</a>
		    <a onclick="location.href='showlist_adm'" title="관리자">관리자</a>
		    
		    <ul class="family">
			    <li><a href="#" class="family-btn">Family Site</a></li>
                <li><a href="http://www.naver.com/" target="_blank">네이버</a></li>
			    <li><a href="http://daum.net/" target="_blank">다음</a></li>
		    </ul>
	    </div>
	    <div class="footer-txt">
		    <a href="/New/Main.aspx?Gcode=009_201" class="flogo"><img src="${pageContext.request.contextPath}/resources/image/logo.gif" alt=""></a>
		    <div class="footxt">
			    <p>enjoysEE㈜</p>
			    <p class="gray">인천시 남동구 인주대로 596 기한빌딩 10층<br>대표 PSM.BMK &nbsp; |&nbsp; 개인정보보호책임자 : 박소망 help@enjoysEE.com<br>사업자등록번호  234-81-00000&nbsp; |  통신판매업신고  제 2023-07534호 
				    <a>사업자 정보확인</a>
              </p>
			    <p>Copyright © enjoysEE Corp. All Rights Reserved.</p>
		    </div>
	
	    </div>
    </div>
</footer>