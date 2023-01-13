package com.exhibition.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.exhibition.dto.Criteria2;
import com.exhibition.dto.Criteria3;
import com.exhibition.dto.FileDto;
import com.exhibition.dto.PageDto;
import com.exhibition.dto.PageDto2;
import com.exhibition.dto.PageDto3;
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
	public String ticketingOk(HttpServletRequest request,Model model,HttpSession session, HttpServletResponse response) {
		
		String stitle = request.getParameter("stitle");
		String slocation = request.getParameter("slocation");
		String sdday = request.getParameter("sdday");
		String stime = request.getParameter("stime");
		String sage = request.getParameter("sage");
		String sprice = request.getParameter("sprice");
		String userid = request.getParameter("userid");
		String count = request.getParameter("count");
		String skind = request.getParameter("skind");
		String selectedDate = request.getParameter("selectedDate");
		 
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int joinFlag = dao.ticketing(stitle, slocation, sdday, stime, sage, sprice, userid, count, skind ,selectedDate);
		
		model.addAttribute("stitle", stitle);
		model.addAttribute("slocation", slocation);
		model.addAttribute("sdday", sdday);
		model.addAttribute("stime", stime);
		model.addAttribute("sage", sage);
		model.addAttribute("sprice", sprice);
		model.addAttribute("userid", userid);
		model.addAttribute("count",count);
		model.addAttribute("skind",skind);
		model.addAttribute("selectedDate",selectedDate);
		
//		String sessionId = (String) session.getAttribute("memberId");
//		if(sessionId == null) {//참이면 로그인이 안된 상태
//			PrintWriter out;
//			try {
//				response.setContentType("text/html;charset=utf-8");
//				out = response.getWriter();
//				out.println("<script>alert('로그인 후 예매해 주세요');history.go(-1);</script>");
//				out.flush();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//		}		
		
		return "tikecting/ticketingOk";
	}
	
	

	
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
    public String boardList(Model model, Criteria2 cri, Criteria3 cri3, HttpServletRequest request) {//페이징해야하므로 Criteria2 가져온다 검색할 때 사용할 criteria3도 가져온다 
       
       String searchKey = request.getParameter("searchKey");
       
       if(searchKey != null && searchKey.length() !=0) {
          System.out.println("hi:"+searchKey);
          cri3.setSearchKey(searchKey);
          
          String searchOption = request.getParameter("searchOption");      
          
          IDao dao = sqlSession.getMapper(IDao.class);
          
          ArrayList<ShowDto> showDto = null;
          
          int pageNumInt=1;
          
          int totalRecord = 0;
          
          PageDto3 pageDto = null;
          
          model.addAttribute("searchKeyValue", searchKey);
          model.addAttribute("searchKeyOption", searchOption);
          
          if(request.getParameter("pageNum") == null) {
              pageNumInt =1;//1페이지부터 시작
             cri3.setPageNum(pageNumInt);
          } else {
              pageNumInt =Integer.parseInt(request.getParameter("pageNum"));
              cri3.setPageNum(pageNumInt);
          }
          
          if(searchOption.equals("stitle")) {
             
             cri3.setStartNum(cri.getPageNum()-1 * cri.getAmount());
             
             showDto = dao.ShowSearchTitleList(cri3);
             
             totalRecord = dao.searchTitleListCount(searchKey);//총 게시글수
             
             pageDto = new PageDto3(cri3, totalRecord); 
             
             
          } else if(searchOption.equals("slocation")) {
             
             cri3.setStartNum(cri.getPageNum()-1 * cri.getAmount());
             
             //showDto = dao.ShowSearchTitleList(cri3);
             
             showDto = dao.ShowSearchLocarionList(cri3);
             
             totalRecord = dao.searchLocationListCount(searchKey);//총 게시글수
             
             System.out.println("검색된 총게시글수:"+totalRecord+" / 검색어:"+searchKey);
             
             pageDto = new PageDto3(cri3, totalRecord);
             
          } else if(searchOption.equals("sprice")) {
             
             cri3.setStartNum(cri.getPageNum()-1 * cri.getAmount());
             
             //showDto = dao.ShowSearchTitleList(cri3);
             
             showDto = dao.ShowSearchSpriceList(cri3);
             
             totalRecord = dao.searchPriceListCount(searchKey);//총 게시글수
             
             pageDto = new PageDto3(cri3, totalRecord);
          
          } else if(searchOption.equals("skind")) {
              
              cri3.setStartNum(cri.getPageNum()-1 * cri.getAmount());
              
              //showDto = dao.ShowSearchTitleList(cri3);
              
              showDto = dao.ShowSearchSkindList(cri3);
              
              totalRecord = dao.searchKindListCount(searchKey);//총 게시글수
              
              pageDto = new PageDto3(cri3, totalRecord);
           }
          
          System.out.println("pagenumint:"+pageNumInt);         
          
          model.addAttribute("pageMaker", pageDto);//pageMaker = pageDto
          model.addAttribute("qdtos", showDto);
          model.addAttribute("boardCount", totalRecord);      
          model.addAttribute("currPage", pageNumInt );
          
          
       } else {
       
          int pageNumInt=1;
          if(request.getParameter("pageNum") == null) {
              pageNumInt =1;//1페이지부터 시작
             cri.setPageNum(pageNumInt);
          } else {
              pageNumInt =Integer.parseInt(request.getParameter("pageNum"));
              cri.setPageNum(pageNumInt);
          }
          IDao dao = sqlSession.getMapper(IDao.class);
          
          int totalRecord = dao.ticketAllCount();
          //cri.setPageNum();
          cri.setStartNum(cri.getPageNum()-1 * cri.getAmount()); 
          
          PageDto2 pageDto = new PageDto2(cri, totalRecord); 
          
    //      System.out.println("pagenum:"+cri.getPageNum());
    //      System.out.println("amount:"+cri.getAmount());
    //      System.out.println("startnum:"+cri.getStartNum());
    //      System.out.println("pagenumberint:"+pageNumInt);
          
          List<ShowDto> qboardDtos = dao.ticketList(cri);
          
          model.addAttribute("pageMaker", pageDto);//pageMaker = pageDto
          model.addAttribute("qdtos", qboardDtos );
          model.addAttribute("currPage", pageNumInt );
          model.addAttribute("boardCount", totalRecord);
          
       }
       
       
//       ArrayList<ShowDto> boardDtos = dao.tlist();//
//       int boardCount = dao.ticketAllCount();//
//       
//       model.addAttribute("boardList", boardDtos);//
//       model.addAttribute("boardCount", boardCount);//
       
       
       

       return "boardList";
    }
	
	
}
