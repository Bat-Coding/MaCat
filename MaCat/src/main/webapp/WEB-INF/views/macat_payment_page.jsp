<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>결제 페이지</title>
    <!--여백-->
    <link rel="stylesheet" href="resources/css/spacing.css">
    <!--초기화-->
    <link rel="stylesheet" href="resources/css/normalize.css">
    <!-- 크롬 탭 로고 -->
    <link rel="shortcut icon" href="resources/img/logos/mcat-favicon.ico">
    <!--결제 페이지 css-->
    <link rel="stylesheet" href="resources/css/payment/payment_page.css">
    <!--결제페이지 탭메뉴-->
    <link rel="stylesheet" href="resources/css/payment/payment_tab_menu.css">
    <!-- 탭메뉴 속 내부테이블 디자인 -->
    <link rel="stylesheet" href="resources/css/payment/payment_tables.css">
    <!--라디오버튼-->
    <link rel="stylesheet" href="resources/css/payment/payment_radiobutton.css">
    <!--체크박스  css-->
    <link rel="stylesheet" href="resources/css/checkbox.css">
    
    <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
    <!-- 결제 쿼리문 -->
    <script type="text/javascript" src="resources/js/payment/payment.js"></script>
</head>

<body>
    <!-- 고정헤더 불러오기 -->
	<div id="macat_header"><%@ include file="header.jsp" %></div>
    <!-- 여백-->
    <div class="order_spacing"></div>

    <main>
        <h2>ORDER</h2>
        <!--메인 결제창 : 주소, 쿠폰, 결제수단, 구매상품 목록-->
        <section id="order_main">
            <!--주소지 선택창 -->
            <!--탭 메뉴 시작-->
            <div class="tab" id="adress_tab">
                <ul class="adress_tab-titles" id="adress_tab-titles">
                    <li class="current" data-tab-titles="adress_lately">
                        <a href="#Redirect">최근주소지</a></li>
                    <li data-tab-titles="adress_home">
                        <a href="#Redirect">집</a></li>
                    <li data-tab-titles="adress_company">
                        <a href="#Redirect">회사</a></li>
                    <li data-tab-titles="adress_new">
                        <a href="#Redirect">신규주소지</a></li>
                </ul>

                <!--최근 주소지-->
                <div id="adress_lately" class="adress_tabcontent current">
                    <div class="delivery_adress_table">
                        <table class="order_adress_table">
                            <tr>
                                <th scope="row">수령자명</th>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <th scope="row">우편번호</th>
                                <td>
                                    <div id="zonecodes">	
					                	<input type="text" id="zonecode" class="fadeIn eleventh" name="mber_zip_no" placeholder="우편번호" readonly>
					                	<input type="button" id="zonecode_button" class="fadeIn eleventh" onclick="searchZip()" value="우편번호 찾기">
					               	</div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">주소</th>
                                <td><input class="adress_input" type="text"></td>
                            </tr>
                            <tr>
                                <th scope="row">상세주소</th>
                                <td><input class="adress_more_input" type="text"></td>
                            </tr>
                            <tr>
                                <th scope="row">배송메세지</th>
                                <td><input class="order_msg_input" type="text"></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!--집 주소지-->
                <div id="adress_home" class="adress_tabcontent">
                    <div class="delivery_adress_table">
                        <table class="order_adress_table">
                            <tr>
                                <th scope="row">수령자명</th>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <th scope="row">우편번호</th>
                                <td>
                                	<div id="zonecodes">	
					                	<input type="text" id="zonecode" class="fadeIn eleventh" name="mber_zip_no" placeholder="우편번호" readonly>
					                	<input type="button" id="zonecode_button" class="fadeIn eleventh" onclick="searchZip()" value="우편번호 찾기">
					               	</div>
								</td>
                            </tr>
                            <tr>
                                <th scope="row">주소</th>
                                <td><input class="adress_input" type="text"></td>
                            </tr>
                            <tr>
                                <th scope="row">상세주소</th>
                                <td><input class="adress_more_input" type="text"></td>
                            </tr>
                            <tr>
                                <th scope="row">배송메세지</th>
                                <td><input class="order_msg_input" type="text"></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!--회사 주소지-->
                <div id="adress_company" class="adress_tabcontent">
                    <div class="delivery_adress_table">
                        <table class="order_adress_table">
                            <tr>
                                <th scope="row">수령자명</th>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <th scope="row">우편번호</th>
                                <td>
                                	<div id="zonecodes">	
					                	<input type="text" id="zonecode" class="fadeIn eleventh" name="mber_zip_no" placeholder="우편번호" readonly>
					                	<input type="button" id="zonecode_button" class="fadeIn eleventh" onclick="searchZip()" value="우편번호 찾기">
					               	</div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">주소</th>
                                <td><input class="adress_input" type="text"></td>
                            </tr>
                            <tr>
                                <th scope="row">상세주소</th>
                                <td><input class="adress_more_input" type="text"></td>
                            </tr>
                            <tr>
                                <th scope="row">배송메세지</th>
                                <td><input class="order_msg_input" type="text"></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!--신규 주소지-->
                <div id="adress_new" class="adress_tabcontent">
                    <div class="delivery_adress_table">
                        <table class="order_adress_table">
                            <tr>
                                <th scope="row">수령자명</th>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <th scope="row">우편번호</th>
                                <td>
                                    <div id="zonecodes">	
					                	<input type="text" id="zonecode" class="fadeIn eleventh" name="mber_zip_no" placeholder="우편번호" readonly>
					                	<input type="button" id="zonecode_button" class="fadeIn eleventh" onclick="searchZip()" value="우편번호 찾기">
					               	</div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">주소</th>
                                <td><input class="adress_input" type="text"></td>
                            </tr>
                            <tr>
                                <th scope="row">상세주소</th>
                                <td><input class="adress_more_input" type="text"></td>
                            </tr>
                            <tr>
                                <th scope="row">배송메세지</th>
                                <td><input class="order_msg_input" type="text"></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!--주소지 끝-->
            </div>
            <!--탭 메뉴 끝-->

            <!--쿠폰 선택창-->
            <div class="coupon_table_container">
                <table class="coupon_table">
                    <tr>
                        <th scope="row">쿠폰선택하기</th>
                        <td>
                            <select name="수량선택" id="">
                                <option value="0">쿠폰0</option>
                                <option value="1">쿠폰1</option>
                                <option value="2">쿠폰2</option>
                                <option value="3">쿠폰3</option>
                                <option value="4">쿠폰4</option>
                                <option value="5">쿠폰5</option>
                                <option value="6">쿠폰6</option>
                                <option value="7">쿠폰7</option>
                                <option value="8">쿠폰8</option>
                                <option value="9">쿠폰9</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">포인트 사용</th>
                        <td>
                            <input class="point_use" type="text">
                            <span>사용가능 포인트 : <span>300</span> p</span>
                        </td>
                    </tr>
                </table>
            </div>
            <!--쿠폰선택창 끝-->

            <!--결제수단 선택 탭-->
            <div class="tab" id="payment_tab">
                <ul class="payment_tab-titles" id="payment_tab-titles">
                    <li class="current" data-tab-titles="payment_choice">
                        <a href="#Redirect">신용카드/체크카드</a>
                    </li>
                    <li data-tab-titles="bank_deposit">
                        <a href="#Redirect">무통장입금</a>
                    </li>
                </ul>

                <!--신용카드/체크카드-->
                <div id="payment_choice" class="payment_tabcontent current">
                    <!--신용카드.체크카드 선택-->
                    <div class="payment_choice">
                        <div class="payment_choice_container">
                            <table class="payment_choice_table">
                                <!--첫째줄-->
                                <tr>
                                    <th class="radio_box" scope="row">
                                        <div class="radio-wrap">
                                            <input id="payment_radio1" name="payment" type="radio">
                                            <label for="payment_radio1"></label>
                                        </div>
                                    <td>현대카드</td>
                                    <th class="radio_box" scope="row">
                                        <div class="radio-wrap">
                                            <input id="payment_radio2" name="payment" type="radio">
                                            <label for="payment_radio2"></label>
                                        </div>
                                    <td>KB국민카드</td>
                                    <th class="radio_box" scope="row">
                                        <div class="radio-wrap">
                                            <input id="payment_radio3" name="payment" type="radio">
                                            <label for="payment_radio3"></label>
                                        </div>
                                    <td>신한카드</td>
                                    <th class="radio_box" scope="row">
                                        <div class="radio-wrap">
                                            <input id="payment_radio4" name="payment" type="radio">
                                            <label for="payment_radio4"></label>
                                        </div>
                                    <td>삼성카드</td>
                                </tr>
                                <!--둘째줄-->
                                <tr>
                                    <th class="radio_box" scope="row">
                                        <div class="radio-wrap">
                                            <div class="radio-wrap">
                                                <input id="payment_radio5" name="payment" type="radio">
                                                <label for="payment_radio5"></label>
                                            </div>
                                        </div>
                                    </th>
                                    <td>롯데카드</td>
                                    <th class="radio_box" scope="row">
                                        <div class="radio-wrap">
                                            <input id="payment_radio6" name="payment" type="radio">
                                            <label for="payment_radio6"></label>
                                        </div>
                                    <td>우리카드</td>
                                    <th class="radio_box" scope="row">
                                        <div class="radio-wrap">
                                            <input id="payment_radio7" name="payment" type="radio">
                                            <label for="payment_radio7"></label>
                                        </div>
                                    <td>하나카드</td>
                                    <th class="radio_box" scope="row">
                                        <div class="radio-wrap">
                                            <input id="payment_radio8" name="payment" type="radio">
                                            <label for="payment_radio8"></label>
                                        </div>
                                    <td>비씨카드</td>
                                </tr>
                                <!--셋째줄-->
                                <tr>
                                    <th class="radio_box" scope="row">
                                        <div class="radio-wrap">
                                            <input id="payment_radio9" name="payment" type="radio">
                                            <label for="payment_radio9"></label>
                                        </div>
                                    </th>
                                    <td>NH농협카드</td>
                                    <th class="radio_box" scope="row">
                                        <div class="radio-wrap">
                                            <input id="payment_radio10" name="payment" type="radio">
                                            <label for="payment_radio10"></label>
                                        </div>
                                    <td>씨티카드</td>
                                    <th class="radio_box" scope="row">
                                        <div class="radio-wrap">
                                            <input id="payment_radio11" name="payment" type="radio">
                                            <label for="payment_radio11"></label>
                                        </div>
                                    <td>BC카드</td>
                                    <th class="radio_box" scope="row">
                                        <div class="radio-wrap">
                                            <input id="payment_radio12" name="payment" type="radio">
                                            <label for="payment_radio12"></label>
                                        </div>
                                    <td>카카오뱅크</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!--신용카드/체크카드 선택 끝-->
                </div>
                
                <!--무통장입금-->
                <div id="bank_deposit" class="payment_tabcontent">
                    <!--무통장 입금-->
                    <div class="bank_deposit">
                        <div class="bank_deposit-container">
                            <table class="bank_deposit-table">
                                <!--첫째줄-->
                                <tr class="tr1">
                                    <td>기업은행</td>
                                    <td>KB국민은행</td>
                                    <td>NH농협은행</td>
                                    <td>신한은행</td>
                                    <td>SC은행</td>
                                    <td>우리은행</td>
                                </tr>
                                <!--둘째줄-->
                                <tr class="tr2">
                                    <td>하나은행</td>
                                    <td>씨티은행</td>
                                    <td>카카오뱅크</td>
                                    <td>부산은행</td>
                                    <td>대구은행</td>
                                    <td>광주은행</td>
                                </tr>
                                <!--셋째줄-->
                                <tr class="tr3">
                                    <td>전북은행</td>
                                    <td>경남은행</td>
                                    <td>수협은행</td>
                                    <td>새마을금고</td>
                                    <td>우체국</td>
                                    <td>기타은행</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- 무통장 끝 -->
            </div>
            <!--탭 메뉴 끝-->

            <!--구매상품 목록 보여주기-->
            <div class="ordered_product_list">
                <table class="ordered_product_list-table">
                    <colgroup>
                        <col style="width:45px;">
                        <col style="width:250px;">
                        <col style="width:60px;">
                        <col style="width:60px;">
                        <col style="width:60px;">
                    </colgroup>
                    <!--테이블 제목-->
                    <thead>
                        <tr>
                            <th colspan="5" scope="col"><span>상품정보</span></th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--상품명, 수량, 금액, 배송비 행-->
                        <tr>
                            <td></td>
                            <td>상품명</td>
                            <td>수량</td>
                            <td>금액</td>
                            <td>배송비</td>
                        </tr>
                        <!--구매상품 목록 행-->
                        <tr>
                            <td><img src="resources/img/macat_food01.png" alt=""></td>
                            <td><a href="macat_product.html">고고 캣푸드 내츄럴 본 아이돌</a>
                            </td>
                            <td>1</td>
                            <td id="cart_product_price">10,000</td>
                            <td id="cart_delivery_pay">2,500</td>
                        </tr>                       
                    </tbody>

                </table>
            </div>
        </section>

        <!--사이드 결제창 : 결제금액, 결제동의-->
        <aside id="total_price_agreement">
            <!--총 결제금액 출력 테이블-->
            <div class="total_price_container">
                <table class="total_price_table">
                    <tr>
                        <th>총 상품가격</th>
                        <td>20,000원</td>
                    </tr>
                    <tr>
                        <th>배송비</th>
                        <td>5,000원</td>
                    </tr>
                    <tr>
                        <th>결제예정금액</th>
                        <td>25,000원</td>
                    </tr>
                </table>
                <!--결제 버튼-->
                <div class="total_price_btn_conatiner">
                    <input class="order_go" type="button" value="결제하기" />
                </div>
            </div>
            <!-- 공백용 -->
            <div class="payment_aside_table_spacing"></div>

            <!--결제동의 테이블-->
            <div class="payment_agreement_conatiner">
               <span>결제정보제공동의 내용</span>
                <table class="payment_agreement_table">                   
                    <tr>
                        <th>제공받는자</th>
                        <td>마캣컴퍼니</td>
                    </tr>
                    <tr>
                        <th>제공목적</th>
                        <td>상품 및 배송, 반품, 환불,고객상담 등 정보통신서비스제공계약 및 전자상거래(통신판매)
                        계약의 이행을 위해 필요한 업무의 처리</td>
                    </tr>
                    <tr>
                        <th>동의항목</th>
                        <td>ID, 성명, 전화번호, 휴대전화번호, 배송지 주소, 이메일 주소(선택시)</td>
                    </tr>
                    <tr>
                        <th>정보보유기간</th>
                        <td>결제정보제공 동의 후 1개월</td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <div class="order_payment_agreement_input_box">
                                <input type="checkbox" id="agreement_input">
                                <label for="agreement_input">결제정보제공에 동의합니다</label>
                            </div>
                        </th>
                    </tr>
                </table>
            </div>
        </aside>
    </main>

</body></html>
