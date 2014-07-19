$(document).ready(function(){
	var hidden = 0;
	$('body').on('mousewheel', function(event) {
		if ( ($(document).scrollTop() == 0) && hidden ){
			  $('#logo').slideDown('fast');
        hidden = 0;
				}
		if ((!hidden) && ($(document).scrollTop() != 0)){
			$('#logo').slideUp('fast');
			event.preventDefault();
			event.stopPropagation();
			hidden=1;
			return;
		}
	});


})