package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SellerDAO;
import com.dto.SellerDTO;

@Service
public class SellerService {

	@Autowired
	SellerDAO dao;

	public SellerDTO login(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		SellerDTO dto = dao.login(map);
		return dto;
	}

	public int idCheck(String sid) {
		// TODO Auto-generated method stub
		int m = dao.idCheck(sid);
		return m;
	}

	public int insert(SellerDTO dto) {
		// TODO Auto-generated method stub
		int m = dao.insert(dto);
		return m;
	}
	
	
	
	
	
	
}
