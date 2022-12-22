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
	
});