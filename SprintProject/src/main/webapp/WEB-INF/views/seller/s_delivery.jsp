<%@page import="com.dto.SellerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  <jsp:include page="../common/topbar_s.jsp" flush="true"></jsp:include>  


<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	
	
	//배송현황 업데이트
	$(".del_submit").on("click",function () {
		var num = $(this).attr("data-num");
		var deliverystatus = $("#status_del").val();
		var opindex = $(".opindex"+num).val();
		console.log(deliverystatus,opindex);
		 
		$ajax({
			type:"POST",
			url:"deliveryupdate",
			data:{
				deliverystatus:deliverystatus,
				opindex : opindex
			},
			dataType:"text",
			success: function (data,status,xhr) {
				console.log(data);
				alert("배송현황이 수정되었습니다.");
			},
			error: function (xhr,status,error) {
				console.log(error);
			}
			
			
		});//ajax end
		 
		
	});//업데이트 end
	
				
})//update end
	

</script>


<!-- 여기서부터 작성하면 됩니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <hr>
<h1 class="h2">판매 현황</h1>



<div class="table-responsive" style="padding: 20px;">

	<table class="table">
		<thead class="bg-light">
			<tr>
				<th>주문번호</th>
				<th>상품명</th>
				<th>주문가격</th>
				<th>배송현황</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach var="del" items="${del}" varStatus="status">
			<tr>
				<td class="opindex+${del.opindex}">${del.opindex}</td>
				<td>${del.oproductname}</td>
				<td>${del.oprice}</td>
				<c:choose>
					<c:when test="${del.odelivery != 0 }"><td>${del.deliverystatus}</td></c:when>					
					
						<c:when test="${del.opaymentcheck == 1}"><td>결재 완료</td></c:when>
						<c:when test="${del.opaymentcheck == 0}"><td>결재 진행중</td></c:when>
				
				</c:choose>
				<td>
				<select name="status" class="status" id="status_del" >
				<option value="주문완료">주문 완료</option>
				<option value="배송준비중">배송 준비중</option>
				<option value="배송중">배송중</option>
				<option value="배송완료">배송 완료</option>
				<option value="환불중">환불중</option>
				</select>
				 <input type="submit" class="del_submit" value="update" data-num="${del.opindex}">
				</td>
			</tr>
			</c:forEach>	

		</tbody>
	</table>
</div>


