$(document).on('turbolinks:load', function() {
  $('.country-select').selectize();

  $('.category-multi-select').selectize({
    maxItems: 3,
    labelField: 'name',
    valueField: 'id',
    searchField: 'name',
    options: [],
    plugins: ['remove_button'],
    preload: true,
    persist: false,
    render: {
      item: function(item, escape) {
        return "<div class='select-image-item'>&nbsp;<span>" + escape(item.name) + "</span></div>";
      },
      option: function(item, escape) {
        return "<div class='select-image-option'><div class='option-icon icon-" + escape(item.icon) + "' alt='icon' />&nbsp;<span>" + escape(item.name) + "</span></div>";
      }
    }
  });

  $('.category-single-select').selectize({
    labelField: 'name',
    valueField: 'id',
    searchField: 'name',
    options: [],
    plugins: ['remove_button'],
    preload: true,
    persist: false,
    render: {
      option: function(item, escape) {
        return "<div class='select-image-option'><div class='option-icon icon-" + escape(item.icon) + "' alt='icon' />&nbsp;<span>" + escape(item.name) + "</span></div>";
      }
    }
  });
});
