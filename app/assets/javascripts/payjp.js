$(document).on('turbolinks:load', function() {
  var form = $("#charge-form"),
      number = form.find('input[name="number"]'),
      cvc = form.find('input[name="cvc"]'),
      exp_month = form.find('select[name="exp_month"]'),
      exp_year = form.find('select[name="exp_year"]');
  $("#card_submit").click(function() {
    form.find("input[type=submit]").prop("disabled", true);

    var card = {
        number: number.val(),
        cvc: cvc.val(),
        exp_month: exp_month.val(),
        exp_year: exp_year.val()
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        form.find('.payment-errors').text(response.error.message);
        form.find('button').prop('disabled', false);
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");

        var token = response.id;

        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();
      }
    });
  });
});
