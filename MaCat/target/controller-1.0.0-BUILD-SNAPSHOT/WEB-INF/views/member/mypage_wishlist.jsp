﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>마캣 찜 리스트</title>
	<link rel="shortcut icon" href="resources/img/logos/mcat-favicon.ico">
	
	<link rel="stylesheet" href="resources/css/normalize.css">
	<!-- 찜 리스트 -->
	<link rel="stylesheet" href="resources/css/member/macat_wishlist.css">
	<!-- 여백 -->
	<link rel="stylesheet" href="resources/css/spacing.css">
	<!-- 크롬 탭 미니로고 -->
    <link rel="shortcut icon" href="resources/img/logos/mcat-favicon.ico">
    
	<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
</head>

<body>
    <!-- 고정헤더 불러오기 -->
	<div id="macat_header">
		<%@ include file="../header.jsp"%>
	</div>
    <!-- 여백-->
    <div class="spacing"></div>

	<section id="wrap">
		<div class="contents">
			<div class="wish-list">
				<div class="wish-list-title">
					<div id="path">
						<ol>
							<li>홈</li>
							<li>마이쇼핑</li>
							<li>
								<strong>관심상품</strong>
							</li>
						</ol>
					</div>
					<div id="title">
						<h2>관심상품</h2>
					</div>
				</div>
				<div class="wish-list-menu">
					<table class="wish-list-main">
						<caption>찜한상품 목록</caption>
						<colgroup>
							<col style="width:27px;">
							<col style="width:92px;">
							<col style="width:auto;">
							<col style="width:105px;">
							<col style="width:100px;">
							<col style="width:100px;">
							<col style="width:85px;">
							<col style="width:105px;">
							<col style="width:110px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">
									<span>
										<input type="checkbox">
									</span>
								</th>
								<th scope="col">이미지</th>
								<th scope="col">상품정보</th>
								<th scope="col">판매가</th>
								<th scope="col">적립금</th>
								<th scope="col">배송구분</th>
								<th scope="col">배송비</th>
								<th scope="col">합계</th>
								<th scope="col">선택</th>
							</tr>
						</thead>
						<tbody id="wish-list-main-menu">
							<tr>
								<td>
									<span>
										<input type="checkbox">
									</span>
								</td>
								<td><a href="#">이미지</a></td>
								<td>상품정보</td>
								<td>판매가</td>
								<td>적립금</td>
								<td>배송구분</td>
								<td>배송비</td>
								<td>합계</td>
								<td>
								    <li><a href="#"><img src="resources/img/macat-order-select.png" alt=""></a></li>
								    <li><a href="#"><img src="resources/img/macat-cart-add2.png" alt=""></a></li>
								    <li><a href="#"><img src="resources/img/macat-delete2.png" alt=""></a></li>
								</td>
							</tr>
						</tbody>
						<tbody class="list_none">
							<tr>
								<td colspan="8">찜한 상품이 없습니다.</td>
							</tr>
						</tbody>
					</table>
					<div class="btn">
						<span id="left-btn">
						    <strong>선택상품</strong>
								<img src="resources/img/macat-delete.png" alt="">
								<img src="resources/img/macat-cart-add.png" alt="">
						</span>
						<span id="right-btn">
								<img src="resources/img/macat-order-all.png" alt="">
							    <img src="resources/img/macat-wish-del-all.png" alt="">
						</span>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>