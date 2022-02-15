package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.OrderDAO;
import com.dto.OrderDTO;

@Service
public class OrderService {

	@Autowired
	OrderDAO dao;

	public List<OrderDTO> orderChart(String mid) {
		// TODO Auto-generated method stub
		List<OrderDTO> list= dao.orderChart(mid);
		return list;
	}

	
}
