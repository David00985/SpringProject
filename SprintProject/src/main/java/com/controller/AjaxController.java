package com.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.BankAccountDTO;
import com.dto.CartDTO;
import com.dto.CouponDTO;
import com.dto.CouponUserDTO;
import com.dto.CreditCartDTO;
import com.dto.MemberDTO;
import com.service.CartService;
import com.service.MemberService;
import com.service.StockService;

@Controller
public class AjaxController {

	@Autowired
	MemberService mservice;
	@Autowired
	CartService cservice;
	@Autowired
	StockService stservice;
	
	// 유저 아이디 한번더 검증하기 
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
	
	// 쿠폰이 실제 사용 가능한지 검사하는 
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
	
	// ordercartlist 제고 있나 검사하기.. 
	@RequestMapping(value = "/loginCheck/stockCheckPromise")
	public @ResponseBody String stockCheckPromise( HttpSession session) {
		
		String result ="";
		List<CartDTO> orderCartlist = (List<CartDTO>) session.getAttribute("orderCartlist");
		boolean flag = true;
		
		//gid , size , color 에 맞는 제고량확인하기
		for (CartDTO dto : orderCartlist) {
			
			int x = 0;
			x = stservice.stockCheckByCartDTO(dto);
			
			if( x == 0) {
				System.out.println("제고 0" + dto.getCid());
				result += dto.getGid() +"_Instock:0 , Your orderCqty:"+ dto.getCqty() +"\n";
				flag = false;
			}else {
				System.out.println(dto.getCid() + "남은 제고량: " +x + "구매하고자하는양:" + dto.getCqty());
				
				if( dto.getCqty() > x) {
					System.out.println("제고량부족" + dto.getCid());
					result += dto.getGid() +"_Instock:" + x + ", Your orderCqty:" + dto.getCqty() +",\n";
					flag = false;
				}
			}
			
			
		}
		
		if(flag) {
			result = "success";
		}
		
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	// 쿠폰 세션에 저장하기 
	@RequestMapping(value = "/loginCheck/couponSessionUpdatePromise")
	public @ResponseBody String couponSessionUpdatePromise(@RequestParam String code , HttpSession session) {
		
		System.out.println("couponSessionUpdatePromise:" + code);
		
		String result ="success";
		CouponDTO dto = cservice.couponSelectByCode(code);
		
		if(dto == null) {
			result = "failed";
		}else {
			session.setAttribute("dcCode", dto);
			System.out.println("ajax 서버에서 dcCode세션 등록완료");
		}
	
		return result;
	}
	
	// 쿠폰 세션에 삭제하기 
	@RequestMapping(value = "/loginCheck/couponSessionDeletePromise")
	public @ResponseBody String couponSessionDeletePromise(@RequestParam String code , HttpSession session) {
		
		System.out.println("couponSessionDeletePromise:" + code);
		
		String result ="success";
		
		session.removeAttribute("dcCode");
		System.out.println("ajax 서버에서 dcCode세션 제거완료");
		return result;
	}
	
//	 
//	 @RequestParam int cvv, ,) {

	
	
	// 결제 정보 저장 밑 오더테이블에 넣을 opaymethod 리턴하기.. 
	// DTO로 받을려고 했는데 400에러가 났다...원인은 자동 형변환? dto타입중에 int있는데 그형변환에 문제가 있는듯하다.  그래서 일일이 받게됬다. 
	@RequestMapping(value = "/loginCheck/PaymentInsertPromise")
	public @ResponseBody String PaymentInsertPromise(@RequestParam String selectpayment , @RequestParam String cvv ,@RequestParam String month ,@RequestParam String day , @RequestParam String cardnumber ,@RequestParam String accountname ,@RequestParam String accountnumber ,@RequestParam String bank ,@RequestParam String company , HttpSession session) {
		
		
		MemberDTO dto = (MemberDTO) session.getAttribute("login_member");
		String mid = dto.getMid();
		String result ="failed";
		
		// 분기... 신용카드 선택
		if(selectpayment.equals("신용카드") ) {
			System.out.println("신용카드");
			System.out.println("PaymentInsertPromise:" + company + cardnumber + day + month +cvv );
			CreditCartDTO credit = new CreditCartDTO(0, mid, company, cardnumber, Integer.parseInt(day), Integer.parseInt(month), Integer.parseInt(cvv));
			
			System.out.println(credit);
			
			// 1. creditcard 테이블에 이미 등록됬는지 체크
			
			
			// 2. 없으면 등록하기, 있으면 creditcard pk값 가져오기 
			
			
			// 3. payment 테이블에 등록하고, payment pk값을 리턴하기.. 
			
			result = "credit";
		// 분기2... 계좌이체 선택	
		}else if(selectpayment.equals("계좌이체")) {
			System.out.println("계좌이체");
			BankAccountDTO account = new BankAccountDTO(0, mid, accountnumber, accountname, bank);
			System.out.println(account);
			
			// 1. bankaccount 테이블에 이미 등록됬는지 체크
			
			
			// 2. 없으면 등록하기 , 있으면 bankaccount pk값 가져오기 
						
						
			// 3. payment 테이블에 등록하고, payment pk값을 리턴하기.. 
			
			result = "account";
		// 이거 나오면 버그..
		}else {
			System.out.println("에러.. ");
		}
		
		
		
	
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
