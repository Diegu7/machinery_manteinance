//= require moment/min/moment.min
//= require fullcalendar/dist/fullcalendar.min
//= require fullcalendar/dist/locale/es

$(document).ready(function () {
    $('#calendar').fullCalendar({
        timeFormat: 'hh:mm',
        height: 'auto',
        locale: 'es',
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        events: '/events',
        eventClick: function (e, jsEvent, view) {

            // alert('Descripcion: ' + calEvent.title);
            // $('#myModal').modal('toggle');

            // var e = $(this);

            var body = "<b>Descripcion:</b> " + e.description + "<br>" +
                "<b>Inicio:</b> " + moment(e.start).format("DD [de] MMMM YYYY - hh:mm A") + "<br>" +
                "<b>Final:</b> " + moment(e.end).format("DD [de] MMMM YYYY - hh:mm A") + "<br>";

            console.log(e);
            $("#myModal").modal("show");
            $('.modal-title').html(e.title);
            $('.modal-body').html(body);

            // change the border color just for fun
            // $(this).css('border-colr', 'red');

        },
        eventRender: function (eventObj, $el) {
            $el.popover({
                title: eventObj.title,
                content: eventObj.description,
                trigger: 'hover',
                placement: 'top',
                container: 'body'
            })
        }
    });
});

//
// $('.modalShow').click(function(event){
//     event.preventDefault();
//     var e = $(this);
//     var title = e.data('title');
//     var body = e.data('value');
//     $("#myModal").modal("show");
//     $('#modal-title').html(title);
//     $('#modal-body').html(body);
// });
