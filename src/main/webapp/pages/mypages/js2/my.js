$(document).ready(function(){

/* News Toggler */
	$(function(){
		$(".collapsible-content").hide();
		$('.news-trigger').toggle(
			function() {
				$(this).toggleClass("opened").parent().next().slideDown();
				$(this).html('Collapse <img src="/spider/pages/mypages/imgs/button-arrow-up.png" alt="" class="collapse-arrow-up">');
			},
			function() {
				$(this).toggleClass("opened").parent().next().slideUp();
				$(this).html('Read More...');
			}
		);
	});
	/* End News Toggler */
	/* Zoom Icon */
	$(function(){
		$(".zoom a").append("<span></span>");
		$(".zoom a").hover(function(){
			$(this).children("img").stop(true, true).animate({opacity:0.7},300);
			$(this).children("span").stop(true, true).fadeIn(300);
		},function(){
			$(this).children("img").stop(true, true).animate({opacity:1},250);
			$(this).children("span").stop(true, true).fadeOut(250);
		});
	});
	/* End Zoom Icon */
	
});


