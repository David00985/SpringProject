package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.OrderDAO;
import com.dto.CreditCartDTO;
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

	public String checkCreditCardByDTO(CreditCartDTO credit) {
		// TODO Auto-generated method stub
		String m=null;
		m = dao.checkCreditCardByDTO(credit);
		return m;
	}

	public int insertCreditCardByDTO(CreditCartDTO credit) {
		// TODO Auto-generated method stub
		int m=0;
		m = dao.insertCreditCardByDTO(credit);
		return m;
	}

	public List<OrderDTO> deliverinfo(int oid) {
		// TODO Auto-generated method stub
		List<OrderDTO> list = dao.deliverinfo(oid);
		return list;
	}

	
}
