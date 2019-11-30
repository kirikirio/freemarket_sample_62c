$(document).on('turbolinks:load', (function() {
  $('.top__header__area__carousel').slick({
      dots: true,
      autoplay: true,
      autoplaySpeed: 4000,
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.slider').slick('goTo', $(this).index());
  });

}));
