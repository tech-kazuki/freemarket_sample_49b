$(document).on('turbolinks:load', function(){
  $('#user_btn').on('click', function(){
    $('#user_box').css('display', 'none');
    $('#certification').show();
    $('#li_1').removeClass('now');
    $('#li_2').addClass('active now');
    $('#status_2').addClass('active');
  });
  
  $('#certification_btn').on('click', function(){
    $('#certification').css('display', 'none');
    $('#address').show();
    $('#li_2').removeClass('now');
    $('#li_3').addClass('active now');
    $('#status_3').addClass('active');
  });
  
  $('#address_btn').on('click', function(){
    $('#address').css('display', 'none');
    $('#card').show();
    $('#li_3').removeClass('now');
    $('#li_4').addClass('active now');
    $('#status_4').addClass('active');
  });
});
