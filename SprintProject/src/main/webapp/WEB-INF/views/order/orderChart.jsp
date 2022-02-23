<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.OrderDTO" %>
<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function () {
		
		
			//배송조회버튼
	$(".deliver").click(function(e) {
			e.preventDefault();
			
			let popUrl = "deliver";
			let popOption = "width = 650px, height=700px, top=300px, left=300px, scrollbars=yes";
			
			window.open(popUrl,"배송조회",popOption);
	})//배송조회페이지 end
		
	

	
	})
	



</script>
<script rel="stylesheet" src="https://kit.fontawesome.com/c83e91760f.js" crossorigin="anonymous"></script>
</head>
<body>
   
<br><br><br><br><br><br>
   <div id="deliverly" >
	

		<div id="container">
			<div id="contents">

				<div class="deliver_info">
					<div class="deliver_css" style="margin: 0 !important;">
               </div>
					
					<div class="orderlist">
						<center><i class="fa-solid fa-receipt fa-4x"></i><div class="ordertitle">OrderChart</div></center>
							
		

						<table width="100%" class="ordertable">
							<colgroup>
								<col style="width: 34px;" />
								<col style="width: 92px;" />
								<col style="width: 100px;" />
								<col style="width: 85px;" />
								<col style="width: 85px;" />
								<col style="width: 65px;" />
								<col style="width: 60px;" />
							</colgroup>
							<thead>
							<tr style="text-align: center;">
									<th scope="col"><label>주문 번호</label></th>
									<th scope="col">이미지</th>
									<th scope="col">상품정보</th>
									<th scope="col">수량</th>
									<th scope="col">상품 구매금액</th>
									<th scope="col">배송상태</th>
									<th scope="col">비고</th>
								</tr>
							</thead>
							<tbody class="order_info">
							
							<c:forEach items="${orderChart}" var="dto" varStatus="status"> 
								<tr class="order_infolist">
									<td>${dto.opindex}</td>
									<td class="thumb">
                              <a href="">
                              <img alt="" src="resources/images/items/${dto.gimage}.gif">
                           </a>
                           </td>
									<td class="product">
                              <a href="orderChart_info"><strong><class="name">${dto.gname}</strong>
										<span class="icon"></span></a>
										<ul
											class="option">
											[옵션: 색상:${dto.gcolor },사이즈:${dto.gsize }]
											
										</ul></td>
									<td>
                              <label>${dto.gamount} 개</label>
									</td>
									<td class="price">
										<div class="">
											<strong>${dto.gprice*dto.gamount} 원</strong>
										</div>
									</td>
									<td class="del">
										<strong>배송중</strong>
									</td>
									<td class="button">
                              			<a href="" class="review">리뷰작성</a>
										<a href="" class="ordercancel">반품요청</a>	
                               			<a href="" class="deliver">배송조회</a>
                           			</td>
								
								</tr>
						
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			

			</div>
		</div>



	</div>
</body>
</html>