$(document).on('turbolinks:load', function() {
  $('.project-item .description').on('click', function() {
    expandProjectItem($(this).closest('.project-item'));
  });

  $('.project-item .project-image').on('click', function() {
    expandProjectItem($(this).closest('.project-item'));
  });

  function expandProjectItem(projectItem) {
    var description = projectItem.find('.description');
    var currentImage = projectItem.find('.project-image');
    var largeImage = projectItem.find('.project-image-lg');
    var developersButton = projectItem.find('.developers-button');
    var supporProject = projectItem.find('.support-project');

    currentImage.hide();
    developersButton.hide();
    largeImage.show();
    supporProject.show();
    description.addClass('expanded');
  }
});
