<%@ Page Language="C#" AutoEventWireup="true" CodeFile="-- OLD --CreateNewWidget.aspx.cs" Inherits="CreateNewWidget" %>

<!DOCTYPE html>

<html>
    <head runat="server">
        <script src="./Scripts/Chart.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
        <script src="./Scripts/jquery-2.1.4.js"></script>
        <script src="./Scripts/jquery-ui-1.11.4.js"></script>
        <style>
            #draggable 
                width: 150px;
                height: 150px;
                padding: 0.5em;
            }
        </style>
        <title>PieChart Example</title>
    </head>
    <body>
        <form id="form1" runat="server">
            <asp:Label ID="WidgetTypeSelectionLabel" runat="server" Text="Select the type of Widget you would like to Create"></asp:Label>
            <asp:DropDownList ID="WidgetTypeSelection" runat="server" AutoPostBack="True" OnSelectedIndexChanged="WidgetTypeSelection_SelectionIndexChanged"></asp:DropDownList>
            <br />
            <asp:Label ID="ProjectSelectionLabel" runat="server" Text="Please Select a Project" Visible="False"></asp:Label>
            <asp:DropDownList ID="ProjectSelection" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ProjectSelection_SelectedIndexChanged" Visible="False"></asp:DropDownList>
            <br/>
            <asp:Label ID="ProjectDataSelectLabel" runat="server" Text="Please select data to view from a project" Visible="False"></asp:Label>
            <asp:DropDownList ID="ProjectDataSelect" runat="server" AutoPostBack="True" Visible="False">
            </asp:DropDownList>
            <br />
            <div id="PieChart" onclick="getJsonPie();" style="height:50px; width:100px; border:dashed; background-color:green;">Click Here for Pie Chart</div>
            <div id="RSSContent"style="border:dashed; overflow:auto; height:auto;"></div>
    
            <canvas id="canvas2"></canvas>
            <script>
            //clicking on the div that calls this function (currently "jsontype", green box) calls this. This function runs a jquery ajax call
            //the ($.ajax() function).  Some parameters are optional, but the type, data, url and success are not.  data is the data to SEND to
            //the URL.  "success" is what to do when this function succeeds. The return payload is AUTOMATICALLY returned to the "success" field.
            //in this example, "function (msg)" msg is the name I gave to the returned information. You can call it whatever you want. The object's payload
            //is denoted with the .d (it can be thought of as a wrapper).  So to access anything that comes back down the pipe you have to use "whatever.d".
            //The anonymous function "function (msg)" gets the canvas 2d element and draws a new chart on it.
                function getJsonPie()
                {
                    var graphType = document.getElementById('WidgetTypeSelection').value;
                    var project = document.getElementById('ProjectSelection').value;
                    var dataType = document.getElementById('ProjectDataSelect').value;

                    var stringfyAll = "{type: '" + graphType + "' , project: '" + project + "' , dataType: '" + dataType +"'}";
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
                function getJsonSuccess(response){
                    //msg is the payload that's returned. I'm assigning the name msg to it. But it exists whether or not you do (you just
                    //cant do anything with it if you don't give it a name. obviously.
                    //out = buildGraphData(msg.d);
                    var data = response.d;
                    var graphType = document.getElementById('WidgetTypeSelection').value;
                    var newGraph = document.getElementById("canvas2").getContext("2d"); //get html5 canvas 2d element.

                    if (graphType == 'Donut Chart') {
                        var arr = [];
                        $.each(data, function (inx, val) {
                            var obj = {};
                            obj.color = val.color;
                            obj.value = val.value;
                            obj.label = val.label;
                            arr.push(obj);
                        });
                        new Chart(newGraph).Doughnut(arr); //draw a chart.js chart on the 2d element.
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
                        new Chart(newGraph).Pie(arr); //draw a chart.js chart on the 2d element.
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
                        new Chart(newGraph).Bar(obj); //draw a chart.js chart on the 2d element.
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
                        new Chart(newGraph).Line(obj); //draw a chart.js chart on the 2d element.
                    }
                }
                //same as getJsonPie except that we make a line graph instead of a pie graph. the object that we need from the webmethod has different fields
                //for a line chart though. Pie expects a series of objects with ONE data element for EACH object. Line charts expect an array of data element values.
                //This has not been taken care of on the webmethod side yet so this function will never work right till that's fixed. See chart.js documentation for more details.
       

            </script>
        </form>
    </body>
</html>
