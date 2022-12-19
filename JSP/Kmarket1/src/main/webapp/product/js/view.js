/**
 * 
 */

 $(function(){
	
	$('.cart').click(function(){
		
		
		let uid = $('input[name=uid]').val();
		let prodNo = $('input[name=prodNo]').val();
		let count =  $('.count > input[name=num]').val();
		let total =  $('.total > span').text();
		total = total.split(',').join("");
		
		$.ajax({
			url: '/Kmarket1/product/addCart.do',
			method: 'POST',
			data: {"prodNo": prodNo, "uid": uid, "count": count, "total": total},
			dataType: 'json',
			success: function(data){
				
				alert('장바구니에 추가되었습니다.');
				location.href="/Kmarket1/product/productCart.do"
			}
		});
		
	});
	 
 });