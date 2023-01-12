package com.exhibition.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Criteria3 {

	
	private int pageNum=1;//현재 내가 들어온 페이지 번호. 무조건 초기값은 1.
	private int amount=20; // 한 페이지에 출력 표시될 글의 수 //게시판 글
	private int startNum; // 현재 선택된 페이지에서 시작할 글 번호
	private String searchKey;
	
	public String getQueryString() { // 페이지 파라미터 값을 쿼리에 넘긴다
		return String.format("page=%d&pageSize=%d", pageNum, amount);//쿼리에 두개의 값을 넘겨준다
		
		
	}
}