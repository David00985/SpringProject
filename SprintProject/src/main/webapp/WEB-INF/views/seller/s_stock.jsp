<%@page import="com.dto.StockDTO2"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.dto.SellerDTO"%>
<%@page import="java.util.Set"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="com.dto.StockDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

   <jsp:include page="../common/topbar_s.jsp" flush="true"></jsp:include>  

  

<!-- 여기서부터 작성하면 됩니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<%
	int count = (int)session.getAttribute("count");
%>
<!-- 재고 관리 페이지 -->

<div class="cardBox">
	<div class="card">
		
		<div>
			<div class="numbers"><%=count %></div>
			<div class="cardName">등록 상품 수</div>
		</div>
		<div class="iconBx">
			<ion-icon name="eye-outline"></ion-icon>
		</div>
	</div>
	<div class="card">
		<div>
			<div class="numbers">80</div>
			<div class="cardName">재고 부족 상품</div>
		</div>
		<div class="iconBx">
			<ion-icon name="basket-outline"></ion-icon>
		</div>
		
	</div>
	<div class="card">
		<div>
			<div class="numbers">284</div>
			<div class="cardName">악성 재고 상품</div>
		</div>
		<div class="iconBx">
			<ion-icon name="chatbubbles-outline"></ion-icon>
		</div>
		
	</div>
	<div class="card">
	
		<div>
			<div class="numbers">$7,842</div>
			<div class="cardName">총 재고량</div>
		</div>
		<div class="iconBx">
			<ion-icon name="cash-outline"></ion-icon>
		</div>
	</div>
</div>
<!-- end cardBox -->

<script type="text/javascript">
function back() {
	history.back();
}
</script>

<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
	
	$("#check").on("click", function() {
		var gid = $("#gid").val();
		var gsize = $("#gsize").val();
		var gcolor = $("#gcolor").val();
		var gstock = $("#gstock").val();
		
		if (gid == "") {
			alert("아이디를 입력해주세요");
		}else if (gstock == "") {
			alert("재고수량을 입력해주세요");
		}
		
		if(gid != "" && gstock != 0){
		$.ajax({
			
			url: "SellerStockCheck",
			type: "get",
			dataType : "text",
			data: {
				gid : gid,
				gsize : gsize,
				gcolor : gcolor
			},
		success: function(data, status, xhr) {
				console.log(data);
				if (data == 0) {
					alert("등록 가능한 상품입니다.");
				}else if(data == 1){
					alert("중복된 상품입니다.");
				}
				
				
		},
		error : function(xhr, status, error) {
					console.log(error);			
		}
		
			
		})//ajax
		}
	})//keyup

})//function
</script>
<hr>
 <h2><center>재고등록 </center></h2><br>
<hr>
<form action="SellerStockAdd" method="get">

<table border="1">
			<tr>
				<th>상품번호</th>
				<th>상품사이즈</th>
				<th>상품색상</th>
				<th>상품 재고수량</th>
			</tr>
			<tr>
				<td><input type="text" name="gid" id="gid" placeholder="상품번호"></td>
				<td><select name="gsize" id="gsize" >
					<option>samll</option>
					<option>medium</option>
					<option>large</option>
				</select></td>
				<td><select name="gcolor" id="gcolor">
					<option>black</option>
					<option>navy</option>
					<option>ivory</option>
					<option>white</option>
				</select></td>
				<td><input type="text" name="gstock" id="gstock">
				<input type="button" name="check" id="check" value="중복확인" ></td>					
			</tr>
</table>

<hr>
<input type="submit" value="상품등록">
	<input type="reset" value="다시입력">
</form>
<hr>
<!-- 재고현황 페이지  -->
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js">
</script>
  <script type="text/javascript">
  $(function() {
	  
function reload(){  
       location.reload();
}
		
 	 $(".update").on("click", function() {//수정 ajax 처리 
			var num = $(this).attr("data-num");
			var gsize = $("#gsize"+num).val();
			var gcolor = $("#gcolor"+num).val();
			var	gstock = $("#gstock"+num).val();
 		 
 		 $.ajax({
 		
 			 url :"SellerStockUpdate",
 			 type :"get",
 			 dateType :"text",
 			 data : {
 				 num : num,
 				 gsize : gsize,
 				 gcolor : gcolor,
 				 gstock : gstock
 			 },
 			 success: function(data, status, xhr) {
				if (data = 1) {
					alert("수정되었습니다.");
				}
 				 	reload();
 			 },
			error: function(xhr, status, error) {
				console.log(error);
			}
 			 
 		 })//ajax
 
 	 })//click
 	 
 	 /* ------------------------------------------------- */
 	 
 	 $(".delete").on("click", function() {//삭제 ajax 처리 
			var num = $(this).attr("data-num");
 		 
 		 $.ajax({
 		
 			 url :"SellerStockDelete",
 			 type :"get",
 			 dateType :"text",
 			 data : {
 				 num : num,
 			 },
 			 success: function(data, status, xhr) {
 				if (data = 1) {
					alert("삭제되었습니다.");
				}
 				 	reload();
			},
			error: function(xhr, status, error) {
				console.log(error);
			}
 			 
 		 })//ajax
 	 
 	 })//click 
	  
})//fun
</script>
    
 
<hr>
 <h2><center>재고현황 페이지입니다.</center></h2><br>
 <span id="result"></span>
<hr>
<%
	List<StockDTO2> dto2 = (List<StockDTO2>)session.getAttribute("list");
 	SellerDTO dto = (SellerDTO)session.getAttribute("login_seller");

		String gid = "";
		String gname ="";
		String gSize ="";
		String gColor = "";
		int gStock =0;
		int num =0;
	 
			
if(dto != null){
	
	
	
	 for(StockDTO2 d : dto2){
		gid = d.getGid();
		gname = d.getGname();
		gSize = d.getGsize();
		gColor = d.getGcolor();
		gStock = d.getGstock();
		num = d.getNum();
		
			 
%>				
<form action="" method="get">
<input type="hidden" name="num" id ="num" value="<%=num%>">
<table border="1">
		<tr>
 			<th >상품이름(Gname)</th>
			<th>상품사이즈(Gsize)</th>
			<th>상품색상(Gcolor)</th>
			<th>상품수량(Gstock)</th>
			<th colspan="2" width="100" >설정</th>
		</tr>
		<tr>
			 <th><input type="text" name="gname" id="gname<%=num %>"  value="<%=gname%>"></th>
			<th><input type="text" name="gsize" id="gsize<%=num %>" value="<%=gSize %>"></th>
			<th><input type="text" name="gcolor" id="gcolor<%=num %>" value="<%=gColor %>"></th>
			<th><input type="text" name="gstock" id="gstock<%=num %>" value="<%=gStock %>"></th>
			<th><button class="update" data-num="<%=num%>">수정</button></th>
			<th><button class="delete" data-num="<%=num%>">삭제</button></th>
</table>
</form>


<%
		}
		}else{ //{//sid,sid equals end 
	
%>	
<br>
<h2>상품이 존재하지 않습니다.</h2>

    
 <%
		}
 %>   
    
    
    
    
    
    