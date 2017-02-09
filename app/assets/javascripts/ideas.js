$(document).on('turbolinks:load', function() {

  $(".idea-pricing .calculation-items input[type='checkbox']").on('change', function() {
    calculateIdeaTotalSums();
    updateIdeaScreensPrice();
    calculateIdeaTotalSums();
  }).change();

  $(".idea-pricing .screens input[type='text']").on('input', function() {
    updateIdeaScreensPrice();
    calculateIdeaTotalSums();
  });

  function calculateIdeaTotalSums() {
    var logo = getCheckboxPrice('.logo');
    var icon = getCheckboxPrice('.icon');
    var screens = getCheckboxPrice('.screens');
    var flow = getCheckboxPrice('.flow');
    var expert =  getCheckboxPrice('.expert');

    var subtotal = logo + icon + screens + flow + expert;
    var discount = getIdeaDiscountPercentage() / 100 * subtotal;
    var grandTotal = subtotal - discount;

    $('.subtotal .value').html('$' + subtotal.toFixed(2));
    $('.discount .value').html('$' + discount.toFixed(2));
    $('.grand-total .value').html('$' + grandTotal.toFixed(2));
  }

  function updateIdeaScreensPrice() {
    var number = Number($(".screens input[type='text']").val());
    var price;
    switch (true) {
      case number < 5: price = number * 119;
      break;
      case number === 5: price = 499;
      break;
      case number > 5 && number < 10: price = 499 + 89 * (number - 5);
      break;
      case number >= 10: price = 855 + 49 * (number - 9);
      break;
    }
    $('.screens .price').text(price);
  }

  function getIdeaDiscountPercentage() {
    var count = $(".idea-pricing .calculation-items input[type='checkbox']:checked").length
    var discount;
    switch (count) {
      case 2: discount = 5;
      break;
      case 3: discount = 10;
      break;
      case 4: discount = 15;
      break;
      case 5: discount = 20;
      break;
      default: discount = 0;
    }
    $('.idea-pricing .discount-percentage').text(discount);
    return discount;
  }

  function getCheckboxPrice(className) {
    if ($(className + " input[type='checkbox']").is(':checked')) {
      return Number($(className + ' .price').text());
    }
    return 0;
  }

  $(".idea-brief .title input[type='text']").textcounter({
    min: 60,
    counterText: '%d/60',
    displayErrorText: false
  });

  $(".idea-brief .description textarea").textcounter({
    min: 250,
    counterText: '%d/250',
    displayErrorText: false
  });
});
