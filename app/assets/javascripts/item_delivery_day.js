$(function () {
  $('select[name="item[delivery_fee]"]').on('change', function (e) {
    const select = $(e.target).val();
    if (select) {
      $('#method-area').show();
      console.log(select)
    } else {
      $('#method-area').hide();
    }
  })

})