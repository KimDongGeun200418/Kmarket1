/*
 * 
 */

$(function(){
	$('input[name=km_zip]').click(function(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var addr = ''; // 주소 변수
	
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	            document.getElementById('km_zip').value = data.zonecode;
	            document.getElementById('km_addr1').value = addr;
	            document.getElementById('km_addr2').focus();
	        }
	    }).open();
	});
});