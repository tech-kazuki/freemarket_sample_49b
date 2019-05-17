$(function(){
  var timer = false;
  $(window).resize(function() {
      if (timer !== false) {
          clearTimeout(timer);
      }
      timer = setTimeout(function() {
      location.reload();
      }, 200);
  });

  if (window.matchMedia( '(max-width: 766px)' ).matches){
    $(".title").on("click", function(){
      $(this).next(".element").slideToggle(200);
    });
    $(document).on("click", ".element__parent", function(){
      $(this).next(".element__child").slideToggle(200);
    });
  };
});
