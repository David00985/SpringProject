<%@page import="com.dto.SellerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
			<div class="cardName">배송 준비중</div>
		</div>
		<div class="iconBx">
			<ion-icon name="basket-outline"></ion-icon>
		</div>
		
	</div>
	<div class="card">
		<div>
			<div class="numbers">284</div>
			<div class="cardName">배송중</div>
		</div>
		<div class="iconBx">
			<ion-icon name="chatbubbles-outline"></ion-icon>
		</div>
		
	</div>
	<div class="card">
	
		<div>
			<div class="numbers">$7,842</div>
			<div class="cardName">배송완료</div>
		</div>
		<div class="iconBx">
			<ion-icon name="cash-outline"></ion-icon>
		</div>
	</div>
</div>
<!-- end cardBox -->

    
    
    <hr>
<h1 class="h2">판매 현황</h1>



<div class="table-responsive" style="padding: 20px;">

	<table class="table">
		<thead class="bg-light">
			<tr>
				<th>상품명</th>
				<th>상품가격</th>
				<th>상품수량</th>
				<th>상품가격합계</th>
				<th>배송현황</th>
			</tr>

		</thead>
		<tbody>
		<c:foreach items="${delivery}" var="d" varStatus="status">
			<tr>
				<td>${d.gid}</td>
				<td>${d.gname}</td>
				<td>${d.gamount}</td>
				<td>${d.gprice}</td>
				<td>${d.price*d.gamount}</td>
				
				<td><select name="status">
				<option value="주문 완료">주문 완료</option>
				<option value="배송 대기">배송 준비중</option>
				<option value="배송중">배송중</option>
				<option value="배송 완료">배송 완료</option>
				<option value="환불중">환불중</option>
				</select>
				<button>업데이트</button>
			</tr>
		</c:foreach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4"></td>
				<td>총 가격</td>
			</tr>
		</tfoot>
	</table>
</div>


