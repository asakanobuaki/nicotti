$(function(){
  $('.alert').fadeOut(2000);
});

$(document).on('turbolinks:load', function() {

  $("#js-smoking-log").on('click',function(){
    $("#modalSmokingLog").slideToggle(500);
    $('#closeModal , #modalBg').on('click', function(){
      $('#modalSmokingLog').slideUp(500);
    });
  });

});