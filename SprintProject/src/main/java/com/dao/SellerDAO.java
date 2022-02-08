package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dto.GoodsDTO;
import com.dto.SellerDTO;
import com.dto.StockDTO;

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

	public int SellerGoodsAdd(GoodsDTO dto) {
		int num = session.insert("GoodsMapper.SellerGoodsAdd",dto);
		return num;
	}

	public int SellerGoodsIDCheck(String gid) {
		int num =session.selectOne("GoodsMapper.SellerGoodsIDCheck",gid);
		return num;
	}

	public List<GoodsDTO> SellerGoodsList(String sid) {
		List<GoodsDTO> list = session.selectList("GoodsMapper.SellerGoodsList",sid);
		return list;
	}

	public int SellerGoodsDelete(String gid) {
		int num = session.delete("GoodsMapper.SellerGoodsDelete",gid);
		return num;
	}

	public int SellerGoodsUpdate(GoodsDTO dto) {
		int num = session.update("GoodsMapper.SellerGoodsUpdate",dto);
			return num;
	}

	public List<StockDTO> SelectStock(String sid) {
		List<StockDTO> sDTO = session.selectList("StockMapper.selectSellergoods",sid);
		return sDTO;
	}

	public List<GoodsDTO> SelectGoods(String sid) {
		List<GoodsDTO> sDTO = session.selectList("StockMapper.selectgoods",sid);
		return sDTO;
	}

	public int SellerStockUpdate(Map<String, String> map) {
		int count = session.update("StockMapper.SellerStockUpdate",map);
		return count;
	}

	public int SellerStockDelete(int num) {
		int num1 = session.delete("StockMapper.SellerStockDelete",num);
		return num1;
	}

	public int SellerStockAdd(StockDTO dto) {
		int num = session.insert("StockMapper.SellerStockAdd",dto);
		return num;
	}

	public int SellerStockCheck(StockDTO dto) {
		int count = session.selectOne("StockMapper.SellerStockCheck",dto);
		return count;
	}
}
