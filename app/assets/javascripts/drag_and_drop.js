$(document).on('turbolinks:load', function() {
  var dropBox = document.getElementById('drop_box');
  
  if (dropBox) {
    
    function organizeFiles(files) {
      var length = files.length;
      var file;
      for (var i = 0; i < length; i++) {
        file = files[i];
          
        outputImage(file);
      }
    }
    
    function outputImage(file) {
      var blobURL = URL.createObjectURL(file);
      $('.drop_area').prepend(`<div class="drop_area__image_box">
                                <div class="drop_content">
                                  <img src="${blobURL}" class="drop_content__img" style="">
                                </div>
                              <div class="delete_link">削除</div>
                              </div>`);
    }
    
    function getImage(imageURL) {
      $('.drop_area').prepend(`<div class="drop_area__image_box">
                              <div class="drop_content">
                                <img src="${imageURL}" class="drop_content__img" style="">
                              </div>
                              <div class="delete_link">削除</div>
                            </div>`);
    }

    dropBox.addEventListener('dragover', function(e) {
      e.preventDefault();
      
      $(this).addClass("dragover");

      e.dataTransfer.dropEffect = 'copy';
    }, false);
    
    dropBox.addEventListener('dragleave', function (e) {
      e.preventDefault();
      $(this).removeClass("dragover");
    }, false);
    
    dropBox.addEventListener('drop', function (e) {
      e.preventDefault();
      $(this).removeClass("dragover");
      
      organizeFiles(e.dataTransfer.files);
    }, false);
    
    $(document).on('change', '#file_input', function(e){
      e.preventDefault();
      var imgs = e.target.files;
      for (var j = 0; j < imgs.length; j++) {
        var imgURL = URL.createObjectURL(imgs[j]);
        getImage(imgURL);
      }
    });
    
    $(document).on('click', '.delete_link', function(){
      $('#file_input').remove();
      $('.drop_area__image_box').remove();
      $('.drop_area').append(`<input id="file_input" class="file_input" type="file" name="product[images_attributes][0][image]">`);
    })
    
    $('.products_new_container__content__title').on('click', function(){
    });
    
    $('#drop_box').on('click', function () {
      $('#file_input').click();
    });
  }
});
