<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.OrderDTO" %>
<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function () {
		
		$("#deliver").click(function () {
			$(".cart-info").attr("href","deliverinfo")
		})
		
		
	})
	



</script>


<br><br><br><br><br><br><br><br>
${login_member.mname} 님의 주문내역입니다.

<h1>주문상품 내역</h1>
   
<div name="container">
	
	<div class="small-container cart-page">
        <table>
            <tr>
                <th>주문번호</th>
                <th>상품정보</th>
                <th>수량</th>
                <th>결재금액</th>
                <th>배송현황</th>
                <th>배송지</th>
            </tr>
            <tr>
<c:forEach var="x" items="${orderChart}">
                <td>주문번호</td>
                <td>
                    <div class="cart-info">
                        <img src="resource/images/subimages/gallery-1.jpg">
                        <div>
                            <p>${x.oname}</p>
                            <small>사이즈</small><br>
                            <small>색상</small><br>
                            <small>${x.oprice}</small>
                        </div>
                    </div>
                </td>
                <td>수량</td>
                <td>총결제금액</td>
                <button class="deliver_address" id="deliver_address">배송지 정보</button>
                <td>배송중<br><a href="deliver" id="deliver">배송조회</a></td>
            </tr>
</c:forEach>
        </table>

    </div>
    
</div> 