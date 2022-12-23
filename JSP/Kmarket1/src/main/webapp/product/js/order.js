/**
 * 
 */
 
 $(function(){
	
	$('input[name=point]').focusout(function(){
		let userPoint = Number($('#product > section > form > article.discount > div > p > span').text());
		if($(this).val() > userPoint){
			console.log(userPoint);
			$('input[name=point]').val(userPoint);
		}
	});
	
	$('input[name=apply]').click(function(){
		
		let usePoint = Number($('input[name=point]').val());
		if(usePoint < 5000){
			alert('5000원 이상인 경우에만 사용 가능합니다.');
			return;
		}else{
			let price = $('#product > section > form > div > table > tbody > tr:nth-child(2) > td:nth-child(2)').text().split(',').join('');
			let discount = $('#product > section > form > div > table > tbody > tr:nth-child(3) > td:nth-child(2)').text().split(',').join('').replace('-','');
			let delivery = $('#product > section > form > div > table > tbody > tr:nth-child(4) > td:nth-child(2)').text().split(',').join('');
			let total = Number(price) - Number(discount) + Number(delivery) - usePoint;
			$('#product > section > form > div > table > tbody > tr:nth-child(5) > td:nth-child(2)').text('-' + usePoint.toLocaleString());
			$('#product > section > form > div > table > tbody > tr:nth-child(7) > td:nth-child(2)').text(total.toLocaleString());
		}
		
	});
	
});