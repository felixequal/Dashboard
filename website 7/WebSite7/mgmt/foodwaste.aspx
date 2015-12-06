<%@ Page Title="" Language="C#" MasterPageFile="~/mgmt.master" AutoEventWireup="true" CodeFile="foodwaste.aspx.cs" Inherits="mgmt_foodwaste" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--<asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
   -->
    
   
        Date<asp:TextBox ID="DateInputBox" runat="server"></asp:TextBox>
    
   
        Weight<asp:TextBox ID="WeightInputBox" runat="server">Enter Weight</asp:TextBox>
        Percent Grains<asp:TextBox ID="GrainsInputBox" runat="server">%</asp:TextBox>
        Percent Fruit<asp:TextBox ID="FruitInputBox" runat="server">%</asp:TextBox>
        Percent Vegetables<asp:TextBox ID="VegInputBox" runat="server">%</asp:TextBox>
        Percent Dairy<asp:TextBox ID="DairyInputBox" runat="server" CssClass="auto-style1" Width="128px">%</asp:TextBox>
<asp:Button ID="Submitfw" runat="server" Text="Submit" OnClick="submitfw_Click"></asp:Button>
    <asp:GridView ID="GridView2" runat="server" OnRowEditing="ASPxGridView1_RowUpdating">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>      
    <asp:Button ID="submitToDB" runat="server" Text="COMMIT" OnClick="submitToDB_Click" />
   
        

    </asp:Content>

