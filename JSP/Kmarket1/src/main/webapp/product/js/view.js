/**
 * 
 */

 $(function(){
	
	$('.increase').click(function(){
		let amount = parseInt($('input[name=num]').val());
		let price = parseInt($('div.dis_price > ins').text().split(',').join(""));
		$('input[name=num]').attr('value', amount+1);
		amount = parseInt($('input[name=num]').val());
		let total = amount*price;

		$('div.total > span').text(total.toLocaleString());
		
	});
	
	$('.decrease').click(function(){
		let amount = parseInt($('input[name=num]').val());
		if(amount<=1){ return; }
		let price = parseInt($('div.dis_price > ins').text().split(',').join(""));
		$('input[name=num]').attr('value', amount-1);
		amount = parseInt($('input[name=num]').val());
		let total = amount*price;

		$('div.total > span').text(total.toLocaleString());
	});

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
			error: function() {
          		alert('이미 장바구니에 있는 상품입니다.');
        	},
			success: function(data){
				if(confirm('장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?')){
					location.href="/Kmarket1/product/productCart.do"
				}
			}
		});
	});
	
	$('#product > section > article.info > div.summary > nav:nth-child(4) > h5 > a').click(function(){
		let location = document.querySelector("#product > section > article.review > nav > h1").offsetTop;
		window.scrollTo({top:location, behavior:'smooth'});
	});
	 
 });