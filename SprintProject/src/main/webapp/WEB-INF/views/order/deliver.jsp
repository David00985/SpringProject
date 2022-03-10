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
    <script rel="stylesheet" src="https://kit.fontawesome.com/c83e91760f.js" crossorigin="anonymous"></script>
</head>
<body>
        <div class="container">
        <hr>
            <div class="deliver_head">
            
                	<h2><center>현재 배송중입니다.</center></h2>
            </div>
    		
            <hr>
            <br>
                <span class="d_body">
                    <i class="fa-solid fa-people-carry-box fa-2x">배송완료</i><br>
                    <img src="resources/images/deliver/pngtree-thick-line-png-image_2319160.jpg" alt=""><br>
                    <i class="fa-solid fa-truck-fast fa-2x">배송중</i><br>
                    <img src="resources/images/deliver/pngtree-thick-line-png-image_2319160.jpg" alt=""><br>
                    <i class="fa-solid fa-truck-fast fa-2x">상품이동중</i><br>
                    <img src="resources/images/deliver/pngtree-thick-line-png-image_2319160.jpg" alt=""><br>
                    <i class="fa-solid fa-truck-ramp-box fa-2x">배송진행중</i><br>
                    <img src="resources/images/deliver/pngtree-thick-line-png-image_2319160.jpg" alt=""><br>
                    <i class="fa-solid fa-box fa-2x">상품인수</i><br>
                </span>
    </div>        
</body>
</html>