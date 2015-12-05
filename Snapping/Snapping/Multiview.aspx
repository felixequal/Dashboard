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
                            <asp:Button Text="Add a Chart" BorderStyle="None" ID="addChart" runat="server"/>
                            <div id="tester" runat="server"></div>
                            <br />
                            <br />
                            <div class="gridster">
                                <ul>
                                    <li data-row="1" data-col="2" data-sizex="2" data-sizey="1"><canvas id="canvas1"></canvas></li>
                                    <!--<li data-row="2" data-col="1" data-sizex="1" data-sizey="1"></li>
                                    <li data-row="3" data-col="1" data-sizex="1" data-sizey="1"></li>

                                    <li data-row="1" data-col="2" data-sizex="2" data-sizey="1"></li>
                                    <li data-row="2" data-col="2" data-sizex="2" data-sizey="2"></li>

                                    <li data-row="1" data-col="4" data-sizex="1" data-sizey="1"></li>
                                    <li data-row="2" data-col="4" data-sizex="2" data-sizey="1"></li>
                                    <li data-row="3" data-col="4" data-sizex="1" data-sizey="1"></li>

                                    <li data-row="1" data-col="5" data-sizex="2" data-sizey="2"><canvas id="canvas2"></canvas></li>
                                    <li data-row="3" data-col="5" data-sizex="1" data-sizey="1"></li>

                                    <li data-row="1" data-col="6" data-sizex="1" data-sizey="1"></li>
                                    <li data-row="2" data-col="6" data-sizex="2" data-sizey="1"><canvas id="canvas3"></canvas></li>-->
                                </ul>
                            </div>
                            
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
