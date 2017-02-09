$(document).on('turbolinks:load', function() {
  $(document.body).on('click', '.opportunity-item .close-btn', function(event) {
    event.preventDefault();
    $(this).closest('.expanded-content').slideUp('fast');
    $(this).closest('.opportunity-item').find('.opportunity-image .action').show();
  });

  $(document.body).on('click', '.opportunity-item .apply-btn', function(event) {
    event.preventDefault();
    $(this).closest('.action').hide();
    $(this).closest('.opportunity-item').find('.expanded-content').slideDown('fast');
  });

  $(document.body).on('click', '.comission.manageable-number', function() {
    var comission = $(this).find('#comission').val();
    var ticketsNumber;
    switch (comission) {
      case '70':
        ticketsNumber = 6;
        break;
      case '75':
        ticketsNumber = 3;
        break;
      case '80':
        ticketsNumber = 1;
        break;
    }
    $('.tickets-number').html(ticketsNumber)
  });
});
