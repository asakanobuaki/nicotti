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

        // $('#js-today-smokings').html("j(render('users/today_smokings'))");
         
      })

    .fail(function() {
      console.log('通信に失敗しました');
    })
  });
});