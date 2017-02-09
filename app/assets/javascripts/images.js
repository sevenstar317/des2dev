Dropzone.autoDiscover = false;
$(document).on('turbolinks:load', function() {

  // grap our upload form by its id
  $("#dropzone-upload").dropzone({
    // restrict image size to a maximum 1MB
    maxFilesize: 5,

    // changed the passed param to one accepted by our rails app
    paramName: 'images_attributes[]',
    uploadMultiple: true,

    // show remove links on each image upload
    // addRemoveLinks: true,
    clickable: ".dropzone-previews",
    previewsContainer: ".dropzone-previews",
    // dictDefaultMessage: "<h1>hello<h1>",
    // autoProcessQueue: false,
    parallelUploads: 5,
    maxFiles: 10,

     // The setting up of the dropzone
    init: function() {
      var myDropzone = this;

      // First change the button to actually tell Dropzone to process the queue.
      // this.element.querySelector("button[type=submit]").addEventListener("click", function(e) {
      //   // Make sure that the form isn't actually being sent.
      //   e.preventDefault();
      //   e.stopPropagation();
      //   myDropzone.processQueue();
      // });
      this.on('addedfile', function(event) {
        $('.upload-file').hide();
      });

      // Listen to the sendingmultiple event. In this case, it's the sendingmultiple event instead
      // of the sending event because uploadMultiple is set to true.
      this.on("sendingmultiple", function() {
        // Gets triggered when the form is actually being sent.
        // Hide the success button or the complete form.
      });
      this.on("successmultiple", function(files, response) {
        // Gets triggered when the files have successfully been sent.
        // Redirect user or notify of success.
      });
      this.on("errormultiple", function(files, response) {
        // Gets triggered when there was an error sending the files.
        // Maybe show form again, and notify user of error
      });
  }




  });

  // $('#link-for-upload-input').click(function(e) {
  //   e.preventDefault();
  //   $('#file-upload-input').click();
  // });

  // $("#upload-image").fileupload({
  //   add: function (e, data) {
  //     data.context = $('<button/>').text('Upload')
  //       .appendTo(document.body)
  //       .click(function () {
  //         data.context = $('<p/>').text('Uploading...').replaceAll($(this));
  //         // data.submit();
  //       });
  //   }
  // });
  //
  // if ($('#upload-dropzone').length) {
  //   console.log(1)
  //   $("div#upload-dropzone").dropzone({ url: "/file/post" });
  //   // other code here
  // }


});
