package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.MemberDTO;
import com.dto.SellerDTO;
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
	
	
	
	
	
	
	
	//로그인 성공 .. dashBoard 화면.. 
	@RequestMapping(value = "/dashBoard")
	public String dashBoard() {
		
		return  "main_seller";
	}
	
	//상품 등록 화면.. 
	@RequestMapping(value = "/registerGoods")
	public String registerGoods() {
		
		return  "s_register_goods";
	}
	
	
	
	//재고 관리 화면.. 
	@RequestMapping(value = "/stock")
	public String stock() {
		
		return  "s_stock";
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
