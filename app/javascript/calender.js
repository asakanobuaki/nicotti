//インストールしたファイルたちを呼び出します。
import { Calendar} from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import monthGridPlugin from '@fullcalendar/daygrid'

//<div id='calendar'></div>のidからオブジェクトを定義してカレンダーを作っていきます。
document.addEventListener('turbolinks:load', function() {
    let calendarEl = document.getElementById('calendar');

    //カレンダーの中身を設定(月表示とか、クリックアクション起こしたいとか、googleCalendar使うととか)
    let calendar = new Calendar(calendarEl, {
        plugins: [ monthGridPlugin, interactionPlugin],

        //細かな表示設定
        locale: 'ja',
        timeZone: 'Asia/Tokyo',
        firstDay: 0,
        headerToolbar: {
          start: '',
          left: 'title',
          end: 'today prev,next' 
        },
        expandRows: true,
        stickyHeaderDates: true,
        businessHours: true,
        buttonText: {
           today: '今日'
        }, 
         height: "auto",
         dayCellContent: function (e) {
          e.dayNumberText = e.dayNumberText.replace('日', '');
        },
        events: '/smokings.json'

    });
    //カレンダー表示
    calendar.render();

});