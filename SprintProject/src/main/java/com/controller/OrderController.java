package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dto.CouponUserDTO;
import com.dto.MemberDTO;
import com.dto.OrderChartDTO;
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
		List<OrderDTO> list = service.orderChart(mid);
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
	public  ModelAndView orderChart_info(String opindex,HttpSession session) {
		System.out.println("구매자정보조회");
		MemberDTO mdto = (MemberDTO)session.getAttribute("login_member");
		String mid = mdto.getMid();
		System.out.println(opindex);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mid",mid);
		map.put("opindex",opindex);
		List<OrderChartDTO> list = service.orderChart_info(map);

		
		List<OrderChartDTO> orderlist = list.stream().distinct().collect(Collectors.toList()); //여러개의 중복사이즈 데이터중 중복된 데이터를 제거
	
		System.out.println(orderlist);

	
		System.out.println(list);


		
		ModelAndView mav = new ModelAndView();
		

		mav.addObject("info", orderlist);

		mav.addObject("info", list);

		mav.setViewName("orderChart_info");
		
		return mav;
	}
	
	
	
	
	
	
}
