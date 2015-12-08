<%@ Page Title="" Language="C#" MasterPageFile="~/mgmt.master" AutoEventWireup="true" CodeFile="foodwaste.aspx.cs" Inherits="mgmt_foodwaste" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--<asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
   -->
    
   <asp:Panel ID="DataEntryPanel" runat="server">
        <asp:Label ID="DateLabel" runat="server" Text="Date"></asp:Label>
    <asp:TextBox ID="DateInputBox" runat="server"></asp:TextBox>
    
   
        Weight<asp:TextBox ID="WeightInputBox" runat="server">Enter Weight</asp:TextBox>
        Percent Grains<asp:TextBox ID="GrainsInputBox" runat="server">%</asp:TextBox>
        Percent Fruit<asp:TextBox ID="FruitInputBox" runat="server">%</asp:TextBox>
        Percent Vegetables<asp:TextBox ID="VegInputBox" runat="server">%</asp:TextBox>
        Percent Dairy<asp:TextBox ID="DairyInputBox" runat="server" CssClass="auto-style1" Width="128px">%</asp:TextBox>
<asp:Button ID="Submitfw" runat="server" Text="Submit" OnClick="submitfw_Click"></asp:Button>
    </asp:Panel>
    <asp:Panel ID="testPanel" runat="server">
    </asp:Panel>
    <asp:GridView ID="GridView2" runat="server" OnRowUpdating="GridView2_RowUpdating" OnRowEditing="GridView2_RowEditing" OnRowDeleting="GridView2_RowDeleting">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView> 
    
    <asp:Button ID="submitToDB" runat="server" Text="COMMIT" OnClick="submitToDB_Click" />
   
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="datapointID" DataSourceID="EntityDataSource1" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="datapointID" HeaderText="datapointID" ReadOnly="True" SortExpression="datapointID"></asp:BoundField>
            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date"></asp:BoundField>
            <asp:BoundField DataField="weight" HeaderText="weight" SortExpression="weight"></asp:BoundField>
            <asp:BoundField DataField="percentGrains" HeaderText="percentGrains" SortExpression="percentGrains"></asp:BoundField>
            <asp:BoundField DataField="percentFruit" HeaderText="percentFruit" SortExpression="percentFruit"></asp:BoundField>
            <asp:BoundField DataField="percentVeg" HeaderText="percentVeg" SortExpression="percentVeg"></asp:BoundField>
            <asp:BoundField DataField="percentDairy" HeaderText="percentDairy" SortExpression="percentDairy"></asp:BoundField>
        </Columns>
    </asp:GridView>

    <asp:EntityDataSource runat="server" ID="EntityDataSource1" DefaultContainerName="cdjamEntities2" ConnectionString="name=cdjamEntities2" EnableFlattening="False" EntitySetName="foodWastes" EntityTypeFilter="foodWaste"></asp:EntityDataSource>
</asp:Content>

