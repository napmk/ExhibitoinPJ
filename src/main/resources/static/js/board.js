/**
 * 
 */
 
function boardCheck() {
	
	if(document.board_frm.qname.value.length == 0) {
		alert("이름은 필수입력 사항입니다.");
		return;
	}
	
	if(document.board_frm.qname.value.length < 2) {
		alert("제목은 2글자 이상이어야 합니다.");
		return;
	}

	
	if(document.board_frm.qcontent.value.length < 10) {
		alert("이벤트내용은 10글자 이상이어야 합니다.");
		return;
	}
	
	if(document.board_frm.qemail.value.length == 0) {
		alert("날짜는 필수입력 사항입니다.");
		return;
	}
	
	
	document.board_frm.submit();
} 

function purchasesNum(){
	
	if(document.purchases_num.count.value.length == 0) {
		alert("구매 장 수를 선택해 주세요 ");
		return;
	}
	document.purchases_num.submit();
	
}


function loginCheck(){
	
	if(document.login_check.mid.value.length == 0) {
		alert("아이디를 입력해주세요 ");
		return;
	}
	document.login_check.submit();
	
}