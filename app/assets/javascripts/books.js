var ready = function() {
	$('#FontSize a').click(function() {
		$('.content').css("font-size", this.dataset.size);
	});

	$('#FontFamily a').click(function(){
		$('.content').css("font-family", this.innerHTML);
	});

	$('#Leading a').click(function(){
		$('.content').css("line-height", this.dataset.spacing);
	});

	$('#Background a').click(function() {
		$('body').css("background-color", $(this).css('background-color'));
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);
