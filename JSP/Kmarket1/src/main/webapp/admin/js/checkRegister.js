/**
 * 
 */
 
$(function(){
	
	$('#admin-product-register form').submit(function(){
		
		//카테고리
		if($('#selectCate1 option:selected').val() == 99){
			alert('1차 분류를 선택해주세요.');
			$('#selectCate1').focus();
			return false;
		}
		if($('#selectCate2 option:selected').val() == 99){
			alert('2차 분류를 선택해주세요.');
			$('#selectCate2').focus();
			return false;
		}
		//기본정보
		if($('input[name=prodName]').val() == ''){
			alert('상품명을 입력해주세요.');
			$('input[name=prodName]').focus();
			return false;
		}
		if($('input[name=company]').val() == ''){
			alert('제조사를 입력해주세요.');
			$('input[name=company]').focus();
			return false;
		}
		if($('input[name=price]').val() == ''){
			alert('판매가격을 입력해주세요.');
			return false;
		}else if(isNaN($('input[name=price]').val())){
			alert('숫자만 입력해주세요.');
			return false;
		}else if ((Number($('input[name=price]').val()) < 1)){
			alert('올바른 값을 입력해주세요.');
			return false;
		}
		if($('input[name=discount]').val() == ''){
			alert('0~100사이의 값을 입력해주세요.');
			return false;
		}else if(isNaN($('input[name=discount]').val())){
			alert('숫자만 입력해주세요.');
			return false;
		}else if ((Number($('input[name=discount]').val()) < 0 || 100 < Number($('input[name=discount]').val()))){
			alert('0~100사이의 값을 입력해주세요.');
			return false;
		}
		
		//이미지 확장자명
		let t1 = $('input[name=thumb1]').val();
		let t2 = $('input[name=thumb2]').val();
		let t3 = $('input[name=thumb3]').val();
		let de = $('input[name=detail]').val();
		if(!(t1.substr(t1.length-3) == 'jpg' || t1.substr(t1.length-4) == 'jpeg' || t1.substr(t1.length-3) == 'png')){
			alert('jpg(jpeg)/png파일만 올릴 수 있습니다.');
		}
		if(!(t2.substr(t2.length-3) == 'jpg' || t2.substr(t2.length-4) == 'jpeg' || t2.substr(t2.length-3) == 'png')){
			alert('jpg(jpeg)/png파일만 올릴 수 있습니다.');
		}
		if(!(t3.substr(t3.length-3) == 'jpg' || t3.substr(t3.length-4) == 'jpeg' || t3.substr(t3.length-3) == 'png')){
			alert('jpg(jpeg)/png파일만 올릴 수 있습니다.');
		}
		if(!(de.substr(de.length-3) == 'jpg' || de.substr(de.length-4) == 'jpeg' || de.substr(de.length-3) == 'png')){
			alert('jpg(jpeg)/png파일만 올릴 수 있습니다.');
		} 
	});
	
	//포인트 자동입력, 숫자검사
	$('input[name=price]').focusout(function(){
		if(isNaN($('input[name=price]').val())){
			return;
		}
		let price = Number($('input[name=price]').val())/10;
		$('input[name=point]').attr('value', parseInt(price));
		
	});
	
});