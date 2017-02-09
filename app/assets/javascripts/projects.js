$(document).on('turbolinks:load', function() {
  $('.carousel').carousel({
    interval: false
  });

  $('[id^=carousel-selector-]').click(function() {
    var id_selector = $(this).attr("id");
    var id = id_selector.substr(id_selector.length -1);
    id = parseInt(id);
    $('#project-carousel').carousel(id);
    $('[id^=carousel-selector-]').removeClass('selected');
    $(this).addClass('selected');
  });

  $(".start-project-form .project-title input[type='text']").textcounter({
    min: 60,
    counterText: '%d/60',
    displayErrorText: false
  });

  $(".start-project-form .project-summary textarea").textcounter({
    min: 250,
    counterText: '%d/250',
    displayErrorText: false
  });

});
