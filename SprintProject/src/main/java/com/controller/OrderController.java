package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.OrderDTO;
import com.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	OrderService service;
	
	@RequestMapping(value = "/loginCheck/orderChart")
	public String orderChart(@RequestParam String mid, OrderDTO dto){
		System.out.println("주문조회 기능");
		
		return "orderChart";
	}
	
	
	
}
