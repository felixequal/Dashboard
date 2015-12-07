<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="STORCDashboard.aspx.cs" Inherits="STORC_Dashboard.STORCDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>STORC Dashboard</title>
    <link rel="stylesheet" type="text/css" href="../Style/gridster.css"/>
    <link rel="stylesheet" type="text/css" href="../Style/gridster_help.css" />
    <link rel="stylesheet" type="text/css" href="../Style/Tabs.css" />
    <link rel="stylesheet" type="text/css" href="../Style/colors.css" />
    <script type="text/javascript" src="../Scripts/jquery-2.1.4.js"></script>
    <script src="../Scripts/gridster.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="../Scripts/Chart.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui-1.11.4.js"></script>
    <script type="text/javascript" src="../Scripts/snap_grid.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <table align="left" border="0">
                <tr>
                    <td>
                        <asp:Button Text="Dashboard" BorderStyle="None" ID="Tab1" CssClass="Initial" runat="server" OnClick="Tab1_Click" />
                        <asp:Button Text="Input Data" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server" OnClick="Tab2_Click" />
                        <asp:Button Text="User Group" BorderStyle="None" ID="Tab3" CssClass="Initial" runat="server" OnClick="Tab3_Click" />
                    </td>
                </tr>
        </table>
        <asp:MultiView ID="MainView" runat="server">
            <asp:View ID="View1" runat="server"> 
            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <br />
                <br />
               <table align="left" border="0">
                <tr>
                    <td>
                        <asp:Button Text="Aquaponics" BorderStyle="None" ID="Aquaponics" CssClass="Initial_DataSub_aqua" runat="server" OnClick="aqua_Click" />
                        <asp:Button Text="Vermiculture" BorderStyle="None" ID="Vermiculture" CssClass="Initial_DataSub_vermi" runat="server" OnClick="vermi_Click" />
                        <asp:Button Text="Compost" BorderStyle="None" ID="Compost" CssClass="Initial_DataSub_comp" runat="server" OnClick="comp_Click" />
                        <asp:Button Text="Energy" BorderStyle="None" ID="Energy" CssClass="Initial_DataSub_energy" runat="server" OnClick="energy_Click" />
                        <asp:Button Text="Biodiesel" BorderStyle="None" ID="Biodiesel" CssClass="Initial_DataSub_bio" runat="server" OnClick="bio_Click" />
                    </td>
                </tr>
                </table>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <br />
                <br />
                <br />
               <table align="left" border="0">
                <tr>
                    <td>
                        <asp:Button Text="Add User" BorderStyle="None" ID="add_user" CssClass="Initial_adduser" runat="server" OnClick="adduser_Click" />
                        <asp:Button Text="Delete User" BorderStyle="None" ID="delete_user" CssClass="Initial_deleteuser" runat="server" OnClick="deleteuser_Click" />
                        <asp:Button Text="Manage User" BorderStyle="None" ID="manage_user" CssClass="Initial_manageuser" runat="server" OnClick="manageuser_Click" />
                    </td>
                </tr>
                </table>
            </asp:View>
        </asp:MultiView>

    </form>
</body>
</html>
