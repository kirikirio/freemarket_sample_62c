$(document).on('turbolinks:load', function() {
  if($("h1").text() == "会員情報入力") {
    $('.stepper li').each(function(i, val) {
      $(".stepper li").eq(i).css({'color':'#ea352d','font-weight':'600'})
      $(".stepper li").eq(i).children("div").css('background-color','#ea352d')
      $(".stepper li").append(`<style> .stepper li:nth-child(${i}):before { background-color: red}</style>`);
      if (i == 0) {
        return false;
      }
    })
  }

  if($("h1").text() == "電話番号認証") {
    $('.stepper li').each(function(i, val) {
      $(".stepper li").eq(i).css({'color':'#ea352d','font-weight':'600'})
      $(".stepper li").eq(i).children("div").css('background-color','#ea352d')
      $(".stepper li").append(`<style> .stepper li:nth-child(${i}):before { background-color: red}</style>`);
      if (i == 1) {
        return false;
      }
    })
  }

  if($("h1").text() == "発送元・お届け情報入力") {
    $('.stepper li').each(function(i, val) {
      $(".stepper li").eq(i).css({'color':'#ea352d','font-weight':'600'})
      $(".stepper li").eq(i).children("div").css('background-color','#ea352d')
      $(".stepper li").append(`<style> .stepper li:nth-child(${i}):before { background-color: red}</style>`);
      if (i == 2) {
        return false;
      }
    })
  }

  if($("h1").text() == "支払い方法") {
    $('.stepper li').each(function(i, val) {
      $(".stepper li").eq(i).css({'color':'#ea352d','font-weight':'600'})
      $(".stepper li").eq(i).children("div").css('background-color','#ea352d')
      $(".stepper li").append(`<style> .stepper li:nth-child(${i}):before { background-color: red}</style>`);
      if (i == 3) {
        return false;
      }
    })
  }

  if($("h1").text() == "会員登録完了") {
    $('.stepper li').each(function(i, val) {
      $(".stepper li").eq(i).css({'color':'#ea352d','font-weight':'600'})
      $(".stepper li").eq(i).children("div").css('background-color','#ea352d')
      $(".stepper li").append(`<style> .stepper li:nth-child(${i}):before { background-color: red}</style>`);
      if (i == 4) {
        return false;
      }
    })
  }
});