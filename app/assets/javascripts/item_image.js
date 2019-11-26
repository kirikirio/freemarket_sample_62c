$(function () {
  const imagePreview = (input) => {
    const reader = new FileReader();
    const file = input.files[0];
    console.log(file)

    reader.onload = (e) => {
      // const result = e.target.result;
      console.log(e.target.result)
      // $('#preview').attr('src', e.target.result)
      const html = `<img src=${e.target.result}>`
      // $('#preview').attr('src', e.target.result)
      $('.test').empty();
      $('.test').append(html);
    }
    reader.readAsDataURL(file);
  }

  $('#fileField').on('change', (e) => {
    imagePreview(e.target)
  })
});
