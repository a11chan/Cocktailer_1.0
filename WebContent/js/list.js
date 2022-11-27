$(document).ready(function() {
	$("#trigger").click(function(e) {
		e.preventDefault();
		$(this).toggleClass("active");
		$("#mainmenu").toggleClass("active");
	});
	
	if ( $(window).width() < 660) {
		$(".table").addClass("table-sm")
		$(".btn-group").addClass("btn-group-sm")
	} else {
		$(".table").removeClass("table-sm")
		$(".btn-group").removeClass("btn-group-sm")
	};

	$(window).resize(function() {
		if ( $(window).width() < 660 ) {
			$(".table").addClass("table-sm")
			$(".btn-group").addClass("btn-group-sm")
		} else {
			$(".table").removeClass("table-sm")
			$(".btn-group").removeClass("btn-group-sm")
		}
	});
	
});