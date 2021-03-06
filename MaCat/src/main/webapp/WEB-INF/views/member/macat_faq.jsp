<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>고객문의 관리</title>
	<link rel="stylesheet" href="resources/css/normalize.css">
	<link rel="stylesheet" href="resources/css/macat_faq.css">
	<link rel="stylesheet" href="resources/css/spacing.css">

	<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
	<!-- 고정헤더 불러오기 -->
	<script type="text/javascript">
		$(document).ready(function() {
			$("#macat_header").load("macat_header.html");
		});
		
		$(document).ready(function(){
			$("#main_list > tr:even").click(function(){
				$(this).next().toggle();
			});
		});
	</script>
</head>

<body>
	<!-- 고정헤더 불러오기 -->
	<div id="macat_header"></div>
	 <!--여백-->
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
							<col style="width:120px;">
							<col style="width:auto;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">질문</th>
							</tr>
						</thead>
						<tbody id="main_list">
							<tr>
								<td>1</td>
								<td>문의게시판</td>
							</tr>
							<tr>
								<td>답변</td>
								<td>답변 내용 페이지입니다.</td>
							</tr>
							<tr>
								<td>2</td>
								<td>문의게시판</td>
							</tr>
							<tr>
								<td>답변</td>
								<td>답변 내용 페이지입니다.</td>
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
						<p> 질문 검색
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