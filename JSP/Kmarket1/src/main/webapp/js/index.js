/**
 * 
 */
 
 $(function(){
	$('div.menu ul:nth-child(1) > li:nth-child(1) > a').click(function(){
		let location = document.querySelector("#main > section.hit > h3 > span").offsetTop;
		window.scrollTo({top:location, behavior:'smooth'});
	});
	$('div.menu ul:nth-child(1) > li:nth-child(2) > a').click(function(){
		let location = document.querySelector("#main > section.recommend > h3 > span").offsetTop;
		window.scrollTo({top:location, behavior:'smooth'});
	});
	$('div.menu ul:nth-child(1) > li:nth-child(3) > a').click(function(){
		let location = document.querySelector("#main > section.new > h3 > span").offsetTop;
		window.scrollTo({top:location, behavior:'smooth'});
	});
	$('div.menu ul:nth-child(1) > li:nth-child(4) > a').click(function(){
		let location = document.querySelector("#wrapper > main > aside > article > h1").offsetTop;
		window.scrollTo({top:location, behavior:'smooth'});
	});
	$('div.menu ul:nth-child(1) > li:nth-child(5) > a').click(function(){
		let location = document.querySelector("#main > section.discount > h3 > span").offsetTop;
		window.scrollTo({top:location, behavior:'smooth'});
	});
	
	$('#goTop').click(function(){
		window.scrollTo(0,0);
	});

});