<%@page import="com.dto.SellerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:include page="../common/topbar_s.jsp" flush="true"></jsp:include>  
    
    
	
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
			<div class="cardName">상품현황</div>
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
<hr>


<!-- 여기서부터 작성하면 됩니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js">
</script>
<script type="text/javascript">
$(function() {
	
	$("#gid").on("keyup", function() {
		var gid = $(this).val();
		
		$.ajax({
			
			url: "SellerGoodsIDCheckServlet",
			type: "get",
			dataType : "text",
			data: {
				gid : gid
			},
			
			success: function(data, status, xhr) {
				$("#result").text(data);
			},//success
			error: function(xhr, status, error) {
				console.log(error);
			}//error
			
		})//ajax
		
	})//keyup
	
})

</script>
<hr>
<a href="SellerGoodsListServlet">상품현황</a>
<hr>
<form action="SellerGoodsAddServlet" method="get"><!-- 입력된 상품의 정보 이동   -->
<table border="1">
		<tr>	
			<th>상품아이디(GID)</th> <!-- 상품아이디 첫글자 소문자 등록 유의 O1, T4-->
			<td><input type="text" name="gid" id="gid" placeholder="상품아이디">
			<span id="result"></span></td>
		</tr>
		<tr>
			<th>상품종류(GCATEGORY)</th>
			<td><select name="gcategory" id="gcategory">
				<option>top</option>
				<option>bottom</option>
				<option>outer</option>
				<option>dress</option></select>
			</td>
		</tr>
		<tr>
			<th>상품이름(GNAME)</th>
			<td><input type="text" name="gname" id="gname" placeholder="상품이름 "></td>
		</tr>
		<tr>
			<th>상품가격(GPRICE)</th>
			<td><input type="text" name="gprice" id="gprice" placeholder="상품가격"></td>
		</tr>
		<tr>
			<th>상품이미지1(GIMAGE1)</th>
			<td><input type="text" name="gimage1" id="gimage1" placeholder="상품이미지1"></td>
		<tr>
			
		<tr>
			<th>상품이미지2(GIMAGE2)</th>
			<td><input type="text" name="gimage2" id="gimage2" placeholder="상품이미지2" ></td>
		<tr>
			
		<tr>
			<th>상품이미지3(GIMAGE3)</th>
			<td><input type="text" name="gimage3" id="gimage3" placeholder="상품이미지3" ></td>
		<tr>
		<tr>
			<th>상품설명(GDETAIL)</th>
			<td><textarea type="text" name="gdetail" id="gdetail" rows="5" cols="30" placeholder="상품설명" ></textarea></td>
		</tr>
</table>
<hr>
상품아이디 O1, T4, B9, D4 입력 재고현황 같이 출력 구현?
<hr>
<input type="submit" value="상품등록">
<input type="reset" value="다시입력하기">
</form>



