package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.OrderDAO;

@Service
public class OrderService {

	@Autowired
	OrderDAO dao;
	
	
}
