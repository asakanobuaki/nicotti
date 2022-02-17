$(document).on('turbolinks:load', function() {

  $("#js-smoking-buttom").on('click', function() {

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

        const userId = $(this).data("user-id")

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
              $('#closeModal , #modalBg').on('click', function(){
                $('#modalDead').fadeOut();

                $.ajax({
                  url: "/users/reborn",
                  type: "GET"
                })
              });
            }
            else {
              Swal.fire({
                title: '',
                text: `本日${todaySmoking}回目の喫煙です`,
                icon: 'success',
                confirmButtonText: '閉じる',
                confirmButtonColor: '#36D2A4',
                customClass: 'customizable'
              })
            }

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