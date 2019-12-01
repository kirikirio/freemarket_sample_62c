$(document).on('turbolinks:load', function () {

  const imagePreview = (input) => {
    const reader = new FileReader();
    const file = input.files[0];

    reader.onload = (e) => {

      const html = `<img
                  src=${e.currentTarget.result}
                  class="preview"
                  >`
      $('.preview-image > .figure').empty();
      $('.preview-image >.figure').append(html);
      // モデルに画像があり、viewに表示されているか
      const visivility = $('.saved-image').css('display') === 'list-item'
      if (visivility) {
        $('.saved-image').hide();
      }
    }
    reader.readAsDataURL(file);
  }
  // プレビュー画像の表示
  $('.fileField').on('change', (e) => {

    $('.preview-image').show();
    imagePreview(e.target);
  })
  // プレビュー画像の削除 + ファイル選択の解除
  $('.removePreviewBtn').on('click', () => {
    $('.preview-image').hide();
    $('.fileField').val('');

  })
  // モデルの画像の削除
  $('.removeBtn').on('click', () => {
    $('.removeField').val(true);

    $('.saved-image').hide();
  })
});
