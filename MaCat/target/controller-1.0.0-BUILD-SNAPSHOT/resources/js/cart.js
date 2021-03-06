﻿function getCookie(name) {
	var value = document.cookie.match("(^|;) ?" + name + "=([^;]*)(;|$)");
	return value ?value[2] :null;
};

Number.prototype.format = function(){
    if(this == 0) return 0;
 
    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');
 
    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
 
    return n;
};

/*function getTotal(form) {
	var totalPrice = 0;
	var mostDlvyPrice = 0;
	var totalDC = 0;
	
	$.each(form, function(k, v) {
		var key = form.k;
		var value = form.v;
		alert(key);
		alert(value);
	})
	
	var price = [$("#prduct_price").];
	for ( var i in price) {
		price[i]
	}
	var totalPrice = ;
	var mostDlvyPrice = 0;
	var totalDC = 0;
	if
}*/



// 쿠키에 cart가 있다면 페이지 로드시 장바구니 가져오기
$(function() {
	var carts = JSON.parse(getCookie('cart'));
	
	if(carts != null){
		var priceResult = "";
		var cartResult = "";
		var chkboxID = 0;
		var totalPrice = 0;
		var totalDC = 0;
		var mostDlvyPrice = 0;
		$.each(carts, function(key, value) {
			$.each(value, function(k, v) {
				if (v["prduct_dc"] > 0) {
					totalDC += v["prduct_dc"];
				}else if (v["prduct_dc_pt"] > 0 && v["prduct_price"] > 99) {
					totalDC += v["prduct_price"] * v["prduct_dc_pt"] / 100;
				}
				
				if (mostDlvyPrice < v["prduct_dlvy_price"]) {
					mostDlvyPrice = v["prduct_dlvy_price"];
				}
				
				totalPrice += v["prduct_price"];
			});
			
			if (totalPrice - totalDC > 50000) {
				for (var i in value) {
					carts.cart[i].prduct_dlvy_price = 0;
				}
				mostDlvyPrice = 0;
			}
			
			$.each(value, function(k, v) {
				cartResult += '<tr><td><input name="carts" class="chkbox" type="checkbox" id="' + chkboxID + '" value="' + chkboxID + '" checked>';
				cartResult += '<label for="' + chkboxID + '"></label></td>';
				cartResult += '<input type="hidden" class="' + chkboxID + '" value="' + v["prduct_sq"] + '" disabled>';
				cartResult += '<input type="hidden" class="' + chkboxID + '" value="' + v["cart_color"] + '" disabled>';
				cartResult += '<td><img src="resources/img/' + v["prduct_thumb_nm"] + '" alt=""></td>';
				cartResult += '<td><div class="category_box">' + v["ctgry_nm"] + '</div>';
				cartResult += '<a href="macat_product.html">' + v["prduct_nm"] + '</a></td>';
				cartResult += '<td>' + v["cart_color"] + '</td>';
				cartResult += '<td>' + v["cart_amt"].format() + '</td>';
				cartResult += '<td id="cart_product_price">' + v["prduct_dced_price"].format() + '</td>';
				cartResult += '<td id="cart_delivery_pay">' + v["prduct_dlvy_price"].format() + '</td></tr>';
				chkboxID++;
			});
		});
		priceResult += '<tr><th>장바구니 합계</th><td>' + totalPrice.format() +'원</td></tr>';
		priceResult += '<tr><th>배송비</th><td>' + mostDlvyPrice.format() +'원</td></tr>';
		priceResult += '<tr><th>할인금액</th><td>' + totalDC.format() +'원</td></tr>';
		priceResult += '<tr><th>총 결제금액</th><td>' + (totalPrice - totalDC + mostDlvyPrice).format() +'원</td></tr>';
		
		$("#cart_result").empty();
		$("#cart_result").append(cartResult);
		$(".price_result").empty();
		$(".price_result").append(priceResult);
	}
	
	
	$("#cart_allCheck").change(function(){
		$(".chkbox").prop("checked", this.checked);
		$(".chkbox").trigger("change");
	});
	
	$(document).on("change", ".chkbox", function(){
		if ($(this).prop("checked")){
			$("." + this.value).attr("disabled", false);
			
			// 체크 안된 값이 없으면 cart_allCheck 체크박스도 체크
			if ($(".chkbox:not(:checked)").length == 0) $("#cart_allCheck").prop("checked", true);
		}else{
			$("."+this.value).attr("disabled", true);
			
			// 하나라도 체크 해제되면 cart_allCheck 체크박스도 체크 해제
			$("#cart_allCheck").prop("checked", false);
		}
	});
});

/*/////////////// 전체선택 체크박스 쿼리 /////////////// */
//전체선택 체크박스 클릭 
$(function(){ 
   $("#cart_allCheck").click(function(){
        if( $("#cart_allCheck").prop("checked") ){ 
            $("input[name=cartOne]").prop("checked",true); 
        } else {  
            $("input[name=cartOne]").prop("checked",false); 
        }   
   });
});        

function allCheckFunc( obj ) {
$("[name=cartchkAll]").prop("checked", $(obj).prop("checked") );
}

/*     체크박스 체크시 전체선택 체크 여부 : 하나 선택해제하면
    전체선택 체크박스 체크표시가 해제됨*/
function oneCheckFunc( obj )
{
    var allObj = $("[name=cartchkAll]");
    var objName = $(obj).attr("name");

    if( $(obj).prop("checked") )
    {
        checkBoxLength = $("[name="+ objName +"]").length;
        checkedLength = $("[name="+ objName +"]:checked").length;

        if( checkBoxLength == checkedLength ) {
            allObj.prop("checked", true);
        } else {
            allObj.prop("checked", false);
        }
    }
    else
    {
        allObj.prop("checked", false);
    }
}

$(function(){
    $("[name=cartchkAll]").click(function(){
        allCheckFunc( this );
    });
    $("[name=cartOne]").each(function(){
        $(this).click(function(){
            oneCheckFunc( $(this) );
        });
    });
});

/*/////////////// 수량 증가/감소 쿼리 /////////////// */
$(function(){
    // 감소(-)버튼 눌렀을 때
    $('#decreaseQuantity').click(function(e){
        e.preventDefault();
        // stat 변수에 #numberUpDown 이 있는 태그의 내용을 가져옴
        var stat = $('#numberUpDown').text();
        // num에 stat를 int 로 변환해서 담음
        var num = parseInt(stat,10);
            num--;
        // 최소값 : num에 1을 최소값으로 넣어줌
        if(num<=0){
            alert('더 이상 줄일수 없습니다.');
            num =1;
        }
        // #numberUpDown 태그 내용을 num으로 바꿈
        $('#numberUpDown').text(num);                    
    });
    
    // 증가(+)버튼 눌렀을 때
    $('#increaseQuantity').click(function(e){
        e.preventDefault();
        var stat = $('#numberUpDown').text();
        var num = parseInt(stat,10);
            num++;
    // 최대값
    if(num>10){
        alert('더 이상 늘릴수 없습니다.');
        num=10;
    }
        $('#numberUpDown').text(num);
    });
});