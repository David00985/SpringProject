package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.CouponUserDTO;
import com.dto.MemberDTO;
import com.service.CartService;
import com.service.MemberService;

@Controller
public class AjaxController {

	@Autowired
	MemberService mservice;
	@Autowired
	CartService cservice;
	
	@RequestMapping(value = "/loginCheck/userInfoAjax")
	public @ResponseBody String userInfoAjax(HttpSession session ) {
		
		MemberDTO dto = (MemberDTO) session.getAttribute("login_member");
		
		String mid = dto.getMid();
		String result = "failed";
		int m = 0;
		
		m = mservice.idCheck(mid);
		
		if( m == 0) {
			result = "failed";
		}else {
			result = "success";
		}
		return result;
	}
	
	
	@RequestMapping(value = "/loginCheck/couponPromise")
	public @ResponseBody String couponPromise(@RequestParam String code , HttpSession session) {
		
		System.out.println("couponpromise:" + code);
		MemberDTO dto = (MemberDTO) session.getAttribute("login_member");
		String mid = dto.getMid();
	
		//1. couponuser db에서 사용한 쿠폰인지 확인하기 . 
		
		String result = "success";
		int m = 0;
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("code", code);
		map.put("mid", mid);
		
		CouponUserDTO userdto = cservice.couponuserSelectByMid(map);
		
		
		
		if( userdto == null) {
			result = "failed";
		}else {
			int used = userdto.getUsed();
			if(used == 1) {
				result = "used";
			}else {
				result = "success";
			}
			
		}
		
		return result;
	}
	
	
	
	
}
