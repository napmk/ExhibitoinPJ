package com.exhibition.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EfileDto {
	
	private int efilenum;//파일의 고유번호(시퀀스)
	private int eboardnum;//파일이 첨부된 원글의 게시판 글 번호
	private String efileoriname;//첨부된 파일의 원래 이름
	private String efilename;//첨부된 파일의 변경된 랜덤 이름
	private String efileextension;//첨부된 파일의 확장자
	private String efileurl;//첨부된 파일이 실제로 저장된 서버의 저장경로	
	
}