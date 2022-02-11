package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SellerDAO;
import com.dto.GoodsDTO;
import com.dto.PageDTO;
import com.dto.SellerDTO;
import com.dto.StockDTO;

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

	public int SellerGoodsAdd(GoodsDTO dto) {
		int num = dao.SellerGoodsAdd(dto);
		return num;
	}

	public int SellerGoodsIDCheck(String gid) {
		int num = dao.SellerGoodsIDCheck(gid);
		return num;
	}

	public List<GoodsDTO> SellerGoodsList(String sid) {
		List<GoodsDTO> list = dao.SellerGoodsList(sid);
		return list;
	}

	public int SellerGoodsDelete(String gid) {
		int num = dao.SellerGoodsDelete(gid);
		return num;
	}

	public int SellerGoodsUpdate(GoodsDTO dto) {
		int num = dao.SellerGoodsUpdate(dto);
		return num;
	}

	public List<StockDTO> SelectStock(String sid) {
		List<StockDTO> sDTO = dao.SelectStock(sid);
		return sDTO;
	}

	public List<GoodsDTO> SelectGoods(String sid) {
		List<GoodsDTO> sDTO = dao.SelectGoods(sid);
		return sDTO;
	}

	public int SellerStockUpdate(Map<String, String> map) {
		int count = dao.SellerStockUpdate(map);
		return count;
	}

	public int SellerStockDelete(int num) {
		int num1 = dao.SellerStockDelete(num);
		return num1 ;
	}

	public int SellerStockAdd(StockDTO dto) {
		int num = dao.SellerStockAdd(dto);
		return num;
	}

	public int SellerStockCheck(StockDTO dto) {
		int count = dao.SellerStockCheck(dto);
		return count;
	}

	public List<GoodsDTO> selectgidT(String T) {
		List<GoodsDTO> gidT = dao.selectgidT(T);
		return gidT;
	}

	
	public PageDTO SellergoodsPage(String sid, int curPage) {
		PageDTO dto = dao.SellergoodsPage(sid, curPage);
		return dto;
	}
	 

	
	
	
}
