//= require moment/min/moment.min
//= require fullcalendar/dist/fullcalendar.min
//= require fullcalendar/dist/locale/es

$(document).ready(function() {
    $("#calendar").fullCalendar({
        locale: "es",
        header: {
            left: "prev,next today",
            center: "title",
            right: "month,agendaWeek,agendaDay"
        },
        events:[
            {
                title  : 'event1',
                start  : '2018-05-01'
            },
            {
                title  : 'event2',
                start  : '2010-01-05',
                end    : '2010-01-07'
            },
            {
                title  : 'event3',
                start  : '2010-01-09 12:30:00',
                allDay : false
            }
        ] 
    });
});