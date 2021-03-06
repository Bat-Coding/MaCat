function check() {
	// 데이터 전송 전 ','제거
	$("input[name=prduct_price]").val($("input[name=prduct_price]").val().replace(/,/g,''));
	$("input[name=prduct_dc]").val($("input[name=prduct_dc]").val().replace(/,/g,''));
	$("input[name=prduct_amt]").val($("input[name=prduct_amt]").val().replace(/,/g,''));
	$("input[name=prduct_dlvy_price]").val($("input[name=prduct_dlvy_price]").val().replace(/,/g,''));
	$("input[name=prduct_save]").val($("input[name=prduct_save]").val().replace(/,/g,''));
	
	// 이곳에 유효성 검사를 추가 해야합니다.
	
	return true;
}

/*////////////////// 카테고리 연계 스크립트 //////////////////*/
// 정상 작동
function categoryChange(e, ctgry_nm) {
  var food = ["건식", "습식", "우유/분유", "저칼로리"];
  var snack = ["캔", "소시지/건어물", "스낵", "츄르"];
  var toilet = ["응고형", "흡수형", "평판", "후드형"];
  var toy = ["낚시대/막대", "쿠션/공", "캣닢/인형", "레이저"];
  var living_goods = ["캣타워", "이동가방", "급수기", "하우스"];
  var acc = ["목줄/가슴줄", "목걸이", "티셔츠", "원피스"];
  var clean_goods = ["모래삽", "브러쉬", "샴푸/린스", "발/발톱관리"];
  var default_option = ["2차 카테고리"];

  var target = document.getElementById("second_category");

  if (e.value == "0") var depth_2 = default_option;
  else if (e.value == "1") var depth_2 = food;
  else if (e.value == "2") var depth_2 = snack;
  else if (e.value == "3") var depth_2 = toy;
  else if (e.value == "4") var depth_2 = living_goods;
  else if (e.value == "5") var depth_2 = acc;
  else if (e.value == "6") var depth_2 = toilet;
  else if (e.value == "7") var depth_2 = clean_goods;
  
  target.options.length = 0;

  for (i in depth_2) {
	if (depth_2[i] === ctgry_nm) {
		var opt = document.createElement("option");
		opt.setAttribute("selected", "selected");
	}else{
		var opt = document.createElement("option");
	}
      opt.value = depth_2[i];
      opt.innerHTML = depth_2[i];
      target.appendChild(opt);
  }
}
/*////////////////// 이미지 미리보기 스크립트 //////////////////*/
// 정상 작동
$(document).ready(function(){	
	var inputFileClass = 1;
	
	// 숨긴 input을 다른 버튼에서 실행하게 하기
	$(document).on("click", ".preview-file_upload-main", function(e) {
	    e.preventDefault();
	    $(".inp-img-main").click();
	    
	    // 파일 등록시 readInputFile함수에 인자로 전달
	    $(".inp-img-main").off().on('change', function() {
		    readInputFile(this);
		});
	});      
	
	$(document).on("click", ".preview-file_upload-sub", function(e) {
	    e.preventDefault();
	    if (inputFileClass < 4) {
	    	$(".inp-img-sub" + inputFileClass).click();
		    // 파일 등록시 readInputFile함수에 인자로 전달
		    $(".inp-img-sub" + inputFileClass).off().on("change", function(e) {
			    readInputFile_sub(this);
			});
		}else {
			alert('추가이미지는 3개까지 추가 가능합니다.');
			return;
		}
	});
	
	// 메인 이미지
	function readInputFile(input) {
		if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.readAsDataURL(input.files[0]);
		    reader.onload = function(e) {
		        $('.main_cover_layer > .preview').html("<img src=" + e.target.result + ">");
		        $('.preview-file_upload-main').replaceWith('<button type="button" class="btn-delete-main">삭제</button>');
		    }
	    }
	}
	
	// 추가 이미지
	function readInputFile_sub(input) {
		if (input.files && input.files[0]) {
		    var reader_sub = new FileReader();
		    reader_sub.readAsDataURL(input.files[0]);
		    reader_sub.onload = function(e) {
		    	$('.sub_cover_layer').before('<div class="new_cover_layer">'
		    		+ '<div class="preview"><img src=' + e.target.result + '></div>'
		    		+ '<div class="preview_underBox">'
		    		+ '<button type="button" class="btn-delete-sub" value="' + inputFileClass + '">삭제</button></div></div>');
		    	var $beforeImg = '.inp-img-sub' + $(".sub_cover_layer input[type=file]").length;
		    	inputFileClass = $(".sub_cover_layer input[type=file]").length + 1;
		    	$($beforeImg).after('<input type="file" name="sub_img' + inputFileClass + '" class="inp-img-sub' + inputFileClass + '" accept=".gif, .jpg, .png">');
		    	
		    	if (inputFileClass > 3) {
		    		$(".sub_cover_layer").css("visibility", "hidden");
		    	}
		    }
	    }
	}
	
	// 메인 이미지 삭제 ( input file reset )
	function resetMainInputFile($input, $div) {
		var agent = navigator.userAgent.toLowerCase();
		if ((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1)) {
		    // ie 일때
			$input.replaceWith($input.clone(true));
		    $div.empty();
		} else {
		    //other
			$input.val("");
		    $div.empty();
		}
	}
	
	// 추가 이미지 삭제 ( input file reset )
	function resetSubInputFile($filledInput, $emptyInput, $div) {
		var agent = navigator.userAgent.toLowerCase();
		if ((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1)) {
		    // ie 일때
		    $div.remove();
		    $filledInput.replaceWith($filledInput.clone(true));
		    $emptyInput.remove();
		} else {
		    //other
		    $div.remove();
		    $filledInput.val("");
		    $emptyInput.remove();
		}
		
		if (inputFileClass < 4) {
    		$(".sub_cover_layer").css("visibility", "visible");
    	}
	}
	
	
	// 메인 이미지 삭제 버튼
	$(document).on("click", ".btn-delete-main", function(event) {
	    var $input = $('.inp-img-main');
	    var $div = $('.main_cover_layer > .preview');
	    resetMainInputFile($input, $div);
	    $('.btn-delete-main').replaceWith('<button type="button" class="preview-file_upload-main">추가</button>');
	});      

	
	// 추가 이미지 1 삭제 버튼
	$(document).on("click", ".btn-delete-sub", function(event) {
	    var $emptyInput = $(".sub_cover_layer input[type=file]:last-child");
	    var $filledInput = $(".inp-img-sub" + $(this).attr("value"));
	    var $div = $(this).parents('.new_cover_layer');
	    resetSubInputFile($filledInput, $emptyInput, $div);
	    if ($(this).attr("value") > $(".sub_cover_layer input[type=file]").length) {
			inputFileClass = $(".sub_cover_layer input[type=file]").length;
		}else {
			inputFileClass = $(this).attr("value");
		}
	});   
	
	
	/*//////////////////  단위선택 박스 색상변경 스크립트 //////////////////*/
	// 정상 작동 : 사이드메뉴 영향을 미치니 주의
	$(document).ready(function() {
	    $("div > ul > li").each(function() {
	        $(this).click(function() {
	            $(this).addClass("selected"); 
	            $(this).siblings().removeClass("selected"); 
	        });
	    });
	});
	
	
	/*////////////////// 생년월일 input 변경 스크립트 //////////////////*/
	//생년월일 input 변경
	$(document).ready(function() {
	    $('input[name=prduct_dom_dt_ph]').focus(function() {
	        $(this).replaceWith('<input class="detail_1_input" type="date" name="prduct_dom_dt" id="byteInfo">');
	        $('input[name=prduct_dom_dt]').focus();
	    }); 
	});
});


/*////////////////// 상품명 글자수 입력 제한 스크립트 //////////////////*/
// 정상 작동
function chkword(obj, maxByte) {
    var strValue = obj.value;
    var strLen = strValue.length;
    var totalByte = 0;
    var len = 0;
    var oneChar = "";
    var str2 = "";
    for (var i = 0; i < strLen; i++) {                
        oneChar = strValue.charAt(i);// input 입력한 값을 charAt() 함수로 한자씩 분리
        if (escape(oneChar).length > 4) {
            totalByte += 3; // 아스키값이 아닌 유니코드이면 길이 2로 계산하고,
        } else {                    
            totalByte++; // 아스키값이면 1로 합니다.
        }                
        if (totalByte <= maxByte) {
            len = i + 1; // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
        }
    }
    // 넘어가는 글자는 자른다
    if (totalByte > maxByte) {
        alert("한글 " + (maxByte / 3) + "자 (영어 " + (maxByte) + " 바이트)" + "를 초과 입력 할 수 없습니다.");
        str2 = strValue.substr(0, len);
        obj.value = str2;
        chkword(obj, 4000);
    }
}

/*////////////////// input 입력되는 숫자 콤마(,) 처리 스크립트 //////////////////*/
// 정상 작동
function setComma(str) {
    str = str.replace(/,/g, '');
    if (str.length > 1) {
    	for (var i = 0; i < str.length-1; i++) {
    		if (str.charAt(i) === '0') {
    			str = str.substring(1, str.length);
    			i--;
			}else break;
		}
    }
    var retValue = "";
    if (isNaN(str) == false) {
        for (i = 1; i <= str.length; i++) {
            if (i > 1 && (i % 3) == 1)
                retValue = str.charAt(str.length - i) + "," + retValue;
            else retValue = str.charAt(str.length - i) + retValue;
        }
    } else alert("숫자만 입력 가능합니다.");
    return retValue;
}

/*////////////////// 색상선택 파트 체크박스 선택 수 제한 스크립트  //////////////////*/
// 정상 작동
function count_ck(obj){
    var chkbox = document.getElementsByName("palette_chk");
    var chkCnt = 0;            
    for(var i=0;i<chkbox.length; i++){
        if(chkbox[i].checked){
            chkCnt++;
        }
    }
    if(chkCnt > 10){
        alert("색상은 10개까지 선택하실 수 있습니다");
        obj.checked = false;
        return false;
    }
}
