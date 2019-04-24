$(document).on('turbolinks:load', function(){
  $(".header__bottom__left__h2" ).on('mouseenter', function(){
    $('.accordion_list-1').css('display', 'block');
  });

  var first_list = document.getElementsByClassName('first_list');
  var second_lists = document.getElementsByClassName('second_lists');
  var second_list = document.getElementsByClassName('second_list');
  var third_lists = document.getElementsByClassName('third_lists');

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
  
  for (i = 0; i < 3; i++ ) {
    first_list[i].addEventListener('mouseover', openList(second_lists[i]), false);
    first_list[i].addEventListener('mouseleave', closeList(second_lists[i]), false);
    };

  for (i = 0; i < 9; i++ ) {
    second_list[i].addEventListener('mouseover', openList(third_lists[i]), false);
    second_list[i].addEventListener('mouseleave', closeList(third_lists[i]), false);
  };

  $('.header__bottom__left__h2').on('mouseleave', function(){
    $('.accordion_list-1').css('display', 'none');
  });

});