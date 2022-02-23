package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.dto.OrderProductDetailDTO;
import com.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	OrderService service;
	
	@RequestMapping(value = "/loginCheck/orderChart")
	public String orderChart(HttpSession session){
		System.out.println("주문조회 기능");
		MemberDTO mdto = (MemberDTO)session.getAttribute("login_member");
		String mid = mdto.getMid();
		List<OrderProductDetailDTO> list = service.orderChart(mid);
		System.out.println(list);
		session.setAttribute("orderChart", list);
		return "redirect:../orderChart";
	}
	
	@RequestMapping(value = "/orderChart")
	public String ordercart2() {
		return "orderChart";
	}
	
	
	@RequestMapping(value = "/deliver")
	public String deliver() {
		System.out.println("배송조회");
		return "deliver";
	}
	
	@RequestMapping(value = "/orderChart_info")
	public String orderChart_info(HttpSession session) {
		System.out.println("구매자정보조회");
		
		MemberDTO dto = (MemberDTO)session.getAttribute("login_member");
		String mid = dto.getMid();
		
		List<OrderDTO> list = service.orderChart_info(mid);
		
		System.out.println(list);
		session.setAttribute("info", list);
		
		return "orderChart_info";
	}
	

	
	
	
	
	
	
}
