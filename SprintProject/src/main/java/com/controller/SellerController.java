package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.GoodsDTO;
import com.dto.SellerDTO;
import com.dto.StockDTO;
import com.dto.StockDTO2;
import com.service.SellerService;

@Controller
public class SellerController {

	@Autowired
	SellerService service;
	
	//로그인
	@RequestMapping(value = "/loginS")
	public String loginS(@RequestParam HashMap<String, String> map ,  HttpSession session ) {
		SellerDTO dto =  service.login(map);
		
		if( dto == null) {
			session.setAttribute("loginfailed", "아이디 비번을 확인하세요");
			return "redirect:loginForm";
		}else {
			//2. 아이디 비번이 일치하면 session에 id/비번을 저장한다. 
			session.setAttribute("login_seller", dto);
			return "redirect:dashBoard";
		}		
	}
	
	
	//ajax로 id중복체그 부분
	@RequestMapping(value = "/idDuplicateCheckS")
	public @ResponseBody String idDuplicateCheckS(@RequestParam String sid) {
		System.out.println("ajaxs," + sid);
		String result =null;
		//1. idCheck하기 
		
		// mid가 공백으로 오면.. 
		if ( sid =="") { 
			System.out.println("공백");
			result ="failed";
		}else {
			// 공백이 아니면
			int m =0;
			m = service.idCheck(sid);
			// 0이면 중복이 아니니 사용가능한 아이디
			if( m == 0) {
				result ="success";
			}else {
				//1이면 사용불가능한 아이디 
				result ="duplicate";
			}
		}
		return result;// @ResponseBody가 있어서 주소가 아닌 String으로 전달된다.
	}
	
	//memberForm -> db에 회원정보등록
	@RequestMapping(value = "/sellerAdd")
	public String sellerAdd(SellerDTO dto , HttpSession session) {
		
		System.out.println("sellerAdd+" + dto);
		
		String nextpage =null;
		//1단계 db에 저장하기 
		int m = service.insert(dto);
		if ( m ==0) {
			System.out.println("sellerAdd db insert 실패");
			nextpage = "redirect:memberForm";//예상치못한 에러로 다시 회원가입폼으로이동
		}else {
			//2단계 session에 로그인 성공 메세지 저장하기
			session.setAttribute("sellerAdd", "Seller 회원가입성공");
			nextpage = "redirect:main";//회원가입성공, 메인페이지로.. 
		}
		return nextpage;
	}
	
	@RequestMapping(value = "/SellerGoodsAdd")
	public String SellerGoodsAdd(GoodsDTO dto, HttpSession session) {
		System.out.println(dto);
		int num = service.SellerGoodsAdd(dto);
		
		System.out.println(num);
		session.setAttribute("mesg", "상품등록 성공!");

		return  "redirect:registerGoods";
	}
	
	@RequestMapping(value = "/SellerGoodsIDCheck", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String SellerGoodsIDCheck(String gid) {

		int num = service.SellerGoodsIDCheck(gid);
		String mesg = "상품아이디 사용가능";
		if (num == 1) {
			mesg = "상품아이디 중복";
		}

		return mesg;
	}
	
	
	
	//로그인 성공 .. dashBoard 화면.. 
	@RequestMapping(value = "/dashBoard")
	public String dashBoard() {
		
		return  "main_seller";
	}
	
	//상품 등록 화면.. 
	@RequestMapping(value = "/registerGoods")
	public String registerGoods(HttpSession session , HttpServletRequest request) {
		SellerDTO seller = (SellerDTO) session.getAttribute("login_seller");
		String sid = seller.getSid();
		int count = 0;
		List<GoodsDTO> list = service.SellerGoodsList(sid);

		for (int i = 0; i <= list.size(); i++) {
			count = i;
		}

		session.setAttribute("list", list);
		session.setAttribute("listcount", count);

		return  "s_register_goods";
	}
	
	//상품현황 삭제
	@RequestMapping(value = "/SellerGoodsDelete")
	@ResponseBody
	public int SellerGoodsDelete(String gid, HttpSession session) {
		
		int num = service.SellerGoodsDelete(gid);

		int mesg = 0;
		if (num == 1) {
			mesg = 1;
		}
		
		return mesg;
	}
	
	//상품현황 수정
	@RequestMapping(value = "/SellerGoodsUpdate",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String SellerGoodsUpdate(GoodsDTO dto, HttpSession session) {
		System.out.println(dto);
		int num = service.SellerGoodsUpdate(dto);

		String mesg = "0";
		if (num == 1) {
			mesg = "1";
		}
		
		return mesg;
		
	}
	
	//재고 관리 화면.. (현황 재고등록 추가)
	@RequestMapping(value = "/stock")
	public String stock(HttpSession session) {
		
		SellerDTO seller = (SellerDTO) session.getAttribute("login_seller");
		String sid = seller.getSid();
		
		int count = 0;
		
		List<StockDTO> sDTO = service.SelectStock(sid);//판매자 상품 재고현황 리스트
		List<GoodsDTO> gDTO = service.SelectGoods(sid);//로그인 된 판매자의 상품리스 가져오기
		
		
		for (int i = 0; i <= sDTO.size(); i++) {
			count = i;
		}
		List<StockDTO2> list = new ArrayList<StockDTO2>(); //최종 리스트를 넘길 리스트 를 생성 
		String gid = null; //재고현황의 gid 값
		String gid2 = null; //상품리스트의 gid 값
		String gcolor = null; // 상품 색상 값
		String gsize = null; // 상품 사이즈 값
		int gstock = 0;  // 상수 수량값
		String gname = null; // 상품이름 
		int num = 0;
		
		for (StockDTO s : sDTO) {
			gid = s.getGid(); //재고의 gid를 가져옴
			num = s.getNum();
			
			for (GoodsDTO g : gDTO) {
				gid2 = g.getGid(); //상품의 gid를 가져옴
				
				if (gid.equals(gid2)) {//재고와 상품의 gid값이 같은것을 변수의 담는다.
					gid = s.getGid();
					gcolor = s.getGcolor();
					gsize = s.getGsize();
					gstock = s.getGstock();
					gname = g.getGname();
					
					
			StockDTO2 dto2  = new StockDTO2(gid, gcolor, gstock, gsize, gname, num);//for문안에서 객체생성
			
			list.add(dto2); //list에 담아준다.
					
		}//if문
		}//goods
		}//stock
		
		session.setAttribute("list", list);
		session.setAttribute("count",count);	
		
		
		return  "s_stock";
	}
	
	//재고현황 수정
	@RequestMapping(value = "/SellerStockUpdate")
	@ResponseBody
	public String SellerStockUpdate(@RequestParam Map<String, String> map , HttpSession session) {
		
		int count = service.SellerStockUpdate(map);
		String mesg = "0";
		if(count == 1) {
			mesg = "1";
		}
		
		return mesg;
	}
	
	//재고현황 삭제
	@RequestMapping(value = "/SellerStockDelete")
	@ResponseBody
	public String SellerStockDelete(int num) {

		int count = service.SellerStockDelete(num);
		String mesg = "0";
		if (count == 1) {
			mesg = "1";
		}

	return mesg;
}
	
	@RequestMapping(value = "/SellerStockAdd")
	public String SellerStockAdd(StockDTO dto, HttpSession session) {
		
		System.out.println(dto);
		
		int count = service.SellerStockAdd(dto);
		
		session.setAttribute("mesg", "재고등록 성공!");
		
		return "redirect:stock";
	}
	
	@RequestMapping(value = "/SellerStockCheck")
	@ResponseBody
	public int SellerStockCheck(StockDTO dto) {
		System.out.println(dto);
		
		int count = service.SellerStockCheck(dto);

		int alert = 0;
		if (count == 1) {
			alert = 1;
		}
		
		return alert;
	}
	
	//리뷰 관리 화면.. 
	@RequestMapping(value = "/review")
	public String review() {
		
		return  "s_review";
	}
	
	//Q&A 관리 화면.. 
		@RequestMapping(value = "/qna")
		public String qna() {
			
			return  "s_qna";
		}
		
	//반품 관리 화면.. 
		@RequestMapping(value = "/returnGoods")
		public String returnGoods() {
			
			return  "s_return";
		}
		
		
	//반품 관리 화면.. 
		@RequestMapping(value = "/delivery")
		public String delivery() {
			
			return  "s_delivery";
		}
		
		
		
}
