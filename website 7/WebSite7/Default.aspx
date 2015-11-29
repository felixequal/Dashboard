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
        //Beginning of javascript section.
        //This code gets the data that chart.js needs to create its graphs. a pie chart, for example, needs a bunch of objects like this:
        /*var data = [
        {
            value: 300,
            color:"#F7464A",
            highlight: "#FF5A5E",
            label: "Red"
        },
        {
        value: 50,
            color: "#46BFBD",
        highlight: "#5AD3D1",
        label: "Green"
        },
        {
            value: 100,
            color: "#FDB45C",
            highlight: "#FFC870",
            label: "Yellow"
        }
        ]
        //this is the data that comes back from the ajax call.
        */
        //Note the javascript notation here. This is an array (called "data") of objects. In otherwords data = [{object1},{object2},{object3}]. Array of objects.
        //the objects do not have names, they're just elements in the array. This is what the graph.js function wants. This is how to make a chart:
        //-------------------------------------------------------------------------
        // Get context with jQuery - using jQuery's .get() method.
        //var ctx = $("#myChart").get(0).getContext("2d");
        // This will get the first returned node in the jQuery collection.
        //var myNewChart = new Chart(ctx).<chartype>(data);
        //-----------------------------------------------------------

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

        //Create a new pie chart. It calls dynDiv (Dynamic Div) which at the moment is tied to the "out" variable which holds
        //the retrieved json object(s). What this means is that if getJsonPie() hasn't been called by clicking on the green button (currently
        //the "jsontype" id div) then there will be no data for it to show and it won't work.  tl;dr Click the green button first and this function
        //will make a new copy of the pie chart with the "out" data. This will get changed soon, obviously.
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

        //clicking on the div that calls this function (currently "jsontype", green box) calls this. This function runs a jquery ajax call
        //the ($.ajax() function).  Some parameters are optional, but the type, data, url and success are not.  data is the data to SEND to
        //the URL.  "success" is what to do when this function succeeds. The return payload is AUTOMATICALLY returned to the "success" field.
        //in this example, "function (msg)" msg is the name I gave to the returned information. You can call it whatever you want. The object's payload
        //is denoted with the .d (it can be thought of as a wrapper).  So to access anything that comes back down the pipe you have to use "whatever.d".
        //The anonymous function "function (msg)" gets the canvas 2d element and draws a new chart on it.
        function getJsonPie()
        {
            
            $.ajax({
                type: "POST",
                url: "Service.asmx/returnGraphStuff",
                data: "{}", //Even if we are sending no parameters/objects to the webmethod you MUST define an empty dataset here
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function () { document.getElementById("jsontype").innerHTML = "error"; },
                success: function (msg) { //msg is the payload that's returned. I'm assigning the name msg to it. But it exists whether or not you do (you just
                    //cant do anything with it if you don't give it a name. obviously.
                    out = buildGraphData(msg.d);
                    var ctx_donut = document.getElementById("canvas2").getContext("2d"); //get html5 canvas 2d element.
                    window.myDoughnut = new Chart(ctx_donut).Doughnut(out); //draw a chart.js chart on the 2d element.
                }
            });
        }

        //same as getJsonPie except that we make a line graph instead of a pie graph. the object that we need from the webmethod has different fields
        //for a line chart though. Pie expects a series of objects with ONE data element for EACH object. Line charts expect an array of data element values.
        //This has not been taken care of on the webmethod side yet so this function will never work right till that's fixed. See chart.js documentation for more details.
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
        //dynamically adds a new canvas in the "RSSContent" div using javascript.
        function DynamicDiv() {
            var dynDiv = document.createElement("canvas");  //create a new html5 canvas
            dynDiv.id = "graphcanvas"+count; //assign the name (html ID) to be graphcanvas plus some number (a simple incremented count); i.e graphcanvas2, etc
            dynDiv.innerHTML = "Created using JavaScript"; //this gets replaced by the graph, but if no data is given this is what is inside the canvas.
            //useful otherwise the canvas has no height and you can't even see if it worked.
            dynDiv.style.height = "auto";
            dynDiv.style.width = "auto";
            dynDiv.style.backgroundColor = 'gray'; 
            document.getElementById("RSSContent").appendChild(dynDiv); //appends the code to the RSSContent div. e.g <div id=RSSContent> <canvas id=graphcanvas5 /> </div>
            var ctx_donut = document.getElementById(dynDiv.id).getContext("2d"); //get the canvas's 2d drawing element by name.
            window.myDoughnut = new Chart(ctx_donut).Doughnut(out); //draw a pie chart in it.
            count++; //increment the name count, that way each new canvas has a unique ID.
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
