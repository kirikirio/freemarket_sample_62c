$(function(){
  if(document.URL.match("/signup/registration")) {
    $('.stepper li').each(function(i, val) {
      $(".stepper li").eq(i).css({'color':'#ea352d','font-weight':'600'})
      $(".stepper li").eq(i).children("div").css('background-color','#ea352d')
      $(".stepper li").append(`<style> .stepper li:nth-child(${i}):before { background-color: red}</style>`);
      if (i == 0) {
        return false;
      }
    })
  }

  if(document.URL.match("/signup/authentication")) {
    $('.stepper li').each(function(i, val) {
      $(".stepper li").eq(i).css({'color':'#ea352d','font-weight':'600'})
      $(".stepper li").eq(i).children("div").css('background-color','#ea352d')
      $(".stepper li").append(`<style> .stepper li:nth-child(${i}):before { background-color: red}</style>`);
      if (i == 1) {
        return false;
      }
    })
  }

  if(document.URL.match("/signup/address")) {
    $('.stepper li').each(function(i, val) {
      $(".stepper li").eq(i).css({'color':'#ea352d','font-weight':'600'})
      $(".stepper li").eq(i).children("div").css('background-color','#ea352d')
      $(".stepper li").append(`<style> .stepper li:nth-child(${i}):before { background-color: red}</style>`);
      if (i == 2) {
        return false;
      }
    })
  }

  if(document.URL.match("/signup/credit")) {
    $('.stepper li').each(function(i, val) {
      $(".stepper li").eq(i).css({'color':'#ea352d','font-weight':'600'})
      $(".stepper li").eq(i).children("div").css('background-color','#ea352d')
      $(".stepper li").append(`<style> .stepper li:nth-child(${i}):before { background-color: red}</style>`);
      if (i == 3) {
        return false;
      }
    })
  }

  if(document.URL.match("/signup/completed")) {
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