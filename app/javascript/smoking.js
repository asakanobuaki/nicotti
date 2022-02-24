$(document).on('turbolinks:load', function() {

  $("#js-smoking-buttom").on('click', function() {

    // confirmation
    Swal.fire({
      title: '喫煙しますか?',
      text: "登録すると元に戻せません",
      icon: 'question',
      showCancelButton: true,
      customClass: 'customizable',
      confirmButtonColor: '#36D2A4',
      cancelButtonColor: '#e05151',
      confirmButtonText: '喫煙する',
      cancelButtonText: 'やめる',
    }).then((result) => {
      if (result.isConfirmed) {

        // smokingレコードcreate
        $.ajax({
          url: "/smokings",
          type: "POST",
          dataType: "json"
        })

        .done(function(data) {

            console.log(data);

            const state = data.state;
            const excessCigarette = data.excess_cigarette;
            const todaySmoking = data.user_smoking;
            const remaining = data.remianing_smoking;

            // 本日の喫煙log追加
            $(".smoking-log, .smoking-log2").append(data.html);

            // ステータス変更時modal表示
            if (excessCigarette == 6){
              $("#modalBaldness").fadeIn();
              $('#closeModal , #modalBg').on('click', function(){
                $('#modalBaldness').fadeOut();
              });
            }
            else if (excessCigarette == 8){
              $("#modalCancer").fadeIn();
              $('#closeModal , #modalBg').on('click', function(){
                $('#modalCancer').fadeOut();
              });
            }
            else if (excessCigarette == 10){
              $("#modalDead").fadeIn();
              $('#closeModal').on('click', function(){
                $('#modalDead').fadeOut();

                // ニコッチ蘇りメソッド
                $.ajax({
                  url: "/users/reborn",
                  type: "GET"
                })
              });
            }
            else {
              Swal.fire({
                title: '',
                text: `本日 ${todaySmoking} 回目の喫煙です`,
                icon: 'success',
                confirmButtonText: '閉じる',
                confirmButtonColor: '#36D2A4',
                customClass: 'customizable'
              })
            }

            // ステータス変更、ニコッチ画像変更
            if (state == "baldness"){

              $("#js-status").html("<div class='status-text'>ステータス：ハゲ</div>");

              $("#js-nicotti-words").html("<div>「なんだか気分が悪いな(;o;)」</br>「君も体調には気をつけてね、、」</div>");

              $(".nicotti-position, .nicotti-position-2").fadeOut();
                $(".nicotti-position-1").fadeIn();
            }
            else if (state == "cancer") {

              $("#js-status").html("<div class='status-text'>ステータス：がん</div>");

              $("#js-nicotti-words").html("<div>「もうだめかもしれない」</br>「でももっと長く生きたいよう。。」</div>");

              $(".nicotti-position, .nicotti-position-1").fadeOut();
                $(".nicotti-position-2").fadeIn();
            }

            // 残り喫煙本数、今日の喫煙数変更
            $("#js-remaining-number").replaceWith(`<strong class='emphasis' id='js-remaining-number' >${remaining}</strong>`);
            $("#js-today-smoking").replaceWith(`<strong class='emphasis' id='js-today-smoking' >${todaySmoking}</strong>`);

          })

        .fail(function() {
          console.log('通信に失敗しました');
        })

      } 
      // else if (
      //   /* Read more about handling dismissals below */
      //   result.dismiss === Swal.DismissReason.cancel
      // ) {
      //   Swal.fire(
      //     'キャンセルしました',
      //     '',
      //     'error'
      //   )
      // }
    })
    
    
  });
});