$(function(){
  $("#range").change(function(){
    $("#range-second").remove();
    $("#range-third").remove();
    var category = $('option:selected').val();

    function buildHTML(children){
      var option = ``
      children.forEach(function(child){
        option += `<option value="${child.id}">${child.name}</option>`
      });

      var html = `<select name="range-second" id="range-second">
                    <option value label=" "></option>
                    ${option}
                   </select>`

      return html;
    };

    var user_id = $('.current_user_id').val();
    
    $.ajax({
      url: '/users/${user_id}/products/new',
      type: "GET",
      data:{category: category},
      dataType: 'json'
      })
      .done(function(data){
        var html = buildHTML(data);
        $(".products_new_container__content__select__box__category").append(html);
      })
      .fail(function(){
        alert('error');
      })
  });

 $(document).on('change', "#range-second", function(){
    $("#range-third").remove();
    var category_a = $('#range-second option:selected').val();

    function buildHTML(children){
      var option = ``
      children.forEach(function(child){
        option += `<option value="${child.id}">${child.name}</option>`
      });

      var html = `<select name="range-third" id="range-third">
                    <option value label=" "></option>
                    ${option}
                   </select>`
      return html;
    };

    
    $.ajax({
      url: '/users/${user_id}/products/new',
      type: "GET",
      data:{category_a: category_a},
      dataType: 'json'
      })
      .done(function(data){
        var html = buildHTML(data);
        $(".products_new_container__content__select__box__category").append(html);
      })
      .fail(function(){
        alert('error');
      })
  });

  $(document).one('change', "#range-third", function(){
    $(".products_new_container__content__select__box__size").show();
    $(".products_new_container__content__select__box__brand").show();
    var category = $("#range-third").val();
    $(".category").val(category);
  })
});

$(function(){
  var current_user = $(".current_user_id").val();
  var product_id = $(".product_id").val();
  $("#range_1").change(function(){
    $("#range_2").remove();
    $("#range_3").remove();
    $("#range_1-second").remove();
    $("#range_1-third").remove();
    var category = $('option:selected').val();
    function buildHTML(children){
      var option = ``
      children.forEach(function(child){
        option += `<option value="${child.id}">${child.name}</option>`
      });

      var html = `<select name="range_1-second" id="range_1-second">
                    <option value label=" "></option>
                    ${option}
                   </select>`

      return html;
    };

    $.ajax({
      url: `/users/${current_user}/products/${product_id}/edit`,
      type: "GET",
      data:{category: category},
      dataType: 'json'
      })
      .done(function(data){
        var html = buildHTML(data);
        $(".products_new_container__content__select__box__category-edit").append(html);
      })
      .fail(function(){
        alert('error');
      })
  });

  $(".products_new_container__content__select__box__burden").on("change", function(){
    var val = $("#product_burden").val();
    if(val == "送料込み(出品者負担)"){
      $(".products_new_container__content__select__box__buyer").hide();
      $(".products_new_container__content__select__box__exhibitor").show();
    }else{
      $(".products_new_container__content__select__box__exhibitor").hide();
      $(".products_new_container__content__select__box__buyer").show();
    };
  });

  $("#product_price").on("keyup", function(){
    var val = $(this).val();
    if(val >= 300 && isFinite(val)){
      $(".list_right_tax").text("");
      $(".list_right_price").text("");
      var tax = val * 0.1
      var price = val * 0.9
      var tax = Math.floor(tax)
      var price = Math.floor(price)
      $(".list_right_tax").append("¥" + tax);
      $(".list_right_price").append("¥" + price);
    }else{
      $(".list_right_tax").text("");
      $(".list_right_price").text("");
      $(".list_right_tax").append("-");
      $(".list_right_price").append("-");
      }
  });
});

