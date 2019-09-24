$(function() {
	
	// AJAX 처리시 tbody에 출력할 값
	$.fn.getTable = function(data) {
		var result = "";
  	    var pagingResult = "";
  	    var review_count;
		$.each(data, function(key, value){
			if (key === "ReviewDTO") {
				$.each(value, function(k, v){
					result += '<tr id="'+ v["re_sq"]+ '">';
					result += '<td class="checks"><input name="review" class="chkbox" type="checkbox" id="table_chk" value="'
							 + v["re_sq"] + '"><label for="table_chk"></label></td>';
					result += '<td>'+v["re_sq"]+'</td>';
					result += '<td>'+v["mber_sq"]+'</td>';
					result += '<td>'+v["prduct_sq"]+'</td>';
					result += '<td>'+v["re_reg_dt"].substring(0,10)+'</td>';
					result += '<td>'+v["re_rating"]+'</td>';
					result += '<td>'+v["re_view_cnt"]+'</td>';
					result += '<td>'+v["re_like"]+'</td>';
					result += '<td><input name="re_ans_st" class="'+v["re_ans_st"] + '" type="text" value=' +v["re_ans_st"] + ' disabled></td>';
					result += '<td>'+v["re_id"]+'</td>';
					result += '<td><a href="review_manage.mcat?re_sj='+v["re_sj"]+'>' + v["re_sj"] + '</a></td>';
					result += '<td>'+v["re_nm"]+'</td></tr>';
					
				});
			}else if (key === "pageDTO"){
				var pageDTO = value;
				
				if (pageDTO.beginBlock <= pageDTO.pagePerBlock){
					pagingResult += '<li class="disable">';
					pagingResult +=	'<img src="resources/img/mcat-arrow-slider-left-grey.png" height="10px">'
					pagingResult += '</li>';
				}else {
					pagingResult += '<li><a class="page">';
					pagingResult += '<img src="resources/img/mcat-arrow-slider-left-grey.png" height="10px">';
					pagingResult += '<input type="hidden" name="cPage" value="' + (pageDTO.beginBlock - 1) + '">';
					pagingResult += '</a></li>';
				}
				  
				for (var i = pageDTO.beginBlock; i <= pageDTO.endBlock; i++) {
					if (i == pageDTO.nowPage) {
						pagingResult += '<li class="now">' + i + '</li>';
					}else{
						pagingResult += '<li><a class="page">' + i + '<input type="hidden" name="cPage" value="' + i + '"></a></li>';
					}
				}
				  
				if (pageDTO.endBlock >= pageDTO.totalPage){
					pagingResult += '<li class="disable">';
					pagingResult += '<img src="resources/img/mcat-arrow-slider-right-grey.png" height="10px">';
					pagingResult += '</li>';
				}else {
					pagingResult += '<li><a class="page">';
					pagingResult += '<img src="resources/img/mcat-arrow-slider-right-grey.png" height="10px">';
					pagingResult += '<input type="hidden" name="cPage" value="' + (pageDTO.beginBlock + pageDTO.pagePerBlock) + '">';
					pagingResult += '</a></li>';
				}
				review_count = pageDTO.totalRecord;
			}
		});
		$("#searchResult").html(result);
		$("#paging").html(pagingResult);
		$("#review_count").html(review_count);
		if($("#allCheck").prop("checked")) $("#allCheck").prop("checked", false);
	}
	
	
	// form 데이터를 JSON형식으로 변환
	$.fn.toJSON = function(f) {
		var array = $(f).serializeArray();
		var newJSON = {};
		
		$.each(array, function() {
			var name = $.trim(this.name), value = $.trim(this.value);
			
			if (value == "") return true;
			
			if (newJSON[name]) {
	            if (!newJSON[name].push) {
	            	newJSON[name] = [newJSON[name]];
	            }
	            newJSON[name].push(value || "");
	        } else {
	        	// 이름이 "review"일 경우에는 무조건 배열처리(review는 체크박스이다)
	        	if (name === "review") {
	        		newJSON[name] = [value];
	        	// 나머지는 변수 처리
				}else{
					newJSON[name] = value || "";
				}
	        }
	    });
	    return JSON.stringify(newJSON);
	};
	
	// 주문일
    $(".join_period_li").each(function() {
        $(this).click(function() {
            $(this).addClass("selected"); //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
            $(this).siblings().removeClass("selected"); //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
            $("#join_date").prop("checked", false); // 기간 input 초기화
    		$("#join_date").trigger("change");		// 기간 input 초기화
    		$(this).children().attr("disabled", false); // 히든값
    		$(this).siblings().children().attr("disabled", true);
        });
    });    
    
    $("#join_date").change(function(){
        if($("#join_date").is(":checked")){
        	$(".join_period_li").removeClass("selected");
        }
    });      
    

    // 검색 영역 체크박스 체크시 인풋 활성화/비활성화, 포커싱
	$(".search").change(function() {
		if ($(this).prop("checked")) {
			$("." + this.value).attr("disabled", false);
			$("." + this.value + ":first").focus();
		} else {
			$("." + this.value).attr("disabled", true);
			$("." + this.value).val(null);
			$("." + this.value).removeClass("active");
		}
	});
	
	
	// 검색 영역 인풋 클릭시 인풋 활성화/비활성화, 포커싱
	$(".inputClickListener").click(function() {
		if (!$(this).siblings(".search").prop("checked")){
			$(this).siblings(".search").prop("checked", true);
			$(this).siblings(".search").trigger("change");
		}
		if (!$(this).parents("div").siblings(".search").prop("checked")) {
			$(this).parents("div").siblings(".search").prop("checked", true);
			$(this).parents("div").siblings(".search").trigger("change");
			$(this).children().focus();
		}
	});
    
	
	// 하단 테이블 체크박스 체크시 인풋 활성화/비활성화 + 색상변경
	$(document).on("change", ".chkbox", function(){
		if ($(this).prop("checked")){
			$("."+this.value).attr("disabled", false);
			$("."+this.value).css("color", "#F2A766");
			
			// 체크 안된 값이 없으면 allCheck 체크박스도 체크
			if ($(".chkbox:not(:checked)").length == 0) $("#allCheck").prop("checked", true);
		}else {
			$("."+this.value).attr("disabled", true);
			$("."+this.value).css("color", "#000");
			
			// 하나라도 체크 해제되면 allCheck 체크박스도 체크 해제
			$("#allCheck").prop("checked", false);
		}
	});

	// 전체 체크
	$("#allCheck").change(function(){
		$(".chkbox").prop("checked", this.checked);
		$(".chkbox").trigger("change");
	});
	
	
	// 페이지 이동 AJAX
	$(document).on("click", ".page", function(){
		$.ajax({
			url			: "reviews_paging.mcat",
            type		: "POST",
            dataType	: "json",
            contentType : "application/json",
            data		: $(this).find("input").val(),
            success		: function(data) {
            				  $().getTable(data);
            			  },
            error		: function(error) {
            				  console.log(error);
            				  alert("에러 발생");
            			  }
		});
	});
	
	
	// 리뷰 검색 AJAX
	$("#searchBtn").click(function() {
		console.log($().toJSON($("#searchForm")));
		$.ajax({
			url			: "reviews_search.mcat",
            type		: "POST",
            dataType	: "json",
            contentType : "application/json",
            data		: $().toJSON($("#searchForm")),
            success		: function(data) {
            				  $().getTable(data);
            			  },
            error		: function(error) {
            				  console.log(error);
            				  alert("에러 발생");
            			  }
		});
	});
	

	// 수정 AJAX
	$(document).on("click", "#update", function(){
		
		/* 체크된 열만 JSON 배열로 파싱 */
		var data = {};
		var arr = [];
		// <tr>갯수만큼 each
	    $("tbody").find("tr").each(function(){
	    	// 체크박스 체크되지 않은 열은 넘기기
	      	if (!$(this).find(".chkbox").is(":checked")) return true;
	        var row = {};
	        // <tr>안의 <input>(체크박스제외), <select>만큼 each
	        $(this).find("input:not(.chkbox), select").each(function(){
	        	// row객체에 열 정보 담기
	            row[$(this).attr("name")] = $(this).val();
	        });
	        // 담은 열 정보를 arr배열에 추가
	        arr.push(row);
	    });
	    // arr배열을 mbersDTO라는 key값과 함께 저장
	    data = {reviewDTO : arr};
	    // JSON형태로 직렬화
	    var mbersDTO = JSON.stringify(data);

	    $.ajax({
			url			: "reviews_update.mcat",
            type		: "POST",
            dataType	: "json",
            contentType : "application/json",
            data		: reviewDTO,
            success		: function(data) {
            				  $("#allCheck").prop("checked", false);
            				  $().getTable(data);
            			  },
            error		: function(error) {
			            	  console.log(error);
			            	  alert("에러 발생");
			              }
		});
	});
		
	
	// 삭제 AJAX
	$(document).on("click", "#delete", function(){
		$.ajax({
			url			: "reviews_delete.mcat",
            type		: "POST",
            dataType	: "json",
            contentType : "application/json",
            data		: $().toJSON($(".chkbox:checked")),
            success		: function(data) {
            				  $("#allCheck").prop("checked", false);
            				  $().getTable(data);
			              },
            error		: function(error) {
            				  console.log(error);
            				  alert("에러 발생");
            			  }
		});
	});
	
});