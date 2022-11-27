$(document).ready(function() {
	$("#trigger").click(function(e) {
		e.preventDefault();
		$(this).toggleClass("active");
		$("#mainmenu").toggleClass("active");
	});
	
});