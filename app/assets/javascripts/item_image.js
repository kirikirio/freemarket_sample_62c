$(function () {
  const imagePreview = (input) => {
    const reader = new FileReader();
    const file = input.files[0];
    console.log(file)

    reader.onload = (e) => {

      // console.log(e.target.result)
      // $('#preview').attr('src', e.target.result)
      const html = `<img
              src=${e.target.result}
              class="preview-image"
              >`
      // $('#preview').attr('src', e.target.result)
      $('.figure').empty();
      $('.figure').append(html);
    }
    reader.readAsDataURL(file);
  }

  $('#fileField').on('change', (e) => {
    $('.preview-list').show();
    imagePreview(e.target)
  })
});
