package com.exhibition.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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
import com.exhibition.dto.MemberDto;
import com.exhibition.dto.ShowDto;
import com.rubato.home.dto.RFBoardDto;


@Controller
public class MainController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping (value ="/")
	public String home () {
		
		return "index";
	}

	@RequestMapping (value ="join")
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
	
	
	@RequestMapping (value ="login")
	public String login () {
		
		return "login";
	}
	
	@RequestMapping (value = "logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "index";
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
	
	@RequestMapping (value ="show")
	public String show () {
		
		return "/reservation/showview";
	}
	
	@RequestMapping (value ="showlist")
	public String showlist () {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		ArrayList<ShowDto> boardDtos = dao.showList();
		
		int boardCount = dao.rfboardAllCount();
		
		model.addAttribute("boardList",boardDtos);
		model.addAttribute("boardCount",boardCount);
		
		
		return "/reservation/showlist";
	}
	
	@RequestMapping (value ="showwrite")
	public String showwrite () {
		
		return "/reservation/showwrite";
	}
	
	@RequestMapping(value = "writeOk")
	public String writeOk(HttpServletRequest request, HttpSession session, @RequestPart MultipartFile files) throws IllegalStateException, IOException {
		
		String showTitle = request.getParameter("stitle");
		String showLocation = request.getParameter("slocation");
		String showTime = request.getParameter("stime");
		String showAge = request.getParameter("sage");
		String showPrice = request.getParameter("sprice");
		String sessionId = (String) session.getAttribute("memberId");
		//글쓴이의 아이디는 현재 로그인된 유저의 아이디이므로 세션에서 가져와서 전달 
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		if(files.isEmpty()) { // 파일의 첨부여부 확인
			dao.showWrite(showTitle, showLocation, showTime,showAge,showPrice, sessionId, 0);
		} else {
			dao.showWrite(showTitle, showLocation, showTime,showAge,showPrice, sessionId, 1);
			ArrayList<ShowDto> latestBoard = dao.boardLatestInfo(sessionId);
			ShowDto dto = latestBoard.get(0);
			int snum = dto.getSnum();
			//파일첨부
			String fileoriname = files.getOriginalFilename();//첨부된 파일의 원래 이름
			String fileextension = FilenameUtils.getExtension(fileoriname).toLowerCase();
			//첨부된 파일의 확장자 추출 후 소문자로 강제 변경
			File destinationFile;//java.io 패키지 제공 클래스 임포트
			String destinationFileName;//실제 서버에 저장된 파일의 변경된 이름이 저장될 변수 선언
			
			String fileurl = "C:/Users/napmkmk/git/ExhibitoinPJ/src/main/resources/static/uploadfiles";
			//첨부된 파일이 저장될 서버의 실제 폴더 경로 //String fileurl = "C:/springBootWork/Exhibition/src/main/resources/static/uploadfiles";
			
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
	
	
	@RequestMapping (value ="event")
	public String event () {
		
		return "/event/evlist";
	}
	
}
