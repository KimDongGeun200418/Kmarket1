/**
 * 
 */
 
 $(function(){
	
	$('input[name=all]').click(function(){
		let deleteList = $('input[name=cartNo]');
		
		if($(this).is(":checked")){
		    deleteList.prop("checked", true);
		}else{
		    deleteList.prop("checked", false);
		}
	});
	
	$('input[name=cartNo]').click(function(){
		let isAll = true;
		$("input[name=cartNo]").each(function(){
	        isAll = isAll && $(this).is(":checked");
	    });
	    $('input[name=all]').prop("checked", isAll);
	});
	
	$('input[name=del]').click(function(){
		let deleteList = [];
		$('input[name=cartNo]:checked').each(function(){
			let cartNo = $(this).val();
			deleteList.push(cartNo);
		})
		
		$.ajax({
			url:'/Kmarket1/product/deleteCart.do',
			type:'POST',
			traditional: true,
			data:{'deleteList': deleteList},
			dataType:'json',
			success:function(data){
				location.reload();
			}
		});
	});
	
	$('.orderForm').submit(function(e){
		e.preventDefault();
		let orderList = [];
		let i = 1;
		$('input[name=cartNo]').each(function(){
			if($(this).is(":checked")){
				let prodInfoList = [];
				
				let prodNo = $('.orderList tr:nth-child('+i+') td:nth-child(1) > input[type=checkbox]').val();
				let count = $('.orderList tr:nth-child('+i+') td:nth-child(3)').text();
				let price = $('.orderList tr:nth-child('+i+') td:nth-child(4)').text();
				let discount = $('.orderList tr:nth-child('+i+') td:nth-child(5)').text();
				let point = $('.orderList tr:nth-child('+i+') td:nth-child(6)').text();
				let delivery = $('.orderList tr:nth-child('+i+') td:nth-child(7)').text();
				let total = $('.orderList tr:nth-child('+i+') td:nth-child(8)').text();
				
				//orderList.push('{prodNo: '+prodNo+', count:'+count+', price:'+price+', discount:'+discount+', point:'+point+', delivery:'+delivery+', total:'+total+'}')
				prodInfoList.push(prodNo.split(',').join(""));
				prodInfoList.push(count.split(',').join(""));
				prodInfoList.push(price.split(',').join(""));
				prodInfoList.push(discount.split(',').join("").replace('%', ''));
				prodInfoList.push(point.split(',').join(""));
				prodInfoList.push(delivery.split(',').join(""));
				prodInfoList.push(total.split(',').join(""));
				orderList.push(prodInfoList);
			}
			i++;
			
		})
		
		$.ajax({
			url:'/Kmarket1/product/productOrder.do',
			type:'POST',
			traditional: true,
			data:{'orderList': orderList},
			dataType:'json',
			success:function(data){
				alert('성공');
			}
		});
	});
	
});