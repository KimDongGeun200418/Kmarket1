/**
 * 
 */
 
 $(function(){
	
	//선택
	$('input[name=all]').click(function(){
		let deleteList = $('input[name=prodNo]');
		
		if($(this).is(":checked")){
		    deleteList.prop("checked", true);
		}else{
		    deleteList.prop("checked", false);
		}
	});
	
	$('input[name=prodNo]').click(function(){
		let isAll = true;
		$("input[name=prodNo]").each(function(){
	        isAll = isAll && $(this).is(":checked");
	    });
	    $('input[name=all]').prop("checked", isAll);
	});
	
	//배송지
	$('input[name=btnSearch]').click(function(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var addr = ''; // 주소 변수
	
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	            document.getElementById('zip').value = data.zonecode;
	            document.getElementById('addr1').value = addr;
	            document.getElementById('addr2').focus();
	        }
	    }).open();
	});
	
	//포인트
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
	
	//주문버튼
	$('input[name=btnOrder]').click(function(){
		
		let orderList = [];
		let otherInfo = [];
		let i = 1;
		//제품개별 정보
		$('input[name=prodNo]').each(function(){
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
		console.log(orderList);
		if(orderList.length == 0){
			alert('구매할 상품을 선택주세요');
			return;
		}
		
		
		//delivery정보
		let deliveryInfo = [];
		let deliveryName = $('.deliveryList > tbody > tr:nth-child(1) > td:nth-child(2) > input[type=text]').val();
		let deliveryHp = $('.deliveryList > tbody > tr:nth-child(2) > td:nth-child(2) > input[type=text]').val();
		let deliveryZip = $('.deliveryList > tbody > tr:nth-child(3) > td:nth-child(2) > input[type=text]').val();
		let deliveryAddr1 = $('.deliveryList > tbody > tr:nth-child(4) > td:nth-child(2) > input[type=text]').val();
		let deliveryAddr2 = $('.deliveryList > tbody > tr:nth-child(5) > td:nth-child(2) > input[type=text]').val();
		deliveryInfo.push(deliveryName);
		deliveryInfo.push(deliveryHp);
		deliveryInfo.push(deliveryZip);
		deliveryInfo.push(deliveryAddr1);
		deliveryInfo.push(deliveryAddr2);
		otherInfo.push(deliveryInfo);
		
		//total정보
		let totalInfo = [];
		let totalCount = $('.totalList > tbody > tr:nth-child(1) > td:nth-child(2)').text();
		let totalProdPrice = $('.totalList > tbody > tr:nth-child(2) > td:nth-child(2)').text();
		let totalDiscountPrice = $('.totalList > tbody > tr:nth-child(3) > td:nth-child(2)').text();
		let totalDelivery = $('.totalList > tbody > tr:nth-child(4) > td:nth-child(2)').text();
		let totalSavePoint = $('.totalList > tbody > tr:nth-child(6) > td:nth-child(2)').text();
		let totalUsedPoint = $('.totalList > tbody > tr:nth-child(5) > td:nth-child(2)').text();
		let totalPrice = $('.totalList > tbody > tr:nth-child(7) > td:nth-child(2)').text();
		let payment = $('input[name=payment]:checked').val();
		totalInfo.push(totalCount.split(',').join(""));
		totalInfo.push(totalProdPrice.split(',').join(""));
		totalInfo.push(totalDiscountPrice.split(',').join("").replace('-', ''));
		totalInfo.push(totalDelivery.split(',').join(""));
		totalInfo.push(totalSavePoint.split(',').join(""));
		totalInfo.push(totalUsedPoint.split(',').join("").replace('-', ''));
		totalInfo.push(totalPrice.split(',').join(""));
		totalInfo.push(payment);
		otherInfo.push(totalInfo);
		
		
		
		if(confirm('결제하시겠습니까?')){
			$.redirectPost('/Kmarket1/product/completeOrder.do', orderList, otherInfo);
		}
		
	});
	
	$.extend({
	    redirectPost: function (location, args, args2) {
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
	        $.each(args2, function (key, value) {
	            let field = $('<input></input>');
	            
	            field.attr('type', 'hidden');
	            field.attr("name", 'otherInfo');
	            field.attr("value", value);
	            
	            form.append(field);
	        });
	        
	        // 위에서 생성된 폼을 제출 한다
	        $(form).appendTo('body').submit();
	    }
	});
	
});