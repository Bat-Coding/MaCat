$(function() {
	
	// AJAX 처리시 tbody에 출력할 값
	$.fn.getTable = function(data) {
		var result = "";
  	    var pagingResult = "";
		$.each(data, function(key, value){
			if (key === "faqDTO") {
				$.each(value, function(k, v){
					result += "<tr id='" + v["faq_sq"] + "'>";
					result += "<td><input type='checkbox' class='chkbox' name='faqs' value='" + v["faq_sq"] + "'></td>";
					result += "<td>" + v["qc_nm"] + "</td>";
					result += "<td>" + v["faq_sq"] + "</td>";
					result += "<td><a href='faq_view.mcat?faq_sq=" + v["faq_sq"] + "'>" + v["faq_sj"] + "</a></td>";
				});
			}else if (key === "pageDTO"){
				var pageDTO = value;
				
				if (pageDTO.beginBlock <= pageDTO.pagePerBlock){
					pagingResult += '<li class="disable">◀</li>';
				}else {
					pagingResult += '<li><a class="page">◀<input type="hidden" name="cPage" value="' + (pageDTO.beginBlock - 1) + '"></a></li>';
				}
				  
				for (var i = pageDTO.beginBlock; i <= pageDTO.endBlock; i++) {
					if (i == pageDTO.nowPage) {
						pagingResult += '<li class="now">' + i + '</li>';
					}else{
						pagingResult += '<li><a class="page">' + i + '<input type="hidden" name="cPage" value="' + i + '"></a></li>';
					}
				}
				  
				if (pageDTO.endBlock >= pageDTO.totalPage){
					pagingResult += '<li class="disable">▶</li>';
				}else {
					pagingResult += '<li><a class="page">▶<input type="hidden" name="cPage" value="' + (pageDTO.beginBlock + pageDTO.pagePerBlock) + '"></a></li>';
				}
			}
		});
		$("#searchResult").empty();
		$("#searchResult").append(result);
		$("#paging").empty();
		$("#paging").append(pagingResult);
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
	        	// 이름이 faqs일 경우에는 무조건 배열처리(faqs는 체크박스이다)
	        	if (name === "faqs") {
	        		newJSON[name] = [value];
	        	// 나머지는 변수 처리
				}else{
					newJSON[name] = value || "";
				}
	        }
	    });
	    return JSON.stringify(newJSON);
	};
	
	
	// 검색 영역 체크박스 체크시 인풋 활성화/비활성화
	$("input[name=search_chk]").change(function() {
		if ($(this).prop("checked")) {
			$("." + this.value).attr("disabled", false);
		} else {
			$("." + this.value).attr("disabled", true);
			$("." + this.value).val(null);
		}
	});
	
	
	// 전체 체크
	$(".all").change(function(){
		$(".chkbox").prop("checked", this.checked);
	});
	
	
	// 페이지 이동 AJAX
	$(document).on("click", ".page", function(){
		$.ajax({
			url			: "faq_paging.mcat",
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
	
	
	// FAQ 검색 AJAX
	$("#searchBtn").click(function() {
		console.log($().toJSON($("#searchForm > *:not(input[name=search_chk])")));
		$.ajax({
			url			: "faq_search.mcat",
            type		: "POST",
            dataType	: "json",
            contentType : "application/json",
            data		: $().toJSON($("#searchForm > *:not(input[name=search_chk])")),
            success		: function(data) {
            				  $().getTable(data);
            			  },
            error		: function(error) {
            				  console.log(error);
            				  alert("에러 발생");
            			  }
		});
	});
	
	
	// FAQ 삭제 AJAX
	$(document).on("click", "#delete", function(){
		$.ajax({
			url			: "faq_delete.mcat",
            type		: "POST",
            dataType	: "json",
            contentType : "application/json",
            data		: $().toJSON($(".chkbox:checked")),
            success		: function(data) {
            				  $(".all").prop("checked", false);
            				  $().getTable(data);
			              },
            error		: function(error) {
            				  console.log(error);
            				  alert("에러 발생");
            			  }
		});
	});
	
});