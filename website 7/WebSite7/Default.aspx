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
  <title>PieChart Example</title>
</head>
<body>
  <form id="form1" runat="server">
       <asp:Button ID="Button1" runat="server" Text="Button1"/>
      <asp:Button ID="Button2" runat="server" Text="Button2" onclick="Button2_Click"/>
        <div id="jsontype" onclick="getJsonPie();" style="height:50px; width:100px; border:dashed; background-color:green;">Click Here for Pie Chart</div>
      <div id="RSSContent"style="border:dashed; overflow:auto; height:auto;"></div>

      <canvas id="canvas2"></canvas>
      <div id="buttontest" style="height:100px; border:dashed; overflow:auto;" onclick="DynamicDiv();">CLICK ME TO MAKE A NEW PIE CHART!!
          <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="/mgmt/Default.aspx">HyperLink</asp:HyperLink>
          <asp:HyperLink ID="HyperLink2" runat="server">HyperLink</asp:HyperLink>
          <asp:HyperLink ID="HyperLink3" runat="server">HyperLink</asp:HyperLink>
       </div>
 

 
 <!-- <script type="text/javascript" src="Scripts/Default.js"></script> -->
    <script>
        var out;
        var count = 0;
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

        function newPie()
        {
                var dynDiv = document.createElement("div");
                dynDiv.id = "divDyna";
                dynDiv.innerHTML = "Created using JavaScript";
                dynDiv.style.height = "20px";
                dynDiv.style.width = "300px";
                dynDiv.style.backgroundColor = 'gray';
                document.getElementById("RSSContent").appendChild(dynDiv);
        }

        function getJsonPie()
        {
            
            $.ajax({
                type: "POST",
                url: "Service.asmx/returnGraphStuff",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function () { document.getElementById("jsontype").innerHTML = "error"; },
                success: function (msg) {
                    out = buildGraphData(msg.d);
                    var ctx_donut = document.getElementById("canvas2").getContext("2d");
                    window.myDoughnut = new Chart(ctx_donut).Doughnut(out);
                }
            });
        }

        function getJsonLine() {
            $.ajax({
                type: "POST",
                url: "Service.asmx/returnGraphStuff",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function () { document.getElementById("jsontype").innerHTML = "error"; },
                success: function (msg) {
                    out = buildGraphData(msg.d);
                    var ctx_Line = document.getElementById("canvas2").getContext("2d");
                    window.myLine = new Chart(ctx_Line).Line(out);
                }
            });
        }

        function DynamicDiv() {
            var dynDiv = document.createElement("canvas");
            dynDiv.id = "graphcanvas"+count;
            dynDiv.innerHTML = "Created using JavaScript";
            dynDiv.style.height = "auto";
            dynDiv.style.width = "auto";
            dynDiv.style.backgroundColor = 'gray';
            document.getElementById("RSSContent").appendChild(dynDiv);
            var ctx_donut = document.getElementById(dynDiv.id).getContext("2d");
            window.myDoughnut = new Chart(ctx_donut).Doughnut(out);
            count++;
        }
       
        //var jsondata = {};
        //var test = { graph: [1, 2, 3, 4, 5] };
        //$('#jsontype').html(test['graph']);
        //var out;
       // $('#jsontype').click(getJsonPie());
        //{
       //     getJsonPie(evt);
      //  }
        
      //  );
        /*
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
        */
    </script>
      </form>
</body>
</html>
