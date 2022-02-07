<%@page import="com.dto.SellerDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
 <jsp:include page="../common/topbar_s.jsp" flush="true"></jsp:include>  





<!-- 여기서부터 작성하면 됩니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<div class="cardBox">
	<div class="card">
		
		<div>
			<div class="numbers">1,504</div>
			<div class="cardName">금일 판매물량</div>
		</div>
		<div class="iconBx">
			<ion-icon name="eye-outline"></ion-icon>
		</div>
	</div>
	<div class="card">
		<div>
			<div class="numbers">80</div>
			<div class="cardName">상품 등록수</div>
		</div>
		<div class="iconBx">
			<ion-icon name="basket-outline"></ion-icon>
		</div>
		
	</div>
	<div class="card">
		<div>
			<div class="numbers">284</div>
			<div class="cardName">총판매수</div>
		</div>
		<div class="iconBx">
			<ion-icon name="chatbubbles-outline"></ion-icon>
		</div>
		
	</div>
	<div class="card">
	
		<div>
			<div class="numbers">$7,842</div>
			<div class="cardName">총판매액</div>
		</div>
		<div class="iconBx">
			<ion-icon name="cash-outline"></ion-icon>
		</div>
	</div>
</div>
<!-- end cardBox -->




<hr>
<h3>
할일<br> 
mvc패턴에 맞게 서블릿거쳐서 오게 수정필요<br>
이 페이지가 판매자 메인페이지이고 아래부분에 인기상품순으로 정렬된 데이터 , 판매량 많은 순으로 정렬된 데이터, 내 제품 많이산 고객 순으로 정렬된데이터,
악성 재고인, 창고에 오래있는 제품 순으로 정렬데이터가 필요하다. 
</h3>








