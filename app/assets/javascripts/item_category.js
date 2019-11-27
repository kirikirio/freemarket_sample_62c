$(function () {
  const appendHTML = (child, target) => {
    const html = `<option value='${child.id}'>${child.name}</option>`
    $(`#${target}`).append(html)

  }
  const url = '/items/new';

  $('#parent').on('change', function () {
    $('#children').empty();
    let parentId = $(this).val();
    // 0だったら、true
    // ０でなく、aprentIdがfalsyならtrue
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
          $(`#${target}`).append('<option value=0>---</option>')
          data.forEach(d => {
            appendHTML(d, target);
          })
        })
        .fail(() => {
          alert('error');
        })
    }

  })

  $('#children').on('change', function () {
    $('#grandchildren').empty();
    let parentId = $(this).val();
    //  0だったら、true
    // ０でなく、aprentIdがfalsyならtrue
    if (parentId === '0' || !(parentId)) {
      console.log('0desu')
      $('#grandchildren').parent().hide();
    } else {
      $.ajax({
        type: 'GET',
        url: url,
        data: { parentId },
        dataType: 'json'
      })
        .done(data => {
          $('#grandchildren').parent().show();
          let target = 'grandchildren'
          $(`#${target}`).append('<option value=0>---</option>')
          data.forEach(d => {
            appendHTML(d, target);
          })
        })
        .fail(() => {
          alert('childerror');
        })
    }
  })

  $('#grandchildren').on('change', (event) => {
    let select = $(event.currentTarget).val();
    if (!(select === '0')) {
      $('#size-area').show();
      $('#brand-area').show();
    }
  })
});