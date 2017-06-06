$(function() {
  $('#new_service #datepicker').datepicker({
    format: "dd/mm/yyyy",
    weekStart: 1,
    multidate: true,
    beforeShowDay:
      function(date)
      {

      }
  });

  $('#datepicker').on('changeDate', function() {
    $('#my_hidden_input').val(
        $('#datepicker').datepicker('getFormattedDate')
    );
  });
});

