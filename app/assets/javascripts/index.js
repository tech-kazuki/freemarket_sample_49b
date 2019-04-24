$(document).on('turbolinks:load', function(){
  $( ".header__bottom__left__h2" ).on('mouseenter', function(){
    $('.accordion_list--1').css('display', 'block');
  })

  $('.header__bottom__left__h2').on('mouseleave', function(){
    $('.accordion_list--1').css('display', 'none');
  });


});