

package com.exhibition.dao;

import java.util.ArrayList;
import java.util.List;

import com.exhibition.dto.*;
import com.exhibition.dto.ShowDto;
import com.exhibition.dto.ShowDto2;
import com.exhibition.dto.Ticket;
import com.exhibition.dto.Ticketing;
import com.exhibition.dto.Criteria;
import com.exhibition.dto.EfileDto;
import com.exhibition.dto.EventBDto;
import com.exhibition.dto.FileDto;


public interface IDao {

	
		//회원관리
		public int memberJoin(String mid, String mpw, String mname, String meamil);//회원가입 INSERT
		public int checkId(String mid); // 아이디 존재여부 확인 SELECT
		public int checkIdAndPW(String mid,String mpw);//아이디와 비밀번호의 존재 및 일치 여부 SELECT 
		public MemberDto getMemberInfo(String mid);//아이디로 조회하여 회원정보 가져오기 SELECT
		public void memberModify(String mid, String mpw, String mname, String meamil);//아이디로 조회하여 회원정보 수정하기 UPDATE

	    //공연정보게시판
		public int showWrite(String stitle, String slocation, String sdday, String stime, String sage, String sprice ,String userid,int filecount, String skind); //공연등록
		//public int rfbwrite(String rfbname, String rfbtitle, String rfbcontent, String rfbid, int filecount);//insert
		public int showboardAllCount();//총 게시물 개수 select
		public List<ShowDto> showList();// 게시판 리스트 select
		public ShowDto showView(String snum); //클긱한 글의 게시물 내용보기.
		public void delete(String snum);//글삭제 delete
		public void sbhit(String snum);//조회수
		public ArrayList<ShowDto> showList2();
		
        //공연이미지파일 업로드 관련
		public void fileInfoInsert(int sboardnum, String fileoriname, String filename, String fileextension, String fileurl);
		public ArrayList<ShowDto> boardLatestInfo(String userid);
		//현재 파일이 첨부된 글을 쓴 아이디로 검색된 글 목록;
        public FileDto getFileInfo(String snum);
		//파일이 첨부된 게시글의 번호로 조회한 첨부된 파일의 모든 정보 dto	
        public ArrayList<FileDto> fileList();
        
 
		//이벤트게시판
		public void writeQuestion(String qnum,String qid, String qcontent, String qemail,int qfilecount);//질문하기 insert int qfilecount 작업중
		public List<EventBDto> questionList(Criteria cri);//질문게시판 리스트 가져오기 select
		public EventBDto questionView(String qnum);//선택한 글 번호의 정보 가져오기 select
		public void questionModify(String qnum,String qid, String qcontent, String qemail);//해당 글번호로 조회하여 질문 수정 update
		public void questionDelete(String qnum);//글 삭제 delete
		public int boardAllCount();//게시판 총 글의 개수 가져오기
		public ArrayList<EventBDto> eventList();// 이벤트 게시판 리스트 select 메인노출
		
		//이베트이미지파일 업로드 관련
		public void efileInfoInsert(int eboardnum, String efileoriname, String efilename, String efileextension, String efileurl);
	    public ArrayList<EventBDto> eboardLatestInfo(String userid);
		//현재 파일이 첨부된 글을 쓴 아이디로 검색된 글 목록;
		public EfileDto geteFileInfo(String qnum);
	    //파일이 첨부된 게시글의 번호로 조회한 첨부된 파일의 모든 정보 dto	
		public ArrayList<EventBDto> efileList();
		
		
		//티켓팅
		public int ticketing(String stitle, String slocation, String sdday, String stime , String sage,String sprice, String userid , String count,String skind);//예매
		//예매한 티켓 정보 가져오기//조인
		public List<ShowDto2> ticketConfirm(String userid); //예매한 티켓 정보 가져오기//조인
		//예매한 티켓 취소하기
		public void ticketDelete(String snum); //예매한 티켓 취소하기
		
		
		
		
		 //공연정보 가져오기
	     public List<ShowDto> ticketList(Criteria2 cri);
	     public int ticketAllCount();//총 게시물 개수 select
	     //공연 검색 관련
	      public ArrayList<ShowDto> ShowSearchTitleList(Criteria3 cri);
	      public ArrayList<ShowDto> ShowSearchLocarionList(Criteria3 cri);
	      public ArrayList<ShowDto> ShowSearchSpriceList(Criteria3 cri);
	      public ArrayList<ShowDto> ShowSearchSkindList(Criteria3 cri);
	      
		
	
		
//		//리뷰에서 별점이랑 좋아요 보내보쟝
//		public int rivewStar(String rating, String rid, String rcontent);
//		//리뷰에서 별점 결과 몽땅 가져오기
//		public List<ReviewStar> reviewList();
//		
		

}