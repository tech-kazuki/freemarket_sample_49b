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
      url: '/products/new',
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
      url: '/products/new',
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
  }
 );

  $(document).one('change', "#range-third", function(){
    $(".products_new_container__content__select__box__size").show();
    $(".products_new_container__content__select__box__brand").show();
  })

});