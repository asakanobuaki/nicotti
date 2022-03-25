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
            const life = data.life;
            const excessCigarette = data.excess_cigarette;
            const todaySmoking = data.user_smoking;
            const remaining = data.remaining_smoking;
            const reborn = data.reborn;

            // 本日の喫煙レコード追加
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
            else if (excessCigarette == 0 && reborn){
              
              $("#js-status").replaceWith(`<div class="status-text" id="js-status">ステータス：健康</div>`);
              $("#js-life").replaceWith(`<div class='status-text' id='js-life'>人生回数　： ${life}回</div>`);
              $("#js-nicotti-words").replaceWith(`<div id='js-nicotti-words'>「今日もすこぶる体調がいいよ！！」</br>「「目標を達成できるよう頑張ろう！」</div>`);

              $(".nicotti-position-1, .nicotti-position-2").fadeOut();
                $(".nicotti-position").fadeIn();
                
              $("#modalDead").fadeIn();
              $('#closeModal, #modalBg').on('click', function(){
                $('#modalDead').fadeOut();
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

              $("#js-status").replaceWith("<div class='status-text' id='js-status'>ステータス：ハゲ</div>");

              $("#js-nicotti-words").replaceWith("<div id='js-nicotti-words'>「なんだか気分が悪いな(;o;)」</br>「君も体調には気をつけてね、、」</div>");

              $(".nicotti-position, .nicotti-position-2").fadeOut();
                $(".nicotti-position-1").fadeIn();
            }
            else if (state == "cancer") {

              $("#js-status").replaceWith("<div class='status-text' id='js-status'>ステータス：がん</div>");

              $("#js-nicotti-words").replaceWith("<div id='js-nicotti-words'>「もうだめかもしれない」</br>「でももっと長く生きたいよう。。」</div>");

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