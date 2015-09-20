// http://www.quirksmode.org/js/cookies.html
function createCookie(name, value, days) {
	var expires;

	if (days) {
		var date = new Date();
		date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
		expires = "; expires=" + date.toGMTString();
	} else {
		expires = "";
	}
	document.cookie = encodeURIComponent(name) + "=" + encodeURIComponent(value) + expires + "; path=/";
}

function readCookie(name) {
	var nameEQ = encodeURIComponent(name) + "=";
	var ca = document.cookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) === ' ') c = c.substring(1, c.length);
		if (c.indexOf(nameEQ) === 0) return decodeURIComponent(c.substring(nameEQ.length, c.length));
	}
	return null;
}

var ready = function() {
	var size = readCookie('font-size');
	var family = readCookie('font-family');
	var height = readCookie('line-height');
	var background = readCookie('background');

	if (size) $('.content').css("font-size", size);
	if (family) $('.content').css("font-family", family);
	if (height) $('.content').css("line-height", height);
	if (background) $('body').css("background-color", background);

	$('#FontSize a').click(function() {
		$('.content').css("font-size", this.dataset.size);
		createCookie('font-size', this.dataset.size);
		return false;
	});

	$('#FontFamily a').click(function(){
		$('.content').css("font-family", this.innerHTML);
		createCookie('font-family', this.innerHTML);
		return false;
	});

	$('#Leading a').click(function(){
		$('.content').css("line-height", this.dataset.spacing);
		createCookie('line-height', this.dataset.spacing);
		return false;
	});

	$('#Background a').click(function() {
		$('body').css("background-color", $(this).css('background-color'));
		createCookie('background', $(this).css('background-color'));
		return false;
	});

	$('#AddBook').click(function() {
		$('#File').trigger('click');
		return false;
	});
	$('#File').change(function() {
		$('#Form').submit();
	});

	var offset = $(".left-bar").offset().top - 12;
	$w = $(window).scroll(function() {
		if ($w.scrollTop() > offset) {
			$('.left-bar').css({position: 'fixed', left: '10px', top: '10px'});
			$('.right-bar').css({position: 'fixed', right: '10px', top: '10px'});
		} else {
			$('.left-bar').css({position: 'static'});
			$('.right-bar').css({position: 'static'});
		}
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);
$(document).keydown(function(e) {
	if (e.which === 37) {
		$('#Previous')[0].click();
	} else if (e.which === 39) {
		$('#Next')[0].click();
	}
});
