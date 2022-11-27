$(document).ready(function () {
  $("#trigger").click(function (e) {
    e.preventDefault();
    $(this).toggleClass("active");
    $("#mainmenu").toggleClass("active");
  });

  let bgImgs = [];
  bgImgs.push('/cocktailer/imgs/main_ex_1.jpg');
  bgImgs.push('/cocktailer/imgs/main_ex_2.jpg');
  bgImgs.push('/cocktailer/imgs/main_flavors_1.jpg');
  bgImgs.push('/cocktailer/imgs/main_rums_1.jpg');
  bgImgs.push('/cocktailer/imgs/main_rums_2.jpg');
  let index = Math.floor(Math.random() * 10) % 5;

  $("section").css("background-image","url("+bgImgs[index]+")");
});