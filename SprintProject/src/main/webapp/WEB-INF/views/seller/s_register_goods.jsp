<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.SellerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:include page="../common/topbar_s.jsp" flush="true"></jsp:include>  
    
<%
int count = (int)session.getAttribute("listcount");

%>
	
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
			<div class="numbers"><%=count %></div>
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
<%
	SellerDTO seller = (SellerDTO)session.getAttribute("login_seller");
%>
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js">
</script>
<script type="text/javascript">
$(function() {
	
	$("#gid").on("keyup", function() {
		var gid = $(this).val();
		
		$.ajax({
			
			url: "SellerGoodsIDCheck",
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
<h3>상품등록</h3>
<hr>
<form action="SellerGoodsAdd" method="get"><!-- 입력된 상품의 정보 이동   -->
<table border="1">
		<tr>	
			<th>상품아이디(GID)</th> <!-- 상품아이디 첫글자 소문자 등록 유의 O1, T4-->
			<td><input type="text" name="gid" id="gid" placeholder="상품아이디">
			<input type="hidden" name="sid" id="sid" value="<%=seller.getSid()%>">
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
<input type="submit" value="상품등록">
<input type="reset" value="다시입력하기">
</form>
<!-- 상품현황 시작 -->
<hr>
<h2><center>총 상품현황</center></h2>


<script>
function reload(){  
       location.reload();
}
</script>

<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js">
</script>
  <script type="text/javascript">
  
	$(function() {
	
		$(".update").on("click", function() {
			var gid = $(this).attr("data-num");
			var gname = $("#gname"+gid).val();
			var gprice = $("#gprice"+gid).val();
			var gdetail = $("#gdetail"+gid).val();
			var gcategory = $("#gcategory"+gid).val();
			var gprice2 = gprice.replace(",","");
		
		$.ajax({
			
			url: "SellerGoodsUpdate",
			type: "get",
			dateType :"text",
			data: {
				gid : gid,
				gname : gname,
				gprice : gprice2,
				gdetail : gdetail,
				gcategory : gcategory
				
			},
			
			success: function(data, status, xhr) {
				console.log(data);
				if (data = "1") {
					alert("정보가 수정되었습니다.");
				}
				reload();
			},//success
			error: function(xhar, status, error) {
				console.log(error);
			}//error
			
		})//ajax
		})//update
		
		
		$(".delete").on("click", function() {
			var gid = $(this).attr("data-num");
			console.log(gid);
		$.ajax({
			
			url: "SellerGoodsDelete",
			type: "get",
			dateType :"text",
			data: {
				gid : gid,
			},
			
			success: function(data, status, xhr) {
				if (data = 1) {
					alert("삭제되었습니다.")
				}
				reload();
			},//success
			error: function(xhar, status, error) {
				console.log(error);
			}//error
			
		})//ajax
		})//delete
	
		
	})//function
	

 </script>
   
  

<%
	if(seller != null){
		
	  	String mesg = (String)session.getAttribute("mesg");
    	if(mesg != null){
    %>
    <script type="text/javascript">
    	alert("<%=mesg%>");
    </script>

    <%
    	} session.removeAttribute("mesg");
    %>

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
   	List<GoodsDTO> dto = (List<GoodsDTO>)session.getAttribute("list");
   
   DecimalFormat f = new DecimalFormat("###,###,###");
   
   for(int i=1; i<=dto.size(); i++){
	   GoodsDTO d = dto.get(i-1);
	   String gid = d.getGid();
	   String gcategory = d.getGcategory();
	   String gname = d.getGname();
	   int gprice = d.getGprice();
	   String gdetail = d.getGdetail();
	   String grdate = d.getGrdate();
		

   %>	
   
  <td>
<table border="1" style="padding: 15px" >
	<caption>상품현황 </caption>
		 <tr>
		 	<th rowspan="11"><img alt="" width="160" height="240" src="resources/images/items/<%=d.getGimage1() %>.gif"></th><!-- 수정구현 필 -->
			<th>상품 아이디</th>
		</tr>
		<tr>
			<th><center><input type="text" name="gid" id="gid<%=gid %>" value="<%=gid %>"></center></th>
		<tr>
		<tr>
			<th>상품이름</th>
		</tr>
		<tr>	
			<td><center><input type="text" name="gname" id="gname<%=gid%>" value="<%=gname %>"></center></td>
		</tr>
		<tr>
			<th>상품가격</th>
		</tr>
		<tr>	
			<td><center><input type="text" name="gprice" id="gprice<%=gid%>" value="<%=f.format(gprice) %>"></center></td>
		</tr>
		<tr>
			<th>상품 설명</th>
		<tr>
			<td><center><input type="text" name="gdetail" id="gdetail<%=gid%>" value="<%=gdetail %>"></center></td>
		<tr>
			<th>상품 카테고리</th>
		</tr>
		<tr>
			<td><center><input type="text" name="gcategory" id="gcategory<%=gid%>" value="<%=gcategory %>"></center></td>
		</tr>
		<tr>
			<td colspan="2">
			<center><input type="button" name="update" class="update" data-num ="<%=gid%>" value="수정">
					<input type="button" name="delete" class="delete" data-num ="<%=gid%>" value="삭제"></center></td> 
		</tr>
</table>
</td>
               <!-- 한줄에 4개씩 보여주기 -->   
               <%
                if(i%3==0){//i는 1부터 
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
	}else{
 %>  
 <h2>상품이 존재하지 않습니다.</h2>  
   <%
	}
   %>
   


