/**

 * 
 */
 
 function like_func(id){		 
	var params = '';
	params = params.addParam('id', id);
	ajaxReq("like.do" + params , "get", like_funcCallback, null);
}
			  
function like_funcCallback(data) {
	var msg = data.response.msg;
			      
	// 좋아요를 취소한다면,
	if(data.response.likeCheck == 0){
		like_img = "/images/icon/dislike.png";
			        
	// 좋아요를 한다면,
	} else {
		like_img = "/images/icon/like.png";
	}      
			
	$('#like_img').attr('src', like_img);
	$('#likeCount').html(data.response.likeCount);
}		
