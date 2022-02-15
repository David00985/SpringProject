package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("OrderDTO")
public class OrderDTO {

	
	private int oid; // index 값.. 
	// 배달할 주소지 정보
	private String mid;
	private String ordate;
	private String oname;
	private String ophone1;
	private String ophone2;
	private String ophone3;
	private String oaddress1;
	private String oaddress2;
	private String opost;
	
	private String paymentid;  // 결제정보가 담긴 payment테이블fk
	private String opindex;    // 구매한 상품들의 정보가 있는 orderproduct테이블fk
	
	// 화면에 필요한 정보
	private String oproductname; // 출력형식은 xxx 상품 외 2개..
	private int oprice;          // 구매한 가격
	private String oimage;       // 화면에 나올 대표 이미지
	private int opaymentcheck;   // 결제했는지 확인하는 곳
	private int odelivery;       // 배달상태를 나타내는 변수
	private int oconfirmed;      // 구매확정 혹은 개별 반품? 전체반품?
	
	
	
	
	
}
