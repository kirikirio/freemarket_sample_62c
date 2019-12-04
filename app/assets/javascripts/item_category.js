$(document).on('turbolinks:load', function () {
  // サイズを持つ小カテゴリーのID番号を格納
  const childWithSize = [2, 21, 43, 56, 62, 78, 169, 178, 186, 201, 214, 238, 248, 270, 330, 340, 347, 359, 368, 377, 396, 411, 420]
  // childWithSizeに該当し、サイズを持たない孫ID番号を格納
  const grandchildWithoutSize = [170, 171, 172, 173, 182, 183]

  const appendHTML = (child, target) => {
    const html = `<option value='${child.id}'>${child.name}</option>`
    $(`#${target}`).append(html)

  }
  const url = '/items/new';

  $('#parent').on('change', (e) => {
    $('#children').empty();
    const parentId = $(e.currentTarget).val();
    // セレクトボックスのサイズの選択をリセット
    $('#selectSize').prop("selectedIndex", 0);
    $('#size-area').hide();
    // 0だったらもしくは
    // parentIdがfalsyなら
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
          const target = 'children'
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
    const parentId = $(e.currentTarget).val();
    // セレクトボックスのサイズの選択をリセット
    $('#selectSize').prop("selectedIndex", 0);
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
          const target = 'grandchildren'
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
    const select = $(e.currentTarget).val();
    const childId = Number($('#children').val());

    if (!(select === '0')) {
      $('#brand-area').show();
    }
    if (childWithSize.includes(childId) && !grandchildWithoutSize.includes(Number(select))) {
      $('#size-area').show();
    }
  })
});