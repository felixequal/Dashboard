var chartHold =[];

function createNewChart(type, selection, data, count) {
   
    var stringfyAll = "{type: '" + type + "' , project: '" + selection + "' , dataType: '" + data + "', count: " + count + "}";
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "Service.asmx/returnChart",
        data: stringfyAll, //Even if we are sending no parameters/objects to the webmethod you MUST define an empty dataset here
        contentType: "application/json; charset=utf-8",
        error: getJsonPieError,
        success: getJsonSuccess,
    });
}
function getJsonPieError() {
    document.getElementById("Chart").innerHTML = "error";
}
function getJsonSuccess(response) {
    //msg is the payload that's returned. I'm assigning the name msg to it. But it exists whether or not you do (you just
    //cant do anything with it if you don't give it a name. obviously.
    //out = buildGraphData(msg.d);
    var data = response.d;
    var count = data[0];
    data.shift();
    var type = document.getElementById("ChartSelect" + count);
    var graphType = type.options[type.selectedIndex].value;
    var canvas = document.getElementById("canvas" + count);
    if (chartHold[count]) {
        chartHold[count].destroy();
    }
    var newGraph = canvas.getContext("2d"); //get html5 canvas 2d element.

    if (graphType == 'Donut Chart') {
        var arr = [];
        $.each(data, function (inx, val) {
            var obj = {};
            obj.color = val.color;
            obj.value = val.value;
            obj.label = val.label;
            arr.push(obj);
        });
        chartHold[count] = new Chart(newGraph).Doughnut(arr); //draw a chart.js chart on the 2d element.
    }
    if (graphType == 'Pie Chart') {
        var arr = [];
        $.each(data, function (inx, val) {
            var obj = {};
            obj.color = val.color;
            obj.value = val.value;
            obj.label = val.label;
            arr.push(obj);
        });
        chartHold[count] = new Chart(newGraph).Pie(arr); //draw a chart.js chart on the 2d element
    }
    if (graphType == 'Bar Chart') {
        var labels = data[0];
        var dataset1 = data[1];
        var dataset2 = data[2];
        var obj = {
            labels: labels,
            datasets: [
                {
                    label: "My First dataset",
                    fillColor: "rgba(220,220,220,0.5)",
                    strokeColor: "rgba(220,220,220,0.8)",
                    highlightFill: "rgba(220,220,220,0.75)",
                    highlightStroke: "rgba(220,220,220,1)",
                    data: dataset1
                },
                {
                    label: "Second dataset",
                    fillColor: "rgba(151,187,205,0.5)",
                    strokeColor: "rgba(151,187,205,0.8)",
                    highlightFill: "rgba(151,187,205,0.75)",
                    highlightStroke: "rgba(151,187,205,1)",
                    data: dataset2
                }
            ]
        };
        chartHold[count] = new Chart(newGraph).Bar(obj); //draw a chart.js chart on the 2d element.
    }
    if (graphType == 'Line Chart') {
        var labels = data[0];
        var dataset1 = data[1];
        var dataset2 = data[2];
        var obj = {
            labels: labels,
            datasets: [
                {
                    label: "My First dataset",
                    fillColor: "rgba(220,220,220,0.2)",
                    strokeColor: "rgba(220,220,220,1)",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                    data: dataset1
                },
                {
                    label: "Second dataset",
                    fillColor: "rgba(151,187,205,0.2)",
                    strokeColor: "rgba(151,187,205,1)",
                    pointColor: "rgba(151,187,205,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,1)",
                    data: dataset2
                }
            ]
        };
        chartHold[count] = new Chart(newGraph).Line(obj); //draw a chart.js chart on the 2d element.
    }
}