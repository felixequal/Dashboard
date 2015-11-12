$(document).ready(function () {
    $('#buttontest').click(function() {
    $.ajax({
        type: "POST",
        url: "Service.asmx/returnGraphStuff",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (msg) {
            // Hide the fake progress indicator graphic.
           // $('#buttontest').html(msg.d.graphData);
            jsondata = msg.d.graphData;
           // $('#buttontest').html(gdata['0']);
           // $('#buttontest').html(msg.data);
            // Insert the returned HTML into the <div>.
          //  $('#RSSContent').html(msg.d);
        }
    });
    });
});