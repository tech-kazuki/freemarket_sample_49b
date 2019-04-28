$(document).on('turbolinks:load', function() {
  let dropBox = document.getElementById('drop_box');
  
  if (dropBox) {
    dropBox.addEventListener('dragover', function(e) {
      e.preventDefault();
      
      e.dataTransfer.dropEffect = 'copy';
    });
    
    dropBox.addEventListener('dragleave', function () {
    });
    
    dropBox.addEventListener('drop', function (e) {
      e.preventDefault();
      let imageData = e.dataTransfer.getData('copy');
      $('.drop_area').prepend(`<div class="drop_area__image_box">
                                <div class="drop_img" style=""></div>
                                <a href="" class="delete_link">削除</a>
                                </div>`);
    });
    
    $('#drop_box').on('click', function () {
      $('#file_input').click();
    });
  }
});