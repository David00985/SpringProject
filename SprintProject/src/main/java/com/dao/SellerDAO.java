package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dto.SellerDTO;

@Service
public class SellerDAO {

	@Autowired
	SqlSessionTemplate session;

	public SellerDTO login(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		SellerDTO dto = session.selectOne("SellerMapper.login" , map);
		return dto;
	}

	public int idCheck(String sid) {
		// TODO Auto-generated method stub
		int m = session.selectOne("SellerMapper.idCheck",sid);
		return m;
	}

	public int insert(SellerDTO dto) {
		// TODO Auto-generated method stub
		int m = session.insert("SellerMapper.insert",dto);
		return m;
	}
}
