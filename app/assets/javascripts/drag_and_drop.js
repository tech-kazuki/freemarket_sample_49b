$(document).on('turbolinks:load', function() {
  var dropBox = document.getElementById('drop_box');
  var input = document.getElementById('file_input');
  var textBox = document.getElementById('text_field');
  
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
                              <a href="" class="delete_link">削除</a>
                              </div>`);
    }
    
    function getImage(imageURL) {
      $('.drop_area').prepend(`<div class="drop_area__image_box">
                              <div class="drop_content">
                                <img src="${imageURL}" class="drop_content__img" style="">
                              </div>
                            <a href="" class="delete_link">削除</a>
                            </div>`);
    }

    dropBox.addEventListener('dragover', function(e) {
      e.preventDefault();

      e.dataTransfer.dropEffect = 'copy';
    }, false);
    
    dropBox.addEventListener('dragleave', function () {
    }, false);
    
    dropBox.addEventListener('drop', function (e) {
      e.preventDefault();
      
      organizeFiles(e.dataTransfer.files);
    }, false);
    
    $('#file_input').on('change', function(e){
      e.preventDefault();
      var imgs = e.target.files;
      for (var j = 0; j < imgs.length; j++) {
        textBox.value = imgs[j];
        var imgURL = URL.createObjectURL(imgs[j]);
        getImage(imgURL);
      }
    });
    
    $('.products_new_container__content__title').on('click', function(){
    });
    
    $('#drop_box').on('click', function () {
      $('#file_input').click();
    });
  }
});
