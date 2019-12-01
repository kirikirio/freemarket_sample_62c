$(document).on('turbolinks:load', function () {
  $('select[name="item[delivery_fee]"]').on('change', (e) => {
    const select = $(e.currentTarget).val();
    if (select) {
      $('#method-area').show();
    } else {
      $('#method-area').hide();
    }
  })
})