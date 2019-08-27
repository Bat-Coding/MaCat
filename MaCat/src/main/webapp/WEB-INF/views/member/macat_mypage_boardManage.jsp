<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>게시물 관리</title>
	<link rel="stylesheet" href="resources/css/normalize.css">
	<link rel="stylesheet" href="resources/css/member/macat_board.css">
	<link rel="stylesheet" href="resources/css/spacing.css">

	<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
</head>

<body>
	<!-- 고정헤더 불러오기 -->
	<div id="macat_header"><%@ include file="../head.jsp" %></div>
	<!-- 여백-->
	<div class="spacing"></div>

	<section id="wrap">
		<div class="contents">
			<div class="board">
				<div class="board_title">
					<div id="path">
						<ol>
							<li>홈</li>
							<li>마이쇼핑</li>
							<li>
								<strong>게시물 관리</strong>
							</li>
						</ol>
					</div>
					<div id="title">
						<h2>게시물 관리</h2>
					</div>
				</div>
				<div class="board_list">
					<table class="board_list_main">
						<caption>게시판 목록</caption>
						<colgroup>
							<col style="width:70px;">
							<col style="width:135px;">
							<col style="width:auto;">
							<col style="width:84px;">
							<col style="width:80px;">
							<col style="width:55px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">분류</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">조회</th>
							</tr>
						</thead>
						<tbody id="main_list">
							<tr>
								<td>1</td>
								<td>문의게시판</td>
								<td>상품문의</td>
								<td>손석배</td>
								<td>2019-08-22</td>
								<td>0</td>
							</tr>
						</tbody>			
						<tbody id="main_list_none">
							<tr>
								<td colspan="6">게시글이 없습니다.</td>
								
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<form action="">
				<div id="not_search_bar">
					<fieldset>
						<legend>게시글 검색</legend>
						<p>
							<select name="" id="search_key">
								<option value="">제목</option>
								<option value="">내용</option>
							</select>
							<input id="search_text_box" type="text">
							<a href="#"><img src="resources/img/mcat_search.png" alt=""></a>
						</p>
					</fieldset>
				</div>
			</form>

		</div>
	</section>
</body>

</html>