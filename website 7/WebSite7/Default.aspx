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

        <div id="jsontype" style="height:50px; width:100px; border:dashed; background-color:green;">Click Here for Pie Chart</div>
      <div id="RSSContent"style="border:dashed; overflow:auto; height:100px;"></div>

      <canvas id="canvas2"></canvas>
      <div id="buttontest" style="height:100px; border:dashed; overflow:auto;"></div>
 

 
 <!-- <script type="text/javascript" src="Scripts/Default.js"></script> -->
    <script>
        
        function buildGraphData(jsonobject) {
            var graphPayload = [];
            var index;
            for (index = 0; index < jsonobject.value.length; index++) {
                graphPayload[index] = {
                    value: jsonobject.value[index],
                    color: jsonobject.color[index],
                    highlight: jsonobject.highlight[index],
                    label: jsonobject.label[index]
                };
            }
            return graphPayload;
        }
       
        var jsondata = {};
        var test = { graph: [1, 2, 3, 4, 5] };
        //$('#jsontype').html(test['graph']);
        var out;
        $('#jsontype').click(function () {
                $.ajax({
                    type: "POST",
                    url: "Service.asmx/returnGraphStuff",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    error: function () { document.getElementById("jsontype").innerHTML = "error" ;},
                    success: function (msg) {
                        out = buildGraphData(msg.d);
                        var ctx_donut = document.getElementById("canvas2").getContext("2d");
                        window.myDoughnut = new Chart(ctx_donut).Doughnut(out);
                    }
                });
        });
    </script>
      </form>
</body>
</html>
