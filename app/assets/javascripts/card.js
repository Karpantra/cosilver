$(document).ready(function() {
  $('.card').hover(function() {
    $(this).find('.description').stop().animate({
      height: "toggle",
      opacity: "toggle"
    }, 200);
  });
});
