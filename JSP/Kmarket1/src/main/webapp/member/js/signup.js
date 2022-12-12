/*
 * 
 */
 
let checkTerms = false;
let checkFinance = false;
let checkPrivacy = false;
let checkLocation = false;

$(function(){
	
	$('.agree').click(function(){
		checkTerms =  $('input[name=agreeTerms]').is(':checked');
		checkFinance =  $('input[name=agreeFinance]').is(':checked');
		checkPrivacy =  $('input[name=agreePrivacy]').is(':checked');
		checkLocation =  $('input[name=agreeLocation]').is(':checked');
		let type = $('input[name=type]').val();
		
		if(checkTerms != true){
			alert('케이마켓 이용약관에 동의해주세요.');
			$('input[name=agreeTerms]').focus();
			return;
		}else if (checkFinance != true){
			alert('전자금융거래약관에 동의해주세요.');
			$('input[name=agreeFinance]').focus();
			return;
		}else if (checkPrivacy != true){
			alert('개인정보 수집에 동의해주세요.');
			$('input[name=agreePrivacy]').focus();
			return;
		}
		
		$.ajax({
			url: '/Kmarket1/member/signup.do',
			method: 'POST',
			data: {"provLocation": checkLocation, "type": type},
			dataType: 'json',
			success: function(data){
				location.href="/Kmarket1/member/"+data.url;
			}
		});
		
		
	});
});