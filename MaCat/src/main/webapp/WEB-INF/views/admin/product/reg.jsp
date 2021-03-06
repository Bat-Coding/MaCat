﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">

	<head>
	    <meta charset="UTF-8">
	    <title>상품등록 페이지 - 상세페이지 작성</title>
    	<link rel="shortcut icon" href="resources/img/logos/mcat-favicon.ico">	    
	    <!-- 초기화 -->
	    <link rel="stylesheet" href="resources/css/normalize.css">
	    <!-- 관리자페이지 css -->
	    <link rel="stylesheet" href="resources/css/admin/product/reg.css">
	    <!-- checked 속성 poly-checked 추가 -->
	    <!--[if lte IE 8]> <script src="path/to/poly-checked.min.js"></script> <![endif]-->
	    <script type="text/javascript" src="resources/se/js/HuskyEZCreator.js" charset="utf-8" ></script>
		<script type="text/javascript" src="resources/se/js/jindo.min.js" charset="utf-8" ></script>
		<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
	    <script type="text/javascript">
	        $(document).ready(function() {
	            $("div > ul > li").each(function() {
	                $(this).click(function() {
	                    $(this).addClass("selected"); 
	                });
	            });
	        });

	    </script>
	    <!-- checkbox 전체선택 쿼리 -->
	    <script type="text/javascript" src="resources/js/checkbox_allchoose.js"></script>
	    
	</head>
	
	<body>
    <!--관리자 페이지 사이드메뉴 불러오기-->
    <div class="macat_sideMenu_load"><%@ include file="../macat_admin_sideMenu.jsp" %></div>  
	   
	    <main>
	        <section class="wrap">
	            <div class="member_management">
	                <span>상세페이지 작성</span>
	            </div>
	            <div class="detail_text_area">
	            	<c:choose>
	            		<c:when test="${!empty sessionScope.productForm}">
	            			<p>${sessionScope.productForm.prduct_nm}</p>
	            		</c:when>
	            		<c:otherwise>
	            			<input type="text">
	            		</c:otherwise>
	            	</c:choose>

	            	<!-- 구분선 -->
	            	<div id="border_item"></div>
		            <div class="smartEditor_container">
		            	<form id="contentsForm" method="post">
			            	<textarea id="txtContent" name="prduct_cn"></textarea>
			            </form>
		            </div>	            	
	            </div>
	            <div class="submit_or_back_btn">
	            	<c:set var="url" value="${pageContext.request.requestURL}"></c:set>
	            	<c:choose>
	            		<!-- 공지사항 수정 페이지 -->
	            		<c:when test="${url eq 'nots_update_page'}">
	            			<img id="submit_btn" src="resources/img/mcat-submit-btn.png" alt="작성완료" onclick="onMotify(${url})">
	            		</c:when>
	            		<!-- 상품상세 수정 페이지 : 기본값 -->
	            		<c:when test="${url eq 'product_update_page'}">
	            			<img id="submit_btn" src="resources/img/mcat-submit-btn.png" alt="작성완료" onclick="onWrite(${url})">
	            		</c:when>
	            	</c:choose>
	            	<img id="back_btn" src="resources/img/mcat-back-btn.png" alt="뒤로가기">
	            </div>
	        </section>        
	    </main>
	</body>

	<!-- 스마트 에디터 -->
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: document.getElementById('txtContent'), // html editor가 들어갈 textarea id
		sSkinURI: "resources/se/SmartEditor2Skin.html",  // html editor가 skin url
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : false,	// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		},
		fOnAppLoad: function () { 
			//기본폰트
			oEditors.getById["txtContent"].setDefaultFont("나눔고딕", 11);
	        //수정모드를 구현할 때 사용할 부분. 로딩이 끝난 후 값이 체워지게 하는 구현을 하면 된다.
	        var contents = '';         //db에서 불러온 값을 여기에서 체워넣으면 됨.
	        oEditors.getById["txtContent"].exec("PASTE_HTML", [contents]); //로딩이 끝나면 contents를 txtContent에 넣음
		    },
		    fCreator: "createSEditor2"
		});
		
		var onWrite = function(url){
			oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
			var boardWriteForm = document.getElementById("contentsForm");  
			boardWriteForm.action ="product_reg_ok.mcat";              
//			boardWriteForm.action = url;        
			boardWriteForm.submit();  
		};
		
		var onModify = function(url){
			oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
			var boardWriteForm = document.getElementById("contentsForm");  
			boardWriteForm.action =url;              
			boardWriteForm.submit();  
		};
		
		var pasteHTML = function(filename){
		    var sHTML = '<img src="${pageContext.request.contextPath}/resources/upload/${sessionScope.loginData.mber_id}/'+filename+'">';
		    oEditors.getById["txtContent"].exec("PASTE_HTML", [sHTML]);
		};
	</script>
</html>
