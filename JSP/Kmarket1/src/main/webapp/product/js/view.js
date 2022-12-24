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
	
	$('.order').click(function(){
		let orderList = [];
		let prodInfoList = [];
				
		let prodNo 	= $('input[name=prodNo]').val();
		let count 	= $('input[name=num]').val();
		let price 	= $('input[name=price]').val();
		let discount= $('input[name=discount]').val();
		let point 	= $('input[name=point]').val();
		let delivery= $('input[name=delivery]').val();
		let total 	= $('div.total > span').text();
		
		//orderList.push('{prodNo: '+prodNo+', count:'+count+', price:'+price+', discount:'+discount+', point:'+point+', delivery:'+delivery+', total:'+total+'}')
		prodInfoList.push(prodNo);
		prodInfoList.push(count);
		prodInfoList.push(price);
		prodInfoList.push(discount);
		prodInfoList.push(point);
		prodInfoList.push(delivery);
		prodInfoList.push(total.split(',').join(""));
		orderList.push(prodInfoList);
		
		if(confirm('주문하시겠습니까?')){
			$.redirectPost('/Kmarket1/product/productOrder.do', orderList);
		}
	});
	
	$.extend({
	    redirectPost: function (location, args) {
	        let form = $('<form></form>');
	        form.attr("method", "post");
	        form.attr("action", location);
	        
	        // key value 형식으로 바꾼 후에 form 으로 변환
	        $.each(args, function (key, value) {
	            let field = $('<input></input>');
	            
	            field.attr('type', 'hidden');
	            field.attr("name", 'orderList');
	            field.attr("value", value);
	            
	            form.append(field);
	        });
	        
	        // 위에서 생성된 폼을 제출 한다
	        $(form).appendTo('body').submit();
	    }
	});
	
	$('#product > section > article.info > div.summary > nav:nth-child(4) > h5 > a').click(function(){
		let location = document.querySelector("#product > section > article.review > nav > h1").offsetTop;
		window.scrollTo({top:location, behavior:'smooth'});
	});
	 
 });