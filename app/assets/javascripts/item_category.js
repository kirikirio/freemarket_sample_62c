$(document).on('turbolinks:load', function () {
  const appendHTML = (child, target) => {
    const html = `<option value='${child.id}'>${child.name}</option>`
    $(`#${target}`).append(html)

  }
  const url = '/items/new';

  $('#parent').on('change', (e) => {
    $('#children').empty();
    let parentId = $(e.currentTarget).val();
    // 0だったらもしくは
    // aprentIdがfalsyなら
    if (parentId === '0' || !(parentId)) {
      $('#children').parent().hide();
      $('#grandchildren').parent().hide();
    } else {
      $.ajax({
        type: 'GET',
        url: url,
        data: { parentId },
        dataType: 'json'
      })
        .done(data => {
          $('#children').parent().show();
          let target = 'children'
          $(`#${target}`).append('<option value=0>---</option>');
          $('#grandchildren').empty();
          $('#grandchildren').append('<option value=0>---</option>');

          data.forEach(d => {
            appendHTML(d, target);
          })
        })
        .fail(() => {
          alert('error');
        })
    }
  })


  $('#children').on('change', (e) => {
    $('#grandchildren').empty();
    let parentId = $(e.currentTarget).val();
    // 0だったらもしくは
    // aprentIdがfalsyなら
    if (parentId === '0' || !(parentId)) {
      $('#grandchildren').parent().hide();
    } else {
      $.ajax({
        type: 'GET',
        url: url,
        data: { parentId },
        dataType: 'json'
      })
        .done(data => {
          let target = 'grandchildren'
          $(`#${target}`).parent().show();
          $(`#${target}`).append('<option value=0>---</option>')
          $('#size-area').hide();
          data.forEach(d => {
            appendHTML(d, target);
          })
        })
        .fail(() => {
          alert('childerror');
        })
    }
  })

  $('#grandchildren').on('change', (e) => {
    let select = $(e.currentTarget).val();
    if (!(select === '0')) {
      $('#size-area').show();
      $('#brand-area').show();
    }
  })
});