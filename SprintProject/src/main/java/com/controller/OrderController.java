package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.MemberDAO;
import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.dto.StockDTO;
import com.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	OrderService service;
	
	@RequestMapping(value = "/loginCheck/orderChart")
	public String orderChart(HttpSession session){
		System.out.println("주문조회 기능");
		MemberDTO dto = (MemberDTO) session.getAttribute("login_member");
		String mid = dto.getMid();
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
		return "deliver";
	}
	
	@RequestMapping(value = "/deliverinfo")
	public String deliverinfo(HttpSession session) {
		System.out.println("주문자정보페이지 이동");
		OrderDTO dto = (OrderDTO)session.getAttribute("orderChart");
		int oid = dto.getOid();
		List<OrderDTO> list = service.deliverinfo(oid);
		System.out.println(list);
		session.setAttribute("deliverinfo", list);
		return "deliverinfo";
	}
	
}
