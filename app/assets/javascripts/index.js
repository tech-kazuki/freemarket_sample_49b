$(document).on('turbolinks:load', function(){
  $(".header__bottom__left__h2" ).on('mouseenter', function(){
    $(this).children('.accordion_list-1').css('display', 'block');
  });

  var first_list = document.getElementsByClassName('first_list');
  var second_lists = document.getElementsByClassName('second_lists');
  var second_list = document.getElementsByClassName('second_list');
  var third_lists = document.getElementsByClassName('third_lists');
  var grandLength = first_list.length
  var parentLength = second_list.length
  
  if (first_list[0]) {
  
    function openList(list) {
      return function (){
      list.style.display = 'block';
      }
    };

    function closeList(list) {
      return function (){
      list.style.display = 'none';
      }
    };
    
    for (i = 0; i < grandLength; i++ ) {
      first_list[i].addEventListener('mouseover', openList(second_lists[i]), false);
      first_list[i].addEventListener('mouseleave', closeList(second_lists[i]), false);
    };

    for (i = 0; i < parentLength; i++ ) {
      second_list[i].addEventListener('mouseover', openList(third_lists[i]), false);
      second_list[i].addEventListener('mouseleave', closeList(third_lists[i]), false);
    };

    $('.header__bottom__left__h2').on('mouseleave', function(){
      $(this).children('.accordion_list-1').css('display', 'none');
    });

    $('.first_list_box').on('mouseover', function() {
      $(this).css('background-color', '#ea352d');
      $(this).children('.top_links').css('color', '#fff');
    }).on('mouseout', function(){
      $(this).css('background-color', '#fff');
      $(this).children('.top_links').css('color', '#000');
    });

    $('.second_list_box').on('mouseover', function() {
      $(this).css('background-color', '#f0f0f0');
    }).on('mouseout', function(){
      $(this).css('background-color', '#fff');
    });

    $('.more_links').on('mouseover', function() {
      $(this).css('background-color', '#f0f0f0');
    }).on('mouseout', function(){
      $(this).css('background-color', '#fff');
    });

    $('.cate_index').on('mouseover', function() {
      $(this).css('background-color', '#ea352d');
      $(this).children('.category_index').css('color', '#fff');
    }).on('mouseout', function(){
      $(this).css('background-color', '#fff');
      $(this).children('.category_index').css('color', '#000');
    });
    
    $('.grandparent-name').on('mouseover', function() {
      $(this).css('background-color', '#ea352d');
      $(this).children('.name').css('color', '#fff');
    }).on('mouseout', function(){
      $(this).css('background-color', '#fff');
      $(this).children('.name').css('color', '#000');
    });
  }
});

