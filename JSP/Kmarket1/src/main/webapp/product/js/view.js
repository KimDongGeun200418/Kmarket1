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
		let price = parseInt($('div.dis_price > ins').text().split(',').join(""));
		if(amount<=1){ return; }
		$('input[name=num]').attr('value', amount-1);
		amount = parseInt($('input[name=num]').val());
		let total = amount*price;

		$('div.total > span').text(total.toLocaleString());
	});

	$('input[name=num]').change(function(){
		let amount = parseInt($('input[name=num]').val());
		let price = parseInt($('div.dis_price > ins').val());
		alert(price);
		
	});

	
	$('.cart').click(function(){
		
		
		let uid = $('input[name=uid]').val();
		let prodNo = $('input[name=prodNo]').val();
		let count =  $('.count > input[name=num]').val();
		let total =  $('.total > span').text();
		total = total.split(',').join("");
		
		$.ajax({
			url: '/Kmarket1/product/addCart.do',
			method: 'GET',
			data: {"prodNo": prodNo, "uid": uid, "count": count, "total": total},
			dataType: 'json',
			success: function(data){
				alert('장바구니에 추가되었습니다.');
				location.href="/Kmarket1/product/productCart.do"
			}
		});
	});
	
	$('#product > section > article.info > div.summary > nav:nth-child(4) > h5 > a').click(function(){
		let location = document.querySelector("#product > section > article.review > nav > h1").offsetTop;
		window.scrollTo({top:location, behavior:'smooth'});
	});
	 
 });