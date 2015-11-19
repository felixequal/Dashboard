<%@ Page Title="" Language="C#" MasterPageFile="~/mgmt.master" AutoEventWireup="true" CodeFile="foodwaste.aspx.cs" Inherits="mgmt_foodwaste" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem>Avg</asp:ListItem>
        <asp:ListItem>Max</asp:ListItem>
        <asp:ListItem>Total</asp:ListItem>
    </asp:DropDownList>
</asp:Content>

