$(document).ready(function(){
  //jQuery date picker
    $("#date-dropdown").datepicker({
      dateFormat: 'yy-mm-dd',
    });

  //set the screen view
  var get_height = $(window).height();
  var half_height = get_height/2;
  $('section').css('cssText', 'height: 100vh; height: '+get_height+'px;');
  $('header').css('cssText', 'height: 100vh; height: '+get_height+'px;');
  $('.home-bottom-up').css('cssText', 'height: 50vh; height: '+half_height+'px;');
  $('.home-bottom-down').css('cssText', 'height: 50vh; height: '+half_height+'px;');
  $('a').smoothScroll();

  //page scroll to top
  $('html').append('<a href="#" class="back-to-top" style="display: none;"><i class="fa fa-lg fa-arrow-up"></i></a>');
  var offset = 230;
  var duration = 500;
  $(window).scroll(function() {
    if ($(this).scrollTop() > offset) {
        $('.back-to-top').fadeIn(duration);
    } else {
        $('.back-to-top').fadeOut(duration);
    }
  });

  $('.back-to-top').click(function(e) {
    e.preventDefault();
    $('html, body').animate({scrollTop: 0}, duration);
    return false;
  });

});

$(document).resize(function(){
  var get_height = $(window).height();
  $('section').css('cssText', 'height: 100vh; height: '+get_height+'px;');
  $('header').css('cssText', 'height: 100vh; height: '+get_height+'px;');
});
