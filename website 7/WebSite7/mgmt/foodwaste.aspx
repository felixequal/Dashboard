<%@ Page Title="" Language="C#" MasterPageFile="~/mgmt.master" AutoEventWireup="true" CodeFile="foodwaste.aspx.cs" Inherits="mgmt_foodwaste" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--<asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
   -->
    
   <asp:Panel ID="DataEntryPanel" runat="server">
        
        Date<asp:TextBox ID="dateInputBox" runat="server"></asp:TextBox>
        Weight<asp:TextBox ID="weightInputBox" runat="server">Enter Weight</asp:TextBox>
        Percent Grains<asp:TextBox ID="percentGrainsInputBox" runat="server">%</asp:TextBox>
        Percent Fruit<asp:TextBox ID="percentFruitInputBox" runat="server">%</asp:TextBox>
        Percent Vegetables<asp:TextBox ID="percentVegInputBox" runat="server">%</asp:TextBox>
        Percent Dairy<asp:TextBox ID="percentDairyInputBox" runat="server" CssClass="auto-style1" Width="128px">%</asp:TextBox>
<asp:Button ID="Submitfw" runat="server" Text="Submit" OnClick="submitfw_Click"></asp:Button>
    </asp:Panel>
    <asp:GridView ID="GridView2" runat="server" OnRowUpdating="GridView2_RowUpdating" OnRowEditing="GridView2_RowEditing" OnRowDeleting="GridView2_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView> 
    
    <asp:Button ID="submitToDB" runat="server" Text="COMMIT" OnClick="submitToDB_Click" />
   
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="datapointID" DataSourceID="EntityDataSource1" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="datapointID" HeaderText="datapointID" ReadOnly="True" SortExpression="datapointID"></asp:BoundField>
            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date"></asp:BoundField>
            <asp:BoundField DataField="weight" HeaderText="weight" SortExpression="weight"></asp:BoundField>
            <asp:BoundField DataField="percentGrains" HeaderText="percentGrains" SortExpression="percentGrains"></asp:BoundField>
            <asp:BoundField DataField="percentFruit" HeaderText="percentFruit" SortExpression="percentFruit"></asp:BoundField>
            <asp:BoundField DataField="percentVeg" HeaderText="percentVeg" SortExpression="percentVeg"></asp:BoundField>
            <asp:BoundField DataField="percentDairy" HeaderText="percentDairy" SortExpression="percentDairy"></asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>

    <asp:EntityDataSource runat="server" ID="EntityDataSource1" DefaultContainerName="cdjamEntities2" ConnectionString="name=cdjamEntities2" EnableFlattening="False" EntitySetName="foodWastes" EntityTypeFilter="foodWaste"></asp:EntityDataSource>
</asp:Content>

