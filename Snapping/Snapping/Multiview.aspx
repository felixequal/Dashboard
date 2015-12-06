<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Multiview.aspx.cs" Inherits="Snapping.Multiview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>STORC Dashboard</title>
    <link rel="stylesheet" type="text/css" href="../Style/gridster.css"/>
    <link rel="stylesheet" type="text/css" href="../Style/test.css" />
    <link rel="stylesheet" type="text/css" href="../Style/Tabs.css" />
    <script type="text/javascript" src="../Scripts/jquery-2.1.4.js"></script>
    <script src="../Scripts/gridster.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="../Scripts/Chart.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui-1.11.4.js"></script>
    <script type="text/javascript" src="../Scripts/snap_grid.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <table width="80%" align="center">
            <tr>
                <td>
                    <asp:Button Text="Dashboard" BorderStyle="None" ID="Tab1" CssClass="Initial" runat="server" OnClick="Tab1_Click" />
                    <asp:Button Text="Input Data" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server" OnClick="Tab2_Click" />
                    <asp:Button Text="User Group" BorderStyle="None" ID="Tab3" CssClass="Initial" runat="server" OnClick="Tab3_Click" />
                    <asp:Button Text="Calander" BorderStyle="None" ID="Tab4" CssClass="Initial" runat="server" OnClick="Tab4_Click" />
                    <asp:MultiView ID="MainView" runat="server">
                        <asp:View ID="View1" runat="server">
                            <br />
                            <br />
                            <style>
        
                        .deleteWidgetDiv {
                            background: #999;
                            float: right;
                            font-size: 12px;
                            padding: 4px 4px 0px ;
                            cursor: pointer;
                        }

                        .gridster li header .dragDiv {
                                    background: #AAA;
                                    font-size: 12px;
                                    display: block;
                                    padding: 4px 0 0px ;
                                    cursor: move;
                                }
                            </style>
                            <div>
                                <form>
                                    <p>Add new widget:</p>

                                    <button id="addLineWidgetButton">Add Line Chart widget</button>
                                    <button id="addBarWidgetButton">Add Bar Chart widget</button>
                                    <button id="addPieWidgetButton">Add Pie Chart widget</button>
                                </form>
                            </div>
                            <div class="gridster">
                                <ul>
                                    <li data-row="4" data-col="4" data-sizex="2" data-sizey="1">
                                        <header>
                                            <div class="deleteWidgetDiv">X</div>
                                            <div class="dragDiv">Chart Widget</div>
                                        </header>
                                        <canvas id="canvas1"></canvas>

               
                                    </li>

                                </ul>

                            </div>
                            <script>
                                var count = 2;
                                var gridster;

                                $(function () {

                                    gridster = $(".gridster ul").gridster({
                                        widget_base_dimensions: [200, 200],
                                        widget_margins: [10, 10],
                                        helper: 'clone',
                                        avoid_overlapped_widgets: true,
                                        draggable: {
                                            handle: '.dragDiv'
                                        }
                                    }).data('gridster');

                                    $(document).on("click", "#addLineWidgetButton", function (e) {
                                        e.preventDefault();
                                        var wid = document.createElement("li");
                                        var head = document.createElement("header");
                                        var deletewid = document.createElement("div");
                                        deletewid.classList.add("deleteWidgetDiv");
                                        deletewid.innerHTML = "X";
                                        var dragwid = document.createElement("div");
                                        dragwid.classList.add("dragDiv");
                                        dragwid.innerHTML = "Line Chart";
                                        var can = document.createElement("canvas");
                                        can.id = "canvas" + count;
                                        can.innerHTML = "this is me no graph";
                                        head.appendChild(deletewid);
                                        head.appendChild(dragwid);
                                        wid.appendChild(head);
                                        wid.appendChild(can);
                                        gridster.add_widget.apply(gridster, [wid, 2, 1]);
                                        var ctx2 = document.getElementById(can.id).getContext("2d");
                                        var myLines = new Chart(ctx2).Line(data);
                                        count++;
                                    });

                                    $(document).on("click", "#addBarWidgetButton", function (e) {
                                        e.preventDefault();
                                        var wid = document.createElement("li");
                                        var head = document.createElement("header");
                                        var deletewid = document.createElement("div");
                                        deletewid.classList.add("deleteWidgetDiv");
                                        deletewid.innerHTML = "X";
                                        var dragwid = document.createElement("div");
                                        dragwid.classList.add("dragDiv");
                                        dragwid.innerHTML = "Bar Chart";
                                        var can = document.createElement("canvas");
                                        can.id = "canvas" + count;
                                        can.innerHTML = "this is me no graph";
                                        head.appendChild(deletewid);
                                        head.appendChild(dragwid);
                                        wid.appendChild(head);
                                        wid.appendChild(can);
                                        gridster.add_widget.apply(gridster, [wid, 2, 1]);
                                        var ctx_bars = document.getElementById(can.id).getContext("2d");
                                        window.myBar = new Chart(ctx_bars).Bar(barChartData);
                                        count++;
                                    });

                                    $(document).on("click", "#addPieWidgetButton", function (e) {
                                        e.preventDefault();
                                        var wid = document.createElement("li");
                                        var head = document.createElement("header");
                                        var deletewid = document.createElement("div");
                                        deletewid.classList.add("deleteWidgetDiv");
                                        deletewid.innerHTML = "X";
                                        var dragwid = document.createElement("div");
                                        dragwid.classList.add("dragDiv");
                                        dragwid.innerHTML = "Pie Chart";
                                        var can = document.createElement("canvas");
                                        can.id = "canvas" + count;
                                        can.innerHTML = "this is me no graph";
                                        head.appendChild(deletewid);
                                        head.appendChild(dragwid);
                                        wid.appendChild(head);
                                        wid.appendChild(can);
                                        gridster.add_widget.apply(gridster, [wid, 1, 1]);
                                        var ctx_donuts = document.getElementById(can.id).getContext("2d");
                                        window.myDoughnut = new Chart(ctx_donuts).Doughnut(doughnutData);
                                        count++;
                                    });

                                    $(document).on("click", ".deleteWidgetDiv", function () {
                                        $(this).closest("li").addClass("activ");
                                        gridster.remove_widget($('.activ'));
                                    });


                                });
                            </script>

                            
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                                <tr>
                                    <td>
                                        <br />
                                        <br />
                                        <h3>
                                            View 2
                                        </h3>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="View3" runat="server">
                            <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                                <tr>
                                    <td>
                                        <br />
                                        <br />
                                        <h3>
                                            View 3
                                        </h3>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="View4" runat="server">
                            <br />
                            <br />

                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="400px">
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                                <DayStyle Width="14%" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                                <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                                <TodayDayStyle BackColor="#CCCC99" />
                            </asp:Calendar>

                        </asp:View>
                    </asp:MultiView>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
