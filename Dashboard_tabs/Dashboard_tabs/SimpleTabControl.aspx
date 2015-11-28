<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SimpleTabControl.aspx.cs"
    Inherits="SimpleTabControl.SimpleTabControl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel= "stylesheet" type="text/css" href="../Style/Tabs.css"></link>
    <link rel= "stylesheet" type="text/css" href="../Style/Moves_Drags.css"></link>
 <!--   <style src="../Style/Moves_Drags.css"></style>-->
    <script src="../Scripts/Chart.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="../Style/style.css" type="text/css" media="screen" />
    <script type="text/javascript" src="../Scripts/redips-drag-min.js"></script>
    <script src="./Scripts/jquery-2.1.4.js"></script>
    <script src="./Scripts/jquery-ui-1.11.4.js"></script>
   <!-- <script src="../Scripts/Create_Graph_Widget.js"></script>-->
    <script src="../Scripts/Moving.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" align="center">
        <tr>
            <td>
                <asp:Button Text="Dashboard" BorderStyle="None" ID="Tab1" CssClass="Initial" runat="server"
                    OnClick="Tab1_Click" />
                <asp:Button Text="Input Data" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server"
                    OnClick="Tab2_Click" />
                <asp:Button Text="User Group" BorderStyle="None" ID="Tab3" CssClass="Initial" runat="server"
                    OnClick="Tab3_Click" />
                <asp:MultiView ID="MainView" runat="server">
                    <asp:View ID="View1" runat="server">
                       <br />
                        <br />
                        <div id="redips-drag">
                            <table id="table1" style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                              <!-- define table columns -->
				                    <!-- message line -->
				                    <tr>
					                    <th colspan="3" id="message" class="redips-mark" title="Message line">Message line</th>
				                    </tr>
				                    <!-- table data -->
				                    <tr>
                                        <td>
					                        <div id="main" class="redips-drag t1" style="min-width: 310px; height: 400px; margin: 0 auto">
                                                    <!--<canvas id="canvas1"></canvas>-->
                                                <script>
                                                    $(function () {
                                                        $('#main').highcharts({
                                                            title: {
                                                                text: 'Monthly Average Temperature',
                                                                x: -20 //center
                                                            },
                                                            subtitle: {
                                                                text: 'Source: WorldClimate.com',
                                                                x: -20
                                                            },
                                                            xAxis: {
                                                                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                                                                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                                                            },
                                                            yAxis: {
                                                                title: {
                                                                    text: 'Temperature (°C)'
                                                                },
                                                                plotLines: [{
                                                                    value: 0,
                                                                    width: 1,
                                                                    color: '#808080'
                                                                }]
                                                            },
                                                            tooltip: {
                                                                valueSuffix: '°C'
                                                            },
                                                            legend: {
                                                                layout: 'vertical',
                                                                align: 'right',
                                                                verticalAlign: 'middle',
                                                                borderWidth: 0
                                                            },
                                                            series: [{
                                                                name: 'Tokyo',
                                                                data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
                                                            }, {
                                                                name: 'New York',
                                                                data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
                                                            }, {
                                                                name: 'Berlin',
                                                                data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
                                                            }, {
                                                                name: 'London',
                                                                data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
                                                            }]
                                                        });
                                                    });
                                                </script>
                                             </div>
                                        </td>
					                    <td>
                                            

					                    </td>
					                    <td><div id="link1" class="redips-drag t1">Example 20<br/><a href="example20/">Clone and delete table rows</a></div></td>
				                    </tr>
                                    <tr>
					                    <td></td>
					                    <td></td>
					                    <td></td>
				                    </tr>
				                    <tr>
					                    <td></td>
					                    <td></td>
					                    <td></td>
				                    </tr>
                               </table>
                           </div>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <br />
                        <h3>
                            View 2
                        </h3>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <br />
                        <h3>
                            View 3
                        </h3>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
    </form>
    <p> Graphs are provided by Highcharts which is part of Highsoft software production which can be used under the Creative Commons Attribution-NonCommercial 3.0 License (http://shop.highsoft.com/highcharts.html) which can be used for a unversity.</p>
    <p>Thus these graphs are not free to commerical use. Please visit http://www.highcharts.com/ to learn more information about this product and the terms and conditions. </p>
    <p>As students at California State University, Sacramento (CSUS) (http://www.csus.edu/) doing a Computer Sceicne senior project for one of the campus entinties STORC (http://www.csus.edu/storc/) we follow under the non-commerical use of the product.</p>
</body>
</html>
