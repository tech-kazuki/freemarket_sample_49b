$(document).on('turbolinks:load', function(){
  $( ".header__bottom__left" ).accordion({
    header: "h2",
    event: "mouseenter mouseleave",
    active: false,
    collapsible: true,
    animate: false,
  });
});