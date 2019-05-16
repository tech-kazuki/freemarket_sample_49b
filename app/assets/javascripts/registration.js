$(document).on('turbolinks:load', function(){
  $('#nickname_field').on('blur', function(){
    if ($(this).val() == "") {
      $("#error_nickname").show();
    } else {
      $("#error_nickname").hide();
    }
  });
  
  $('#mail_field').on('blur', function(){
    if ($(this).val().match(/^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]{1,}\.[A-Za-z0-9]{1,}$/)) {
      $('#error_mail').hide();
    } else {
      $('#error_mail').show();
    }
  });
  
  $('#family_name_field').on('blur', function(){
    if ($(this).val() == "") {
      $('#error_family_name').text("必ず入力してください。");
      $('#error_family_name').show(); 
    } else if ($(this).val().match(/^[^\x01-\x7E\xA1-\xDF]+$/)) {
      $('#error_family_name').hide();
    } else {
      $('#error_family_name').text("全角で入力してください。");
      $('#error_family_name').show();
    }
  });
  
  $('#first_name_field').on('blur', function(){
    if ($(this).val() == "") {
      $('#error_first_name').text("必ず入力してください。");
      $('#error_first_name').show(); 
    } else if ($(this).val().match(/^[^\x01-\x7E\xA1-\xDF]+$/)) {
      $('#error_first_name').hide();
    } else {
      $('#error_first_name').text("全角で入力してください。");
      $('#error_first_name').show();
    }
  });
  
  $('#family_katakana_field').on('blur', function(){
    if ($(this).val() == "") {
      $('#error_family_katakana').text("必ず入力してください。");
      $('#error_family_katakana').show(); 
    } else if ($(this).val().match(/^[\u30a1-\u30f6]+$/)) {
      $('#error_family_katakana').hide();
    } else {
      $('#error_family_katakana').text("全角カタカナで入力してください。");
      $('#error_family_katakana').show();
    }
  });
  
  $('#first_katakana_field').on('blur', function(){
    if ($(this).val() == "") {
      $('#error_first_katakana').text("必ず入力してください。");
      $('#error_first_katakana').show(); 
    } else if ($(this).val().match(/^[\u30a1-\u30f6]+$/)) {
      $('#error_first_katakana').hide();
    } else {
      $('#error_first_katakana').text("全角カタカナで入力してください。");
      $('#error_first_katakana').show();
    }
  });
  
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
});
