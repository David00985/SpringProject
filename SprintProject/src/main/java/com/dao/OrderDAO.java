package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dto.CreditCartDTO;
import com.dto.OrderDTO;

@Service
public class OrderDAO {

	@Autowired
	SqlSessionTemplate session;

	public List<OrderDTO> orderChart(String mid) {
		// TODO Auto-generated method stub
		List<OrderDTO> list = session.selectList("OrderMapper.orderChart",mid);
		return list;
	}

	public String checkCreditCardByDTO(CreditCartDTO credit) {
		// TODO Auto-generated method stub
		String m=null;
		m = session.selectOne("OrderMapper.checkCreditCardByDTO" , credit);
		return m;
	}

	public int insertCreditCardByDTO(CreditCartDTO credit) {
		// TODO Auto-generated method stub
		int m=0;
		m = session.insert("OrderMapper.insertCreditCardByDTO" , credit);
		return m;
	}

	public List<OrderDTO> deliverinfo(int oid) {
		// TODO Auto-generated method stub
		List<OrderDTO> list = session.selectList("OrderMapper.deliverinfo", oid);
		return list;
	}
	
}
