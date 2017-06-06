//   $(document).ready(function()
//   //Set Down Arrow Button
//   $('#scrollDownArrow').click(function(e) {
//     e.preventDefault();
//     jQuery.scrollTo(".supporting", 1000);
//   });
// });

$('.input').keypress(function (e) {
  if (e.which == 13) {
    $('form#login').submit();
    return false;    //<---- Add this line
  }
});
