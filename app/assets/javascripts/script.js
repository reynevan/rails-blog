$(document).ready(function(){
	var hidden = 0;
	$('body').on('mousewheel', function(event) {
		event.preventDefault();
		event.stopPropagation();
		if ( ($(document).scrollTop() == 0) && hidden ){
			  $('#logo').slideDown('fast');
        hidden = 0;
				}
		if ( (!hidden) && ($(document).scrollTop() != 0)){
			$('#logo').slideUp('fast');
			hidden=1;
			return;
		}
	});


})