<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html lang="ko">

	<head>
	    <meta charset="UTF-8">
	    <title>회원 정보 관리</title>
	    <!-- 초기화 -->
	    <link rel="stylesheet" href="resources/css/admin/order_search/normalize.css">
	    <!-- 관리자페이지 css -->
	    <link rel="stylesheet" href="resources/css/admin/order_search/manager.css">
	    <!-- 체크박스 css -->
	    <link rel="stylesheet" href="resources/css/admin/order_search/checkbox.css">
	    <!-- 라디오박스 css -->
	    <link rel="stylesheet" href="resources/css/admin/order_search/radiobutton.css">
	    <!-- 관리자 테이블 css-->
	    <link rel="stylesheet" href="resources/css/admin/order_search/admin_table.css">
	    <!--input text입력창 조절 css-->
	    <link rel="stylesheet" href="resources/css/admin/order_search/input_textarea.css">
	    <!-- 페이징 -->
	    <link rel="stylesheet" href="resources/css/admin/order_search/paging.css">	    
	    <!-- 스크립트 -->
	    <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
	    	    
	    <script type="text/javascript" src="resources/js/admin/order_search/manager.js"></script>
	    <!-- checkbox 전체선택 쿼리 포함 -->
	    <script type="text/javascript" src="resources/js/checkbox_allchoose.js"></script>


	</head>

	<body>
	    <!--관리자 페이지 사이드메뉴 불러오기-->
	    <div class="macat_sideMenu_load"><%@ include file="../macat_admin_sideMenu.jsp" %></div>
	    <main>
	        <section class="wrap">
	            <div class="order_management">
	                <span>주문관리</span>
	            </div>
	            <form id="searchForm" action="mber_search.mcat" method="post">
	                <div class="order_information_container">
	                    <!--주문정보-->
	                    <div class="order_info">
	                        <div class="order_info_title"><span>주문정보</span></div>
	                        <div class="infomation_control_part">
	                            <!--이름 아이디 핸드폰번호 생일-->
	                            <div class="order_info_middle">
	                                <div class="checks">
	                                    <input type="checkbox" id="order_chk" class="search" value="order_sq">
	                                    <label for="order_chk" style="margin-right: 26px; ">주문번호</label>
	                                    <span class="inputClickListener"><input type="text" name="order_sq" class="order_sq" disabled></span>
	                                </div>
	                                <div class="checks">
	                                    <input type="checkbox" id="prduct_chk" class="search" value="prduct_sq">
	                                    <label for="prduct_chk" style="margin-right: 26px;">상품번호</label>
	                                    <span class="inputClickListener"><input type="text" name="prduct_sq" class="prduct_sq" disabled></span>
	                                </div>
	                                <div class="checks">
	                                    <input type="checkbox" id="pay_chk" class="search" value="order_pay">
	                                    <label for="pay_chk" style="margin-right: 26px;">결제금액</label>
	                                    <span class="inputClickListener"><input type="tel" name="order_pay" class="order_pay" disabled></span>
	                                </div>
	                            </div>
	                            <!--회원번호 회원등급 전화번호-->
	                            <div class="order_info_right">
	                                <div class="checks">
	                                    <input type="checkbox" id="member_no" class="search" value="mber_sq">
	                                    <label for="member_no" style="margin-right: 13px;">회원번호</label>
	                                    <span class="inputClickListener"><input type="text" name="mber_sq" class="mber_sq" disabled></span>
	                                </div>
	                                <div class="checks">
	                                    <input type="checkbox" id="pay_method" class="search" value="order_method">
	                                    <label for="pay_method" style="margin-right: 13px;">결제수단</label>
	                                    <span class="inputClickListener"><input type="text" name="order_method" class="order_method" disabled></span>
	                                </div>
	                                <div class="checks">
	                                    <input type="checkbox" id="pro_status" class="search" value="order_status">
	                                    <label for="pro_status" style="margin-right: 13px;">주문현황</label>
	                                    <span class="inputClickListener"><input type="tel" name="order_status" class="order_status" disabled></span>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <!--기간-->
	                    <div class="searching_term">
	                        <div class="searching_term_title"><span>기간</span></div>
	                        <div class="searching_term_middle">
	                            <div class="checks">
	                                <input type="checkbox" id="join_date" class="search" value="order_dt">
	                                <label for="join_date" style="margin-right: 36px;">주문일</label>
	                                <div>
	                                    <span class="inputClickListener"><input type="date" id="join_box1" name="order_dt_start" class="order_dt" disabled></span>
	                                    ~
	                                    <span class="inputClickListener"><input type="date" id="join_box2" name="order_dt_end" class="order_dt" disabled></span>
	                                </div>
	                            </div>
	                            <div class="checks">
	                                <input type="checkbox" id="connect_term" class="search" value="order_paymt_dt">
	                                <label for="connect_term" style="margin-right: 17px;">주문결제일</label>
	                                <div>
	                                    <span class="inputClickListener"><input type="date" id="connect_box1" name="order_paymt_dt_start" class="order_paymt_dt" disabled></span>
	                                    ~
	                                    <span class="inputClickListener"><input type="date" id="connect_box2" name="order_paymt_dt_end" class="order_paymt_dt" disabled></span>
	                                </div>
	                            </div>
	                            <div class="checks">
	                                  <input type="checkbox" id="order_compt" class="search" value="order_compt_dt">
	                                  <label for="order_compt" style="margin-right: 17px;">주문완료일</label>
	                                  <div>
	                                      <span class="inputClickListener"><input type="date" id="compt_box1" name="order_compt_dt_start" class="order_compt_dt" disabled></span> ~
	                                      <span class="inputClickListener"><input type="date" id="compt_box2" name="order_compt_dt_end" class="order_compt_dt" disabled></span>
	                                  </div>
	                             </div>
	                        </div>
	                        <!-- 기간 선택 파트 -->
	                        <div class="searching_term_right part2">
	                            <div class="join_period_btn">
	                                <ul>
	                                    <li class="join_period_li">오늘 <input type="hidden" name="order_dt_start" value="${dateDTO.today}" disabled></li>
	                                    <li class="join_period_li">1주일 <input type="hidden" name="order_dt_start" value="${dateDTO.oneWeekAgo}" disabled></li>
	                                    <li class="join_period_li">1개월 <input type="hidden" name="order_dt_start" value="${dateDTO.oneMonthAgo}" disabled></li>
	                                    <li class="join_period_li">3개월 <input type="hidden" name="order_dt_start" value="${dateDTO.threeMonthAgo}" disabled></li>
	                                    <li class="join_period_li">6개월 <input type="hidden" name="order_dt_start" value="${dateDTO.sixMonthAgo}" disabled></li>
	                                    <li class="join_period_li">1년 <input type="hidden" name="order_dt_start" value="${dateDTO.oneYearAgo}" disabled></li>
	                                </ul>
	                            </div>
	                            <div class="connect_period_btn">
	                                <ul>
	                                	<li class="connect_period_li">오늘 <input type="hidden" name="order_paymt_dt_start" value="${dateDTO.today}" disabled></li>
	                                    <li class="connect_period_li">1주일 <input type="hidden" name="order_paymt_dt_start" value="${dateDTO.oneWeekAgo}" disabled></li>
	                                    <li class="connect_period_li">1개월 <input type="hidden" name="order_paymt_dt_start" value="${dateDTO.oneMonthAgo}" disabled></li>
	                                    <li class="connect_period_li">3개월 <input type="hidden" name="order_paymt_dt_start" value="${dateDTO.threeMonthAgo}" disabled></li>
	                                    <li class="connect_period_li">6개월 <input type="hidden" name="order_paymt_dt_start" value="${dateDTO.sixMonthAgo}" disabled></li>
	                                    <li class="connect_period_li">1년 <input type="hidden" name="order_paymt_dt_start" value="${dateDTO.oneYearAgo}" disabled></li>
	                                </ul>
	                            </div>
	                            <div class="order_period_btn">
	                                <ul>
	                                	<li class="order_period_li">오늘 <input type="hidden" name="order_compt_dt" value="${dateDTO.today}" disabled></li>
	                                    <li class="order_period_li">1주일 <input type="hidden" name="order_compt_dt" value="${dateDTO.oneWeekAgo}" disabled></li>
	                                    <li class="order_period_li">1개월 <input type="hidden" name="order_compt_dt" value="${dateDTO.oneMonthAgo}" disabled></li>
	                                    <li class="order_period_li">3개월 <input type="hidden" name="order_compt_dt" value="${dateDTO.threeMonthAgo}" disabled></li>
	                                    <li class="order_period_li">6개월 <input type="hidden" name="order_compt_dt" value="${dateDTO.sixMonthAgo}" disabled></li>
	                                    <li class="order_period_li">1년 <input type="hidden" name="order_compt_dt" value="${dateDTO.oneYearAgo}" disabled></li>
	                                </ul>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- 버튼 파트-->
	                    <div class="btn_part">
	                        <div class="and_or_radio_btn">
	                            <!--and 라디오 버튼-->
	                            <div class="and_container">
	                                <div class="and">
	                                    <input type="radio" name="and_or_chk" id="and_btn" value="and" checked="checked" />
	                                    <label for="and_btn">AND</label>
	                                </div>
	                            </div>
	                            <!--or 라디오 버튼-->
	                            <div class="or_container">
	                                <div class="or">
	                                    <input type="radio" name="and_or_chk" id="or_btn" value="or" />
	                                    <label for="or_btn">OR</label>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="view_refresh_btn">
	                            <input id="searchBtn" class="view_btn" type="button" value="조회" />
	                            <input class="refresh_btn" type="reset" value="초기화" />
	                        </div>
	                    </div>
	                </div>
	            </form>
	            <!-- 테이블 파트-->
	            <div class="order_info_table_title">
	                <span>주문정보 (총 <p>1,837</p> 개)</span>
	            </div>
	            <div id="orders" class="info_table">
	                <form>
	                    <div class="table_wrap">
	                        <table class="type11" id="checkbox_js">
	                            <colgroup>
	                                <col width="40" />	<!--체크박스-->
	                                <col width="80" />	<!--주문번호-->
	                                <col width="80" />	<!--회원번호-->
	                                <col width="80" />	<!--상품번호-->
	                                <col width="140" />	<!--주문일-->
	                                <col width="140" />	<!--주문결제일-->
	                                <col width="140" />	<!--주문수량-->
	                                <col width="140" />	<!--주문결제포인트-->
	                                <col width="100" />	<!--주문결제금액-->
	                                <col width="300" />	<!--주문결제수단-->
	                                <col width="300" />	<!--주문처리현황-->
	                                <col width="240" />	<!--주문완료일-->
	                            </colgroup>
	                            <thead>
	                                <tr>
	                                    <th><input name="oders" type="checkbox" id="allCheck"></th>
	                                    <th scope="col">주문번호</th>
	                                    <th scope="col">회원번호</th>
	                                    <th scope="col">상품번호</th>
	                                    <th scope="col">주문일</th>
	                                    <th scope="col">주문결제일</th>
	                                    <th scope="col">주문수량</th>
	                                    <th scope="col">주문결제포인트</th>
	                                    <th scope="col">주문결제금액</th>
	                                    <th scope="col">주문결제수단</th>
	                                    <th scope="col">주문처리현황</th>
	                                    <th scope="col">주문완료일</th>
	                                </tr>
	                            </thead>
	                            <tbody id="searchResult">
	                            <c:forEach var=" " items="">
		                                <tr id="${i.mber_sq}">
		                                    <td><input name="mbers" class="chkbox" type="checkbox" id="table_chk" value=""></td>
		                                    <td><input name="mber_sq" class="${i.mber_sq}" type="hidden" value="" disabled>1001</td>
		                                    <td><input name="mber_nm" class="${i.mber_sq}" type="text" value="" disabled></td>
		                                    <td></td>
		                                    <td></td>
		                                    <td><input name="mber_pw" class="${i.mber_sq}" type="password" value="" disabled></td>
		                                    <td><input name="mber_phone_no" class="${i.mber_sq}" type="text" value="" disabled></td>
		                                    <td><input name="mber_tel_no" class="${i.mber_sq}" type="text" value="" disabled></td>
		                                    <td><input name="mber_zip_no" class="${i.mber_sq}" type="text" value="" disabled></td>
		                                    <td><input name="mber_adres" class="${i.mber_sq}" type="text" value="" disabled></td>
		                                    <td><input name="mber_detail_adres" class="${i.mber_sq}" type="text" value="" disabled></td>
		                                    <td><input name="mber_email" class="${i.mber_sq}" type="text" value="" disabled></td>
		                                </tr>
		                          </c:forEach>
	                            </tbody>
	                        </table>
	                    </div>
	                    <div class="edit_delete_btn">
	                        <input class="edit_btn" type="button" value="수정" id="update" />
	                        <input class="delete_btn" type="button" value="삭제" id="withdrawal" />
	                    </div>
	                </form>
	            </div>
	        </section>
	    </main>
	</body>
</html>
