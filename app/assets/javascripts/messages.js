$(document ).ready(function() {

  $("#msg-body").on("keypress", function(e) {
    if (e && e.keyCode === 13) {
      e.preventDefault();
      $(this).submit();
    }
  });

  $("form#dialect-form").on('change', function(e){
    $(this).closest('form')
           .trigger('submit');

    $("#message_dialect").val($("#dialect").val());

  })
})
