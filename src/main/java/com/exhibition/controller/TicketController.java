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
import com.exhibition.dto.FileDto;
import com.exhibition.dto.ShowDto2;
import com.exhibition.dto.Ticket;
import com.exhibition.dto.Ticketing;

@Controller
public class TicketController {

	@Autowired
	private SqlSession sqlSession;
	
	
//	@RequestMapping(value="/ticketing")
//	public String confirm() {
//		return "ticketing";
//	}
	
	@RequestMapping(value="/ticket")
	public String confirm() {
		
		
		return "ticket";
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
		public String ticketDelete(HttpServletRequest request,Model model) {
			
			String snum = request.getParameter("snum");
			
			IDao dao = sqlSession.getMapper(IDao.class);
			dao.ticketDelete(snum);
			
			return "redirect:tikecting/ticketConfirm";
		}
	   
		
		@RequestMapping(value="/ticketingOk")
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
		
//	@RequestMapping(value = "/ticketConfirm")
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
//		return "tikecting/ticketConfirm";
//	}
//	
//	
//	@RequestMapping(value="/ticketDelete")
//	public String ticketDelete(HttpServletRequest request, Model model) {
//		
//		String tnum = request.getParameter("tnum");
//		IDao dao = sqlSession.getMapper(IDao.class);
//		
//		dao.ticketDelete(tnum);
//		
//		return "redirect:ticketConfirm";
//	}
	
}
