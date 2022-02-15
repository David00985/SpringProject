package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
