<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html> 
<html>
<head runat="server">
     <script src="./Scripts/Chart.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <script src="./Scripts/jquery-2.1.4.js"></script>
    <script src="./Scripts/jquery-ui-1.11.4.js"></script>
    <style>
        #draggable {
            width: 150px;
            height: 150px;
            padding: 0.5em;
        }
    </style>
  <title>Delay Load User Control Example</title>
</head>
<body>
  <form id="form1" runat="server">
       <asp:Button ID="Button1" runat="server" Text="Button" />
  <div id="Container">

        <div id="jsontype" style="height:50px;"></div>
      <div id="RSSContent"style="border:dashed; overflow:auto; height:100px;"></div>
  </div>
      <canvas id="canvas2"></canvas>
      <div id="buttontest" style="height:100px; border:dashed; overflow:auto;"></div>
 

 
 <!-- <script type="text/javascript" src="Scripts/Default.js"></script> -->
    <script>
        var jsondata = {};
        var test = { graph: [1, 2, 3, 4, 5] };
        $('#jsontype').html(test['graph']);

        $('#jsontype').click(function () {
            $.ajax({
                type: "POST",
                url: "Service.asmx/HelloWorld",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $('#RSSContent').html(msg.d);
                }
            });
        });
 
            $('#buttontest').click(function() {
                $.ajax({
                    type: "POST",
                    url: "Service.asmx/returnGraphStuff",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        jsondata = msg.d.graphData;
            var doughnutData = [
                {
                    value: jsondata['0'],
                    color: "#F7464A",
                    highlight: "#FF5A5E",
                    label: "Red"
                },
                {
                    value: jsondata['1'],
                    color: "#46BFBD",
                    highlight: "#5AD3D1",
                    label: "Green"
                },
                {
                    value: jsondata['2'],
                    color: "#FDB45C",
                    highlight: "#FFC870",
                    label: "Yellow"
                },
                {
                    value: jsondata['3'],
                    color: "#949FB1",
                    highlight: "#A8B3C5",
                    label: "Grey"
                },
                {
                value: jsondata['4'],
                color: "#949FC1",
                highlight: "#A8B3C5",
                label: "blue"
                },
                {
                value: jsondata['5'],
                color: "#4D5360",
                highlight: "#616774",
                label: "Dark Grey"
                }

            ];
        var ctx_donut = document.getElementById("canvas2").getContext("2d");
        window.myDoughnut = new Chart(ctx_donut).Doughnut(doughnutData);
                    }
                });
            });       
    </script>
      </form>
</body>
</html>
