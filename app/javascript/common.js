$(function(){
  $('.alert').fadeOut(2000);
});

$(document).on('turbolinks:load', function() {

  $("#test-test").on('click', function(){
    $(".nicotti-position").slideToggle();
  });

});