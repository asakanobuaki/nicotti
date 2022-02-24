//インストールしたファイルたちを呼び出します。
import { Calendar} from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from "@fullcalendar/timegrid";

//<div id='calendar'></div>のidからオブジェクトを定義してカレンダーを作っていきます。
document.addEventListener('turbolinks:load', function() {
    let calendarEl = document.getElementById('calendar');

    //カレンダーの中身を設定(月表示とか、クリックアクション起こしたいとか、googleCalendar使うととか)
    let calendar = new Calendar(calendarEl, {
        plugins: [ dayGridPlugin, interactionPlugin, timeGridPlugin ],

        //細かな表示設定
        locale: 'ja',
        timeZone: 'Asia/Tokyo',
        firstDay: 0,
        initialView: 'timeGridWeek',
        // allDaySlot: false,
        stickyHeaderDates: true,
        headerToolbar: {
          start: '',
          left: 'title',
          end: 'today prev,next dayGridMonth,timeGridWeek,timeGridDay' 
        },
        allDayContent: '合計',
        views: {
          timeGridWeek: {
            titleFormat: function (date) {
              const startMonth = date.start.month + 1;
              const endMonth = date.end.month + 1;
              if (startMonth === endMonth) {
                return startMonth + '月';
              } else {
                return startMonth + '月～' + endMonth + '月'; 
              }
            },
            dayHeaderFormat: function (date) {
              const day = date.date.day;
              const weekNum = date.date.marker.getDay();
              const week = ['(日)', '(月)', '(火)', '(水)', '(木)', '(金)', '(土)'][weekNum];
              return day + ' ' + week;
            }
          },
          timeGridDay: {
            titleFormat: function (date) {
              return `${date.date.year}年 ${date.date.month + 1}月`;
            },
            dayHeaderFormat: function (date) {
              const day = date.date.day;
              const weekNum = date.date.marker.getDay();
              const week = ['(日)', '(月)', '(火)', '(水)', '(木)', '(金)', '(土)'][weekNum];
              return day + ' ' + week;
            },
          },
        },
      navLinks: true,
      nowIndicator: true,
      expandRows: true,
      buttonText: {
          today: '今日',
          month: '月',
          week: '週',
          day: '日'
      }, 
         height: "auto",
         dayCellContent: function (e) {
          e.dayNumberText = e.dayNumberText.replace('日', '');
        },
        events: '/smokings.json',
        defaultTimedEventDuration: '00:30',
        eventColor: '#36D2A4'
    });
    //カレンダー表示
    calendar.render();

});