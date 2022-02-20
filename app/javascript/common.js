$(function(){
  $('.alert').fadeOut(2000);
});

$(document).on('turbolinks:load', function() {

  $("#js-smoking-log").on('click',function(){
    $("#modalSmokingLog").fadeIn();
    $('#closeModal , #modalBg').on('click', function(){
      $('#modalSmokingLog').fadeOut();
    });
  });

});