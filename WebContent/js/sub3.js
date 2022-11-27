$(document).ready(function () {
  $("#trigger").click(function (e) {
    e.preventDefault();
    $(this).toggleClass("active");
    $("#mainmenu").toggleClass("active");
  });

  /* 탭메뉴*/
  $("ul.tabs li").click(function () {
    var tab_id = $(this).attr("data-tab");

    $("ul.tabs li").removeClass("current");
    $(".tab-content").removeClass("current");

    $(this).addClass("current");
    $("#" + tab_id).addClass("current");
  });

  if($(window).width()<660){
    $(".app-form div.radioBox").addClass("btn-group-vertical")
    $(".app-form div.inputSet").addClass("input-group")
    $(".app-form div.sendSet").addClass("d-grid gap-2")
  } else {
    $(".app-form div.radioBox").removeClass("btn-group-vertical")
    $(".app-form div.inputSet").removeClass("input-group")
    $(".app-form div.sendSet").removeClass("d-grid gap-2")
    $(".app-form div.inputSet1").addClass("input-group")
    $(".app-form div.inputSet2").addClass("input-group")
    $(".app-form div.inputSet3").addClass("input-group")
    $(".app-form div.sendSet").addClass("input-group")
  };

  $(window).resize(function() {
    if($(window).width()<660){
      $(".app-form div.radioBox").addClass("btn-group-vertical")
      $(".app-form div.inputSet").addClass("input-group")
      $(".app-form div.sendSet").addClass("d-grid gap-2")
    } else {
      $(".app-form div.radioBox").removeClass("btn-group-vertical")
      $(".app-form div.inputSet").removeClass("input-group")
      $(".app-form div.sendSet").removeClass("d-grid gap-2")
      $(".app-form div.inputSet1").addClass("input-group")
      $(".app-form div.inputSet2").addClass("input-group")
      $(".app-form div.inputSet3").addClass("input-group")
      $(".app-form div.sendSet").addClass("input-group")
    }
  });

});
