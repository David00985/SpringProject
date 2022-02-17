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
		
		$("#deliver").click(function () {
			$(".cart-info").attr("href","deliverinfo")
		})
		
		
	})
	



</script>
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
						<center><div class="ordertitle">주문내역</div></center>

						<table width="100%" class="ordertable">
							<colgroup>
								<col style="width: 34px;" />
								<col style="width: 92px;" />
								<col style="width: 100px;" />
								<col style="width: 85px;" />
								<col style="width: 85px;" />
								<col style="width: 65px;" />
								<col style="width: 50px;" />
							</colgroup>
							<thead>
							<tr style="text-align: center;">
									<th scope="col"><label>[주문 번호]</label></th>
									<th scope="col">이미지</th>
									<th scope="col">상품정보</th>
									<th scope="col">수량</th>
									<th scope="col">상품 구매금액</th>
									<th scope="col">배송상태</th>
									<th scope="col">비고 &nbsp;&nbsp;</th>
								</tr>
							</thead>
							<tbody class="order_info">
							
							<c:forEach items="${orderChart}" var="dto" varStatus="status"> 
								<tr class="order_infolist">
									<td><label>${orderChart.image1}</label><br><a href="">${orderChart.oid}</a></td>
									<td class="thumb">
                              <a href="">
                              <img src=""/>
                           </a>
                           </td>
									<td class="product">
                              <a href=""><strong><class="name">${orderChart.oname}</strong>
										<span class="icon"> <img src="" alt="" /> </span></a>
										<ul
											class="option">
											<li class="xans-record-">[옵션: ${orderChart.ocolor }/${orderChart.osize }]
											</li>
										</ul></td>
									<td>
                              <label>${orderChart.oquantity} 개</label>
									</td>
									<td class="price">
										<div class="">
											<strong><fmt:formatNumber value="${orderChart.oprice * orderChart.oquantity}" type="number"/> 원</strong>
										</div>
									</td>
									<td>
										<strong>${orderChart.delivery_status}</strong>
									</td>
									<c:if test="${orderlist.delivery_status eq '배송완료' }">
									<td class="button">
                              <a href="" class="review">리뷰작성</a>
										 <a href="" class="ordercancel">반품요청</a>
                               <a href="" class="deliver">배송조회</a>
                           </td>
									</c:if>
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