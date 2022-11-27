$(function() {
	$.fn.navBarMenuTrigger = function(){
		$("#trigger").click(function(e) {
			e.preventDefault();
			$(this).toggleClass("active");
			$("#mainmenu").toggleClass("active");
		});
	};
	$.fn.navBarMenuTrigger();
	
	
	$.fn.hidePickedItemAndTasteName = function(){
		let pickedItem = $(".itemShowcase > .itemBox");
		let pickedTasteName = $(".pickedBox > div > label");
		let allChevron = $(".chevron");
		pickedItem.hide();
		pickedTasteName.hide();
		allChevron.hide();
	};
	$.fn.hidePickedItemAndTasteName();
	
	
	let pickedItemSelector;
	$.fn.makePickedItemSelector = function(){
		let pickedItemClassName = [];
		
		tasteName.filter(":checked").each(function() {
			pickedItemClassName.push("." + $(this).val());
		});
		pickedItemSelector = pickedItemClassName.join(", ");
	};
	$.fn.showNoseChevron = function(){
		let noseChevron = $(".pickedBox > .toLeft1, .pickedBox > .toRight1");
		if (pickedItemSelector.match(".n_")) {
			noseChevron.show()
		} else {
			noseChevron.fadeOut();
		}
	};
	$.fn.showPalateChevron = function(){
		let palateChevron = $(".pickedBox > .toLeft2, .pickedBox > .toRight2");
		if (pickedItemSelector.match(".p_")) {
			palateChevron.show()
		} else {
			palateChevron.fadeOut();
		}
	};
	$.fn.showFinishChevron = function(){
		let finishChevron = $(".pickedBox > .toLeft3, .pickedBox > .toRight3");
		if (pickedItemSelector.match(".f_")) {
			finishChevron.show()
		} else {
			finishChevron.fadeOut();
		}
	};
	$.fn.showTypeChevron = function(){
		let typeChevron = $(".pickedBox > .toLeft4, .pickedBox > .toRight4");
		if (pickedItemSelector.match(".t_")) {
			typeChevron.show()
		} else {
			typeChevron.fadeOut();
		}
	};
	$.fn.clearForm = function(){
		if (pickedItemSelector == "") {
			$(".chevron").fadeOut();
			$(".itemShowcase").fadeOut();
		}
	};
	
	let tasteName = $(".submenu input");
	tasteName.click(function(){
		$.fn.makePickedItemSelector();
		$.fn.hidePickedItemAndTasteName();
		$(pickedItemSelector).show();
		$.fn.showNoseChevron();
		$.fn.showPalateChevron();
		$.fn.showFinishChevron();
		$.fn.showTypeChevron();
		$.fn.clearForm();
	});
		
	
	$.fn.applyRadioBtnEffect = function(){
		this.click(function(){
			$('input[name="taste"]').not(this).prop("checked", false);
		});
	};
	$("#noseBtn").applyRadioBtnEffect();
	$("#palateBtn").applyRadioBtnEffect();
	$("#finishBtn").applyRadioBtnEffect();
	$("#typeBtn").applyRadioBtnEffect();
	
	
	$.fn.scrollLeft = function(){
		$(this).click(function(){
			$(this).siblings().first().animate({scrollLeft : "-=100"}, 30);
		});
	};
	$.fn.scrollRight = function(){
		$(this).click(function(){
			$(this).siblings().first().animate({scrollLeft : "+=100"}, 30);
		});
	};
	$(".toLeft1").scrollLeft();
	$(".toLeft2").scrollLeft();
	$(".toLeft3").scrollLeft();
	$(".toLeft4").scrollLeft();
	$(".toRight1").scrollRight();
	$(".toRight2").scrollRight();
	$(".toRight3").scrollRight();
	$(".toRight4").scrollRight();
	
	
	$(".itemShowcase").hide();
	$.fn.ToggleSearchBtn = function(){
		$("#searchBtn").click(function() {
			if (!pickedItemSelector) {
				alert("찾을 조건을 선택해주세요.");
				return false;
			} else $(".itemShowcase").fadeToggle();
		});
	};
	$.fn.ToggleSearchBtn();
	
});

function readyAlert( ) {
	alert("서비스 준비중입니다.");
}