$(function () {

  $('#parent').on('change', function () {
    $('#children').show();
    console.log('発火');
  })

  $('#children').on('change', function () {
    $('#grandchildlen').show();
    console.log('発火');
  })

});