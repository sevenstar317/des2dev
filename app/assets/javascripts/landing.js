$(document).on('turbolinks:load', function() {
  $('.center-intro-text-image').on({
    mouseenter: function() {
      $('.center-intro').slideUp('slow');
      $('.center-links-holder').slideDown('slow');
    }
  });

  $('.landing-center-line').on({
    mouseleave: function() {
      $('.center-intro').slideDown('slow');
      $('.center-links-holder').slideUp('slow');
    }
  });
});
