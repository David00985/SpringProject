<%@page import="com.dto.CartDTO"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.CouponDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    List<CartDTO> cartlist = (List<CartDTO>)request.getAttribute("cartlist");
    CouponDTO coupondto = (CouponDTO)request.getAttribute("dccode");
    System.out.println("order.jsp+" + coupondto);
    %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
order 페이지~~~~~~~~~

<%=cartlist %>
</body>
</html>