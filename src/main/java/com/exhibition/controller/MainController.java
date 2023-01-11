package com.exhibition.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;


import com.exhibition.dao.IDao;
import com.exhibition.dto.Criteria;
import com.exhibition.dto.FileDto;
import com.exhibition.dto.MemberDto;
import com.exhibition.dto.PageDto;
import com.exhibition.dto.ShowDto;

import com.exhibition.dto.EventBDto;




@Controller
public class MainController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping (value ="/") 
	public String home () {
		
		return "redirect:index";
	}

	 @RequestMapping (value ="index") //인덱스 메인페이지
	   public String home (Model model,HttpServletRequest request,HttpSession session, HttpServletResponse response) throws IOException {

	      IDao dao = sqlSession.getMapper(IDao.class);
	      List<ShowDto> showboardDtos = dao.showList2();

	      List<EventBDto> eventboardDtos = dao.eventList();



	      model.addAttribute("showList",showboardDtos);
          model.addAttribute("eventList",eventboardDtos);

	      return "index";
	   }
	 
	 @RequestMapping (value ="index2") //인덱스 메인페이지2
	   public String index2 (Model model,HttpServletRequest request,HttpSession session, HttpServletResponse response) throws IOException {

	      IDao dao = sqlSession.getMapper(IDao.class);
	      List<ShowDto> showboardDtos = dao.showList2();

	      List<EventBDto> eventboardDtos = dao.eventList();



	      model.addAttribute("showList",showboardDtos);
        model.addAttribute("eventList",eventboardDtos);

	      return "index2";
	   }

	@RequestMapping (value ="join") //회원가입페이지
	public String join () {
		
		return "join_form";
	}
	
	@RequestMapping (value ="joinOk")
	public String joinOk (HttpServletRequest request, HttpSession session, Model model) {
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		int joinFlag = dao.memberJoin(mid, mpw, mname, mid);
		// joinFlag 가 1 이면 회원가입 성공, 아니면 실패
		//System.out.println("가입성공여부"+ joinFlag);
		
		if(joinFlag == 1 ) { //회원가입 성공시 바로 로그인 진행
			session.setAttribute("memberId", mid);
			session.setAttribute("memberName", mname);
		
			model.addAttribute("mid", mid);
			model.addAttribute("mname",mname );
			
			return "joinOk";
		} else { //회원가입 실패
				return "joinFail";
		}
	
	}
	
	
	@RequestMapping (value ="login") //로그인페이지
	public String login () {
		
		return "login";
	}
	
	@RequestMapping (value = "logout") //로그아웃페
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:index2";
	}
	
	
	@RequestMapping (value = "loginOk") 
	public String loginOk(HttpServletRequest request, Model model, HttpSession session) {
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int checkIdFlag = dao.checkId(mid); 
		//로그인하려는 아이디 존재시 1, 로그인하려는 아이디 존재하지 않으면 0이 반환
		int checkIdPwFlag = dao.checkIdAndPW(mid, mpw);
		//로그인하려는 아이디와 비밀번호가 모두 일치하는 데이터가 존재하면 1 아니면 0이 반환
		
		model.addAttribute("checkIdFlag",checkIdFlag);
		model.addAttribute("checkIdPwFlag",checkIdPwFlag);
		
		
		
		if(checkIdPwFlag == 1) {   //로그인실행
			session.setAttribute("memberId", mid);
			MemberDto memberDto = dao.getMemberInfo(mid);
			model.addAttribute("memberDto", memberDto);
			model.addAttribute("mid",mid);
		}

		return "loginOk";
	}
	
	@RequestMapping(value = "/mypage")
	public String memberModify(Model model, HttpSession session) {
		
		String sessionId = (String) session.getAttribute("memberId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		MemberDto memberDto = dao.getMemberInfo(sessionId);
		
		model.addAttribute("memberDto", memberDto);
		
		return "member/memberModify";
	}
	
	@RequestMapping(value = "/memberModifyOk")
	public String memberModifyOk(HttpServletRequest request,  Model model) {
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.memberModify(mid, mpw, mname, memail);
		
		MemberDto memberDto = dao.getMemberInfo(mid);//수정된 회원정보 다시 가져오기
		
		model.addAttribute("memberDto", memberDto);
		
		return "/member/memberModifyOk";
	}
	
	@RequestMapping (value ="showlist_adm") //관리자등록 show
	public String showlist (Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		List<ShowDto> showboardDtos = dao.showList();
		
	//	int boardCount = dao.rfboardAllCount();
		
		model.addAttribute("showList",showboardDtos);
	//	model.addAttribute("boardCount",boardCount);
		
		
		return "reservation/showlist_adm";
	}
	
	@RequestMapping (value ="showlist")  //사용자용 showlist
	public String showlist_customer (Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		List<ShowDto> showboardDtos = dao.showList2();
		
	//	int boardCount = dao.rfboardAllCount();
		
		model.addAttribute("showList",showboardDtos);
	//	model.addAttribute("boardCount",boardCount);
		
		
		return "reservation/showlist";
	}
	

	
	
//	@RequestMapping (value ="tikecting/showview")
//	public String tikectingshowview (HttpServletRequest request, Model model, HttpSession session) {
//		
//		String snum = request.getParameter("snum");
//		
//		IDao dao = sqlSession.getMapper(IDao.class);
//		//조회수증가 dao.shit(snum);
//		FileDto fileDto = dao.getFileInfo(snum);
//		ShowDto showdto = dao.showView(snum);
//		
//		model.addAttribute("showView",showdto);
//		model.addAttribute("fileDto", fileDto);
//		
//		
//		return "/tikecting/showview";
//	}
	
	@RequestMapping (value ="showwrite")
	public String showwrite (HttpSession session, HttpServletResponse response) {
		String sessionId = (String) session.getAttribute("memberId");
		if(sessionId == null) {//참이면 로그인이 안된 상태
			PrintWriter out;
			try {
				response.setContentType("text/html;charset=utf-8");
				out = response.getWriter();
				out.println("<script>alert('로그인하지 않으면 글을 쓰실수 없습니다!');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}		
		return "/reservation/showwrite";
	}
	
	@RequestMapping(value = "writeOk")
	public String writeOk(HttpServletRequest request, HttpSession session, @RequestPart MultipartFile files) throws IllegalStateException, IOException {
		
		String showTitle = request.getParameter("stitle");
		String showLocation = request.getParameter("slocation");
		String showSdday = request.getParameter("sdday");
		String showTime = request.getParameter("stime");
		String showAge = request.getParameter("sage");
		String showPrice = request.getParameter("sprice");
		String sessionId = (String) session.getAttribute("memberId");
		String showKind = request.getParameter("skind");
		//글쓴이의 아이디는 현재 로그인된 유저의 아이디이므로 세션에서 가져와서 전달 
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		if(files.isEmpty()) { // 파일의 첨부여부 확인
			dao.showWrite(showTitle, showLocation, showSdday,showTime,showAge,showPrice, sessionId, 0,showKind);
		} else {
			dao.showWrite(showTitle, showLocation, showSdday,showTime,showAge,showPrice, sessionId, 1,showKind);
			ArrayList<ShowDto> latestBoard = dao.boardLatestInfo(sessionId);
			ShowDto dto = latestBoard.get(0);
			int snum = dto.getSnum();
			//파일첨부
			String fileoriname = files.getOriginalFilename();//첨부된 파일의 원래 이름
			String fileextension = FilenameUtils.getExtension(fileoriname).toLowerCase();
			//첨부된 파일의 확장자 추출 후 소문자로 강제 변경
			File destinationFile;//java.io 패키지 제공 클래스 임포트
			String destinationFileName;//실제 서버에 저장된 파일의 변경된 이름이 저장될 변수 선언
			
			String fileurl = "C:/springBootWork/Exhibition/src/main/resources/static/uploadfiles/";
			//첨부된 파일이 저장될 서버의 실제 폴더 경로 //String fileurl = "C:/springBootWork/Exhibition/src/main/resources/static/uploadfiles";
			//C:/Users/napmkmk/git/ExhibitoinPJ/src/main/resources/static/uploadfiles
			//C:/springBootWork/Exhibition/src/main/resources/static/uploadfiles
			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileextension;
				//알파벳대소문자와 숫자를 포함한 랜덤 32자 문자열 생성 후 .을 구분자로 원본 파일의 확장자를 연결->실제 서버에 저장될 파일의 이름
				destinationFile = new File(fileurl+destinationFileName);	
			} while(destinationFile.exists());
			//혹시 같은 이름의 파일이름이 존재하는지 확인
			
			destinationFile.getParentFile().mkdir();
			files.transferTo(destinationFile);//업로드된 파일이 지정한 폴더로 이동 완료!
			
			dao.fileInfoInsert(snum, fileoriname, destinationFileName, fileextension, fileurl);		
			
		}
		
		return "redirect:showlist";
	}
	
	@RequestMapping(value = "file_down")
	public String file_down(HttpServletRequest request, Model model, HttpServletResponse response) {
		
		String snum = request.getParameter("snum");//파일이 첨부된 원글 번호
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		FileDto fileDto = dao.getFileInfo(snum);
		
		String filename = fileDto.getFilename();
		
		PrintWriter out;
		try {
			response.setContentType("text/html;charset=utf-8");
			out = response.getWriter();
			out.println("<script>window.location.href='/resources/uploadfiles/" + filename + "'</script>");
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/reservation/showlist";
	}
	
	//////////////////////////////이벤트게시판영역///////////////////////////////////
	
	@RequestMapping(value = "/eventwrite")
	public String question(HttpSession session, Model model) {
			
		String sessionId = (String) session.getAttribute("memberId");
		
		if(sessionId == null) {//로그인 상태 확인
			model.addAttribute("memberId", "ADMIN");
		} else {
			model.addAttribute("memberId", sessionId);
		}
		
		model.addAttribute("memberId", sessionId);
		return "event/question";
	}
	
	@RequestMapping(value = "/questionOk")
	public String questionOk(HttpServletRequest request) {
		
		String qid = request.getParameter("qid");//글쓴유저 아이디
		String qname = request.getParameter("qname");//글쓴 질문 내용
		String qcontent = request.getParameter("qcontent");//글쓴 질문 내용
		String qemail = request.getParameter("qemail");//글쓴유저 이메일
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.writeQuestion(qid, qname, qcontent, qemail);
		
		return "redirect:event";
	}
	
	@RequestMapping(value = "event")
	public String list( Model model, Criteria cri,HttpServletRequest request) {//페이징해야하므로 Criteria 가져온다
		
		int pageNumInt=0;
		if(request.getParameter("pageNum") == null) {
			 pageNumInt =1;//1페이지부터 시작
			cri.setPageNum(pageNumInt);
		} else {
			 pageNumInt =Integer.parseInt(request.getParameter("pageNum"));
			 cri.setPageNum(pageNumInt);
		}
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int totalRecord = dao.boardAllCount();
		//cri.setPageNum();
		cri.setStartNum(cri.getPageNum()-1 * cri.getAmount()); 
		
		PageDto pageDto = new PageDto(cri, totalRecord); 

		List<EventBDto> qboardDtos = dao.questionList(cri);
		
		model.addAttribute("pageMaker", pageDto);//pageMaker = pageDto
		model.addAttribute("qdtos", qboardDtos );
		model.addAttribute("currPage", pageNumInt );
		
		return "event/questionList";
	}
	
	
	
	@RequestMapping(value = "questionView")
	public String questionView(HttpServletRequest request, Model model) {
		
		String qnum = request.getParameter("qnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		EventBDto qBoardDto = dao.questionView(qnum);
		
		model.addAttribute("qdto", qBoardDto);
		model.addAttribute("qid", qBoardDto.getQid());
		
		return "event/questionView";
	}
	
	@RequestMapping(value = "questionModify")
	public String questionModify(HttpServletRequest request, Model model,HttpSession session) {
		
//        String sessionId = (String) session.getAttribute("memberId");
//		
//		if(sessionId == null) {//로그인 상태 확인
//			model.addAttribute("memberId", "ADMIN");
//		} else {
//			model.addAttribute("memberId", sessionId);
//		}
//		
//		model.addAttribute("memberId", sessionId);
//	
		
		String qnum = request.getParameter("qnum");
		IDao dao = sqlSession.getMapper(IDao.class);
		
		EventBDto qBoardDto = dao.questionView(qnum);
		
		model.addAttribute("qdto", qBoardDto);
		return "event/questionModify";
	}

	
	@RequestMapping(value = "questionModifyOk")
	public String questionModifyOk(HttpServletRequest request, Model model) {
		
		String qnum = request.getParameter("qnum");
		String qname = request.getParameter("qname");
		String qcontent = request.getParameter("qcontent");
		String qemail = request.getParameter("qemail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.questionModify(qnum, qname, qcontent, qemail);
		
		return "redirect:event";
	}
	
	
	@RequestMapping(value = "questionDelete")
	public String questionDelete(HttpServletRequest request, Model model) {
		
		String qnum = request.getParameter("qnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.questionDelete(qnum);
	
		
		return "redirect:event";
	}
	
	//////////////////////////////이벤트게시판영역///////////////////////////////////

//    //////////////////////////////검색 영역///////////////////////////////////
//	@RequestMapping(value = "search_list")
//	public String search_list(HttpServletRequest request, Model model) {
//		
//		String searchOption = request.getParameter("searchOption");
//		//title, content, writer 3개중에 한개의 값을 저장
//		String searchKey = request.getParameter("searchKey");
//		//유저가 입력한 제목/내용/글쓴이 에 포함된 검색 키워드 낱말
//		IDao dao = sqlSession.getMapper(IDao.class);
//		
//		ArrayList<ShowDto> boardDtos = null;
//		List<ShowDto> showboardDtos = dao.showList2();
//		
//		if(searchOption.equals("stitle")) {
//			boardDtos = dao.showSearchTitleList(searchKey);			
//		} else if(searchOption.equals("sdday")) {
//			boardDtos = dao.showSearchContentList(searchKey);
//		} else if(searchOption.equals("kind")) {
//			boardDtos = dao.showSearchWriterList(searchKey);
//		} 	
//		
//		model.addAttribute("showList",showboardDtos);
//		model.addAttribute("showList", boardDtos);
//		model.addAttribute("boardCount", boardDtos.size());//검색 결과 게시물의 개수 반환
//		
//		return "reservation/showlist";
//	}
	
	
    //////////////////////////////고객센터///////////////////////////////////
	@RequestMapping(value = "support")
	public String support(HttpServletRequest request, Model model) {
		
	
	
		
		return "customer/support";
	}
   //////////////////////////////고객센터///////////////////////////////////
}
