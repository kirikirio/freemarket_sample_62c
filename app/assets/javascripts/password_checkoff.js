$(document).on('turbolinks:load', $(function(){

  $('input[name="check"]').change(function(){
    var prop = $('.form-group__revelation-pass__checkbox').prop('checked');
    
    if(prop){
      $("#password").attr("type", "text") 
    }else{
      $("#password").attr("type", "password") 
      console.log("a")
    }
    })
  })
);