package com.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GoodsDAO;
import com.dto.CartDTO;
import com.dto.GoodsDTO;

@Service
public class GoodsService {

	@Autowired
	GoodsDAO dao;

	public List<GoodsDTO> selectAllByCategory(String gCategory) {
		// TODO Auto-generated method stub
		List<GoodsDTO> list = dao.selectAllByCategory(gCategory);
		return list;
	}

	public GoodsDTO goodsRetrieve(String gid) {
		// TODO Auto-generated method stub
		GoodsDTO dto = dao.goodsRetrieve(gid);
		return dto;
	}

	public int GhitPlusOne(String gid) {
		// TODO Auto-generated method stub
		int dto = dao.GhitPlusOne(gid);
		return dto;
	}

	public int cartAdd(CartDTO dto) {
		// TODO Auto-generated method stub
		int m = dao.cartAdd(dto);
		return m;
	}

	


}
