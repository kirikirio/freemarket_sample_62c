$(function () {
  $('select[name="item[delivery_fee]"]').on('change', (e) => {
    const select = $(e.target).val();
    if (select) {
      $('#method-area').show();
    } else {
      $('#method-area').hide();
    }
  })

})