/**
 * 
 */
 
 $(function(){
	
	$('div.menu ul:nth-child(1) > li:nth-child(1) > a').click(function(){
		let position = $('#main > section.hit > h3 > span');
		let positionX = position.offset().left;
		let positionY = position.offset().top;
		window.scrollTo(positionX, positionY);
	});
	$('div.menu ul:nth-child(1) > li:nth-child(2) > a').click(function(){
		let position = $('#main > section.recommend > h3 > span');
		let positionX = position.offset().left;
		let positionY = position.offset().top;
		window.scrollTo(positionX, positionY);
	});
	$('div.menu ul:nth-child(1) > li:nth-child(3) > a').click(function(){
		let position = $('#main > section.new > h3 > span');
		let positionX = position.offset().left;
		let positionY = position.offset().top;
		window.scrollTo(positionX, positionY);
	});
	$('div.menu ul:nth-child(1) > li:nth-child(4) > a').click(function(){
		let position = $('#wrapper > main > aside > article > h1');
		let positionX = position.offset().left;
		let positionY = position.offset().top;
		window.scrollTo(positionX, positionY);
	});
	$('div.menu ul:nth-child(1) > li:nth-child(5) > a').click(function(){
		let position = $('#main > section.discount > h3 > span');
		let positionX = position.offset().left;
		let positionY = position.offset().top;
		window.scrollTo(positionX, positionY);
	});
	
	$('#goTop').click(function(){
		
		window.scrollTo(0,0);
		
	});

});