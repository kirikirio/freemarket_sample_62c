$(function () {
  const appendHTML = (child, target) => {
    const html = `<option value='${child.id}'>${child.name}</option>`
    $(`#${target}`).append(html)

  }
  // const url = window.location.href;
  const url = '/items/new';

  $('#parent').on('change', function () {
    $('#children').empty();
    console.log('発火親');
    let parentId = $(this).val();
    console.log('parent', parentId);
    console.log('url', url)
    // 0だったら、true
    // ０でなく、aprentIdがfalsyならtrue
    if (parentId === '0' || !(parentId)) {
      console.log('子の親は？', $('#children').parent());
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
          console.log('done', data);
          let target = 'children'
          $(`#${target}`).append('<option value=0>---</option>')
          data.forEach(d => {
            console.log(d.name);
            appendHTML(d, target);
          })
        })
        .fail(() => {
          console.log('error')
        })
    }

  })

  $('#children').on('change', function () {
    $('#grandchildren').empty();
    console.log('子発火');
    let parentId = $(this).val();
    console.log('parentId', parentId);
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
          console.log(data);
          let target = 'grandchildren'
          $(`#${target}`).append('<option value=0>---</option>')
          data.forEach(d => {
            console.log(d.name);
            appendHTML(d, target);
          })
        })
        .fail(() => {
          console.log('childerror')
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