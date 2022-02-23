<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dto.SellerDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
 <jsp:include page="../common/topbar_s.jsp" flush="true"></jsp:include>  


<%
	DecimalFormat f = new DecimalFormat(",###,###,###");//금액,수량 쉼표표시
	int MonthTotal = (int)session.getAttribute("MonthTotal"); // 현재 달 매출량
	int DayTotal = (int)session.getAttribute("DayTotal");// 금일 매출량
	String Month = (String)session.getAttribute("month"); // 현재 달 표시
	String yearmonthday = (String)session.getAttribute("yearmonthday");//년도,월,일 데이터
	String year = yearmonthday.substring(0, 4);//년도만 자르기
	String month = yearmonthday.substring(5, 7);//월만 자르기
	String day = yearmonthday.substring(8, 10);//일만 자르기
	int TotalGamount = (int)session.getAttribute("TotalGamount");
	int TodaySaleMoney = (int)session.getAttribute("TodaySaleMoney");	
%>

<!-- 여기서부터 작성하면 됩니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<div class="cardBox">
	<div class="card">
		
		<div>
			<div class="numbers"><%=f.format(MonthTotal)%>원</div>
			<div class="cardName"><%=year%>년<%=month %>월 매출</div>
		</div>
		<div class="iconBx">
			<ion-icon name="eye-outline"></ion-icon>
		</div>
	</div>
	<div class="card">
		<div>
			<div class="numbers"><%=f.format(DayTotal)%>원</div>
			<div class="cardName"><%=month %>월<%=day %>일 매출</div>
		</div>
		<div class="iconBx">
			<ion-icon name="basket-outline"></ion-icon>
		</div>
		
	</div>
	<div class="card">
		<div>
			<div class="numbers"><%=TotalGamount %>개</div>
			<div class="cardName">금일 판매수량</div>
		</div>
		<div class="iconBx">
			<ion-icon name="chatbubbles-outline"></ion-icon>
		</div>
	</div>
	<div class="card">
	
		<div>
			<div class="numbers"><%=f.format(TodaySaleMoney)%>원</div>
			<div class="cardName">금일 할인 금액</div>
		</div>
		<div class="iconBx">
			<ion-icon name="cash-outline"></ion-icon>
		</div>
	</div>
</div>
<!-- end cardBox -->




 <!-- 차트 추가부분 -->

                <div class="graphBox">
                    
                    <div class="box">
                        <canvas id="myChart" ></canvas>
                    </div>
                    <div class="box">
                        <canvas id="earning" ></canvas>
                    </div>
                </div>
    
    
                <!-- 차트 추가부붑ㄴ 끝 -->

            <!-- order details list -->
            <div class="details">
                <!-- order details list -->
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>Recent Orders</h2>
                        <a href="#" class="btn">View All</a>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <td>Name</td>
                                <td>Price</td>
                                <td>payment</td>
                                <td>status</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Star Refrigerator</td>
                                <td>$1200</td>
                                <td>paid</td>
                                <td><span class="status delivered">Delivered</span></td>
                            </tr>
                            <tr>
                                <td>Star Refrigerator</td>
                                <td>$1200</td>
                                <td>paid</td>
                                <td><span class="status pending">pending</span></td>
                            </tr>
                            <tr>
                                <td>Star Refrigerator</td>
                                <td>$1200</td>
                                <td>paid</td>
                                <td><span class="status delivered">Delivered</span></td>
                            </tr>
                            <tr>
                                <td>Star Refrigerator</td>
                                <td>$1200</td>
                                <td>paid</td>
                                <td><span class="status delivered">Delivered</span></td>
                            </tr>
                            <tr>
                                <td>Star Refrigerator</td>
                                <td>$1200</td>
                                <td>paid</td><!-- 색깔 배송수정 -->
                                <td><span class="status pending">pending</span></td>
                            </tr>
                            <tr>
                                <td>Star Refrigerator</td>
                                <td>$1200</td>
                                <td>paid</td><!-- 색깔 배송수정 -->
                                <td><span class="status inProgress">In Progress</span></td>
                            </tr>
                            <tr>
                                <td>Star Refrigerator</td>
                                <td>$1200</td>
                                <td>paid</td><!-- 색깔 배송수정  2개추 가가능  -->
                                <td><span class="status pending">pending</span></td>
                            </tr>
                        </tbody>
                    </table>

                </div>
                <!-- New Customer -->
                <div class="recentCustomers">
                    <div class="cardHeader">
                        <h2>Recent Customers</h2>
                        <!-- <a href="#" class="btn">View All</a> -->
                    </div>
                    <table>
                        <tr>
                            <td width="60px"><div class="imgBx"><img src="resources/images/user_s/img1.jpg" alt=""></div></td>
                            <td><h4>David<br><span>Italy</span></h4></td>
                        </tr>
                        <tr>
                            <td width="60px"><div class="imgBx"><img src="resources/images/user_s/img2.jpg" alt=""></div></td>
                            <td><h4>David<br><span>Italy</span></h4></td>
                        </tr>
                        <tr>
                            <td width="60px"><div class="imgBx"><img src="resources/images/user_s/img3.jpg" alt=""></div></td>
                            <td><h4>David<br><span>Italy</span></h4></td>
                        </tr>
                        <tr>
                            <td width="60px"><div class="imgBx"><img src="resources/images/user_s/img4.jpg" alt=""></div></td>
                            <td><h4>David<br><span>Italy</span></h4></td>
                        </tr>
                        <tr>
                            <td width="60px"><div class="imgBx"><img src="resources/images/user_s/img5.jpg" alt=""></div></td>
                            <td><h4>David<br><span>Italy</span></h4></td>
                        </tr>
                        <tr>
                            <td width="60px"><div class="imgBx"><img src="resources/images/user_s/img6.jpg" alt=""></div></td>
                            <td><h4>David<br><span>Italy</span></h4></td>
                        </tr>
                        <tr>
                            <td width="60px"><div class="imgBx"><img src="resources/images/user_s/img7.jpg" alt=""></div></td>
                            <td><h4>David<br><span>Italy</span></h4></td>
                        </tr>

                    </table>

                </div><!-- end recentCustomers -->

            </div><!-- end details  -->

        </div><!-- end seller-main  -->

    </div><!-- end seller-container  -->


<!-- icons모음  -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<!-- charts js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>
<!-- 그래프 출력  여기서부터-->

<script src="resources/js/my_chart.js"></script>







