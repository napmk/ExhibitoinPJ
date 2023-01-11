package com.exhibition.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.exhibition.dao.IDao;
import com.exhibition.dto.Criteria;
import com.exhibition.dto.FileDto;
import com.exhibition.dto.PageDto;
import com.exhibition.dto.ShowDto;
import com.exhibition.dto.ShowDto2;
import com.exhibition.dto.Ticket;
import com.exhibition.dto.Ticketing;

@Controller
public class TicketController {

	@Autowired
	private SqlSession sqlSession;
	

	
	@RequestMapping (value ="showview")
	public String showview (HttpServletRequest request, Model model, HttpSession session) {
		String sessionId = (String) session.getAttribute("memberId");
		String snum = request.getParameter("snum");
		
		IDao dao = sqlSession.getMapper(IDao.class);

		FileDto fileDto = dao.getFileInfo(snum);
		ShowDto showdto = dao.showView(snum);
		
		model.addAttribute("showView",showdto);
		model.addAttribute("fileDto", fileDto);
		
		
		return "reservation/showview";
	}
	
	
	
	@RequestMapping(value="ticketingOk")
	public String ticketingOk(HttpServletRequest request,Model model) {
		
		String stitle = request.getParameter("stitle");
		String slocation = request.getParameter("slocation");
		String sdday = request.getParameter("sdday");
		String stime = request.getParameter("stime");
		String sage = request.getParameter("sage");
		String sprice = request.getParameter("sprice");
		String userid = request.getParameter("userid");
		String count = request.getParameter("count");
		String skind = request.getParameter("skind");
		 
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int joinFlag = dao.ticketing(stitle, slocation, sdday, stime, sage, sprice, userid, count, skind);
		
		model.addAttribute("stitle", stitle);
		model.addAttribute("slocation", slocation);
		model.addAttribute("sdday", sdday);
		model.addAttribute("stime", stime);
		model.addAttribute("sage", sage);
		model.addAttribute("sprice", sprice);
		model.addAttribute("userid", userid);
		model.addAttribute("count",count);
		model.addAttribute("skind",skind);
		
		return "tikecting/ticketingOk";
	}
	
	
//	
//	@RequestMapping(value = "ticketConfirm")
//	public String test(Model model, HttpServletResponse response,HttpServletRequest request,HttpSession session) throws IOException {
//			
//		IDao dao = sqlSession.getMapper(IDao.class);		
//		
//		String mid = (String) session.getAttribute("memberId");
//		
//		List<Ticketing> ticketConfirmList =dao.ticketConfirm(mid);
//		
//		//System.out.println(ticketConfirmList.get(0).getTnum()); 잘가져오는지 확인한댜
//		
//		model.addAttribute("ticketConfirm", ticketConfirmList);
//		
//		
//		return "ticketConfirm";
//	}
//	
	
	@RequestMapping(value="/ticketConfirm")
	public String showview2(Model model, HttpServletResponse response,HttpServletRequest request,HttpSession session)  throws IOException {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String userid = (String) session.getAttribute("memberId");
		
		List<ShowDto2> ticketConfirmList = dao.ticketConfirm(userid);
		
		model.addAttribute("ticketConfirmList", ticketConfirmList);
		
		return "tikecting/ticketConfirm";
	}
	
	@RequestMapping(value="/ticketDelete")
	public String dadada(HttpServletRequest request,Model model) {
		
		String snum = request.getParameter("snum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.ticketDelete(snum);
		
		return "redirect:ticketConfirm";
	}
	
	@RequestMapping (value ="boardList")
	public String boardList(Model model, Criteria cri,HttpServletRequest request) {//페이징해야하므로 Criteria 가져온다
		
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
		
		List<ShowDto> qboardDtos = dao.ticketList(cri);
		
		model.addAttribute("pageMaker", pageDto);//pageMaker = pageDto
		model.addAttribute("qdtos", qboardDtos );
		model.addAttribute("currPage", pageNumInt );
		
		
		
		ArrayList<ShowDto> boardDtos = dao.tlist();//
		int boardCount = dao.ticketAllCount();//
		
		model.addAttribute("boardList", boardDtos);//
		model.addAttribute("boardCount", boardCount);//
		
		
		

		return "boardList";
	}
	
	@RequestMapping(value = "search_list")
	public String search_list(HttpServletRequest request, Model model) {
		
		String searchOption = request.getParameter("searchOption");
		
		String searchKey = request.getParameter("searchKey");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		ArrayList<ShowDto> showDto = null;
		
		if(searchOption.equals("stitle")) {
			showDto = dao.ShowSearchTitleList(searchKey);			
		} else if(searchOption.equals("slocation")) {
			showDto = dao.ShowSearchLocarionList(searchKey);
		} else if(searchOption.equals("sprice")) {
			showDto = dao.ShowSearchSpriceList(searchKey);
		} 	
		
		
		model.addAttribute("boardList", showDto);
		model.addAttribute("boardCount", showDto.size());
		
		return "boardList";
	}
	
}
