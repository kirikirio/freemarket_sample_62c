$(function () {
  const imagePreview = (input) => {
    const reader = new FileReader();
    const file = input.files[0];

    reader.onload = (e) => {

      const html = `<img
              src=${e.target.result}
              class="preview-image"
              >`
      $('.figure').empty();
      $('.figure').append(html);
    }
    reader.readAsDataURL(file);
  }

  $('.fileField').on('change', (e) => {
    $('.image-area__preview').show();
    imagePreview(e.target)
  })
});
