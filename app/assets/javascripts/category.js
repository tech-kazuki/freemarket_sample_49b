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
    
    $.ajax({
      url: '/users/1/products/new',
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
      url: '/users/1/products/new',
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

 $(document).on('change', "#range_1-second", function(){
    $("#range_1-third").remove();
    var category_a = $('#range_1-second option:selected').val();

    function buildHTML(children){
      var option = ``
      children.forEach(function(child){
        option += `<option value="${child.id}">${child.name}</option>`
      });

      var html = `<select name="range_1-third" id="range_1-third">
                    <option value label=" "></option>
                    ${option}
                   </select>`
      return html;
    };
    
    $.ajax({
      url: `/users/${current_user}/products/${product_id}/edit`,
      type: "GET",
      data:{category_a: category_a},
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

  $(document).one('change', "#range_1-third", function(){
    var category = $("#range_1-third").val();
    $(".category").val(category);
  })
});
