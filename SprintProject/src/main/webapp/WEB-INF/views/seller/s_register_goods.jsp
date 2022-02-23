<%@page import="com.dto.PageDTO"%>
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

<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script>
    var cnt = 0;
    function fn_addFile(){
       
       cnt++;
       for (var i = 0; i <5; i++) {
        if (i <= 5 ){ 
        $("#d_file").append("<br>" + "<input type='file' name='file" + i + "' />");
        }else if(i >= 5){
           break;
         alert("최대 5개까지 가능합니다.");
        }
       }
    }
</script>

<h3>상품등록</h3>
<hr>
<form action="SellerGoodsAdd" method="post" enctype="multipart/form-data"><!-- 입력된 상품의 정보 이동   -->
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
         <th>상품이미지(GIMAGE1)</th>
         <td>
            <input type="file" name="image1" value="파일 선택"><br>
            <input type="file" name="image2" value="파일 선택"><br>
            <input type="file" name="image3" value="파일 선택"><br>
            <input type="file" name="image4" value="파일 선택"><br>
            <input type="file" name="image5" value="파일 선택">
            </td>
      </tr>
		
		<tr>
			<th>상품설명(GDETAIL)</th>
			<td><textarea type="text" name="gdetail" id="gdetail" rows="5" cols="30" placeholder="상품설명" ></textarea></td>
		</tr>
</table>
<input type="submit" id="sub" value="상품등록">
<input type="reset" value="다시입력하기">
</form>
<!-- 상품현황 시작 -->
<hr>
<h2><center>총 상품현황</center></h2>


  

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
<table border="1" >
		<tr>
			<td colspan="7">
				<form action="registerGoods">
					<select name="search">
						<option value="gcategory">카테고리(top,bottom,outer,dress)</option>
						<option value="gname" selected="selected">상품이름</option>
					</select>
					<input type="text" name="goodsSearch" size="50">
					<input type="submit" value="검색">
				</form>
			<td>
		<tr>
		 <tr>
		 	<th>상품이미지</th>
		 	<th>상품 아이디</th>
		 	<th>상품이름</th>
		 	<th>상품가격</th>
		 	<th>상품 설명</th>
		 	<th>상품 카테고리</th>
		 	<th>수정/삭제</th>
		 </tr>

   <%
/*    	List<GoodsDTO> dto = (List<GoodsDTO>)session.getAttribute("list");
 */	PageDTO pdto = (PageDTO)session.getAttribute("pdto");
	List<GoodsDTO> dto = pdto.getList();
	String search = (String)session.getAttribute("search");
	String goodsSearch = (String)session.getAttribute("goodsSearch");
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
   

		 <tr>
		 	<th rowspan=""><img alt="" width="180" height="240" src="resources/images/items/<%=d.getGimage1() %>"></th><!-- 수정구현 필 -->
			<th><center><input type="text" name="gid" id="gid<%=gid %>" value="<%=gid %>"></center></th>
			<td><center><input type="text" name="gname" id="gname<%=gid%>" value="<%=gname %>"></center></td>
			<td><center><input type="text" name="gprice" id="gprice<%=gid%>" value="<%=f.format(gprice) %>"></center></td>
			<td><center><input type="text" name="gdetail" id="gdetail<%=gid%>" value="<%=gdetail %>"></center></td>
			<td><center><input type="text" name="gcategory" id="gcategory<%=gid%>" value="<%=gcategory %>"></center></td>
			<td colspan="2">
			<center><input type="button" name="update" class="update" data-num ="<%=gid%>" value="수정">
					<input type="button" name="delete" class="delete" data-num ="<%=gid%>" value="삭제"></center></td> 
		</tr>

<%
   } //end for
%>
 <tr>
     <td colspan="7">
   	<%
   	int curPage = pdto.getCurPage();//3 
    int perPage = pdto.getPerPage();//2 
	int totalCount = pdto.getTotalCount();//13
	int totalPage = totalCount/perPage;//총필요페이지 
	if(totalCount%perPage!= 0) totalPage++;//나머지페이지 추가 
    for(int i=1; i<= totalPage; i++){
      	if(i== curPage){//3 인경우 
      		out.print(i+"&nbsp;");
    }else{
  		out.print("<a href='registerGoodsPage?curPage="+i+"&search="+search+"&goodsSearch="+goodsSearch+"'>"+i+"</a>&nbsp;");
    }
    }
%>
</td>
</tr>
	
</table>
   
 <%
	}else{
 %>  
 <h2>상품이 존재하지 않습니다.</h2>  
   <%
	}
   %>
   
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js">
</script>
<script src="resources/js/seller/s_register_goods.js"></script>

