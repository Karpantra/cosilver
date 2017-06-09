$(function(){
  var target = location.hash;
  if ( target != "") {
    $(".tab").removeClass('active');
    $("a[data-target='" + target + "']").addClass('active');
    $(".tab-content").addClass('hidden');
    $(target).removeClass('hidden');
  };
  $(".tab").on("click", function(e){
    // Change active tab
    $(".tab").removeClass('active');
    $(this).addClass('active');
    location.hash =  $(this).data('target'); // Hide all tab-content (use class="hidden")
    $(".tab-content").addClass('hidden');
    // Show target tab-content (use class="hidden")
    $($(this).data('target')).removeClass('hidden');
  });
});
