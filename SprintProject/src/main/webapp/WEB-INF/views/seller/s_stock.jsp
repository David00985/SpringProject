<%@page import="com.dto.PageDTO"%>
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
					<option>XS</option>
					<option>S</option>
					<option>M</option>
					<option>L</option>
					<option>XL</option>
				</select></td>
				<td><select name="gcolor" id="gcolor">
					<option>Black</option>
					<option>Navy</option>
					<option>Ivory</option>
					<option>White</option>
					<option>Gray</option>
					<option>Beige</option>
					<option>Pink</option>
				</select></td>
				<td><input type="text" name="gstock" id="gstock">
				<input type="button" name="check" id="check" value="중복확인" ></td>					
			</tr>
</table>

<hr>
<input type="submit" value="상품등록">
	<input type="reset" value="다시입력">
</form>
<!-- 재고아이디 현황 -->
<hr>
<table border="1">
	<caption>재고아이디 현황</caption>
	<tr>
		<th>Top</th>
	<%
	List<GoodsDTO> gidTlist = (List<GoodsDTO>)session.getAttribute("gDTO");
	String gidT =null; 
	for(GoodsDTO g : gidTlist){
		if(g.getGid().substring(0,1).equals("T")){
			gidT = g.getGid();
	%>
	<td><%=gidT %></td>
	<%
	}
	}
	%>
	</tr>
	<tr>
		<th>Bottom</th>
	<%
	List<GoodsDTO> gidBlist = (List<GoodsDTO>)session.getAttribute("gDTO");
	String gidB =null; 
	for(GoodsDTO g : gidBlist){
		if(g.getGid().substring(0,1).equals("B")){
			gidB = g.getGid();
	%>
	<td><%=gidB %></td>
	<%
	}
	}
	%>
	</tr> 
	<tr>
		<th>Dress</th>
	<%
	List<GoodsDTO> gidDlist = (List<GoodsDTO>)session.getAttribute("gDTO");
	String gidD =null; 
	for(GoodsDTO g : gidDlist){
		if(g.getGid().substring(0,1).equals("D")){
			gidD = g.getGid();
	%>
	<td><%=gidD %></td>
	<%
	}
	}
	%>
	</tr>
	<tr>
		<th>Outer</th>
	<%
	List<GoodsDTO> gidOlist = (List<GoodsDTO>)session.getAttribute("gDTO");
	String gidO =null; 
	for(GoodsDTO g : gidOlist){
		if(g.getGid().substring(0,1).equals("O")){
			gidO = g.getGid();
	%>
	<td><%=gidO %></td>
	<%
	}
	}
	%>
	</tr>
</table>
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
    
  <table width="100%" cellspacing="0" cellpadding="0">

   <tr>
      <td>
         <table align="center" width="1200" cellspacing="0" cellpadding="0"
            border="0">
            
            <tr>
               <td height="5"></td>
            </tr>
            <tr>
               <td height="1" colspan="8" bgcolor="CECECE"></td>
            </tr>
            <tr>
               <td height="10"></td>
            </tr>

            <tr>
<%
	List<StockDTO2> dto2 = (List<StockDTO2>)session.getAttribute("list");
 	SellerDTO dto = (SellerDTO)session.getAttribute("login_seller");
		String gid = "";
		String gname ="";
		String gSize ="";
		String gColor = "";
		int gStock =0;
		int num =0;
	 	String gimage = "";
			
if(dto != null){
	
	
	   for(int i=1; i<=dto2.size(); i++){
		StockDTO2 d = dto2.get(i-1);   
		gid = d.getGid();
		gname = d.getGname();
		gSize = d.getGsize();
		gColor = d.getGcolor();
		gStock = d.getGstock();
		num = d.getNum();
		gimage = d.getGimage();
			 
%>				
<td>
<form action="" method="get">
<input type="hidden" name="num" id ="num" value="<%=num%>">
<table border="1" style="padding: 15px" >
  		<tr>
  		</tr>
		 <tr>
		 	<th rowspan="11"><img alt="" width="160" height="240" src="resources/images/items/<%=gimage %>.gif"></th><!-- 수정구현 필 -->
			<th>상품이름(Gname)</th>
		</tr>
		<tr>
			 <th><input type="text" name="gname" id="gname<%=num %>"  value="<%=gname%>"></th>
		<tr>
		<tr>
			<th>상품사이즈(Gsize)</th>
		</tr>
		<tr>	
			<th><input type="text" name="gsize" id="gsize<%=num %>" value="<%=gSize %>"></th>
		</tr>
		<tr>
			<th>상품색상(Gcolor)</th>
		</tr>
		<tr>	
			<th><input type="text" name="gcolor" id="gcolor<%=num %>" value="<%=gColor %>"></th>
		</tr>
		<tr>
			<th>상품수량(Gstock)</th>
		</tr>
		<tr>
			<th><input type="text" name="gstock" id="gstock<%=num %>" value="<%if(gStock <= 5 ){ %><%=gStock+" (재고발주 요청!) " %>
			<%}%><%=gStock%>"></th>
		</tr>
		<tr>
			<td colspan="2">
		<center><button class="update" data-num="<%=num%>">수정</button>
			<button class="delete" data-num="<%=num%>">삭제</button></center></td> 
		</tr>

</table>
</form>
</td>
               <!-- 한줄에 4개씩 보여주기 -->   
               <%
                if(i%4==0){//i는 1부터 
               %>
                   <tr>
                    <td height="10">
                   </tr>
               <%
                }//end if
               %>   
   <%
   } //end for
	  %>   
         </table>&nbsp;
      </td>
   </tr>
   
   <tr>
      <td height="10">
   </tr>
   	
</table>	
<%
   }else{ ////sid,sid equals end 
%>
<br>
<h2>상품이 존재하지 않습니다.</h2>

    
 <%
		}
 %>   
    
  
   


    
    
    
    