$(document).on('turbolinks:load', function() {

  $("#js-smoking-buttom").on('click', function() {
    
    const userId = $(this).data("user-id")

    $.ajax({
      url: "/smokings",
      type: "POST",
      dataType: "json"
    })

    .done(function(data) {

        console.log(data);

        const state = data.state;
        const todaySmoking = data.user_smoking;
        const remaining = data.remianing_smoking;

        if (state == "baldness"){
          $("#js-status").html("<div class='status-text'>ステータス：ハゲ</div>");
          $(".nicotti-position, .nicotti-position-2").fadeOut();
            $(".nicotti-position-1").fadeIn();
         }
        else if (state == "cancer") {
          $("#js-status").html("<div class='status-text'>ステータス：がん</div>");
          $(".nicotti-position, .nicotti-position-1").fadeOut();
            $(".nicotti-position-2").fadeIn();
         }

         $("#js-remaining-number").html(`<span class='bg-warning' id='js-remaining-number' >${remaining}</span>`);
         $("#js-today-smoking").html(`<span class='bg-warning' id='js-today-smoking' >${todaySmoking}</span>`);
        
      })

    .fail(function() {
      console.log('通信に失敗しました');
    })
  });
});