$(document).on('turbolinks:load', function() {
  $('.manageable-number .increment-btn').on('click', function(event) {
    event.preventDefault();
    var component = $(this).closest('.manageable-number')
    var number = component.find('input')[0];
    var step = component.data('step');
    var maxValue = component.data('max');
    if (Number(number.value) < maxValue ) number.value = Number(number.value) + step;
  });

  $('.manageable-number .decrement-btn').on('click', function(event) {
    event.preventDefault();
    var component = $(this).closest('.manageable-number')
    var number = component.find('input')[0];
    var step = component.data('step');
    var minValue = component.data('min');
    if (Number(number.value) > minValue ) number.value = Number(number.value) - step;
  });

  $('.collapse-trigger').on('click', function() {
    var icon = $(this).find('.collapse-icon');
    if (icon.hasClass('up')) {
      icon.removeClass('up');
      icon.addClass('down');
    } else {
      icon.removeClass('down');
      icon.addClass('up');
    }
  });
});
