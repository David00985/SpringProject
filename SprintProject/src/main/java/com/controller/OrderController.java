package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.MemberDTO;
import com.dto.OrderDTO;
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
		return "orderChart";
	}
	
	
	
}
