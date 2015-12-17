<%@ Page Title="" Language="C#" MasterPageFile="~/EditDataPages/EditData.master" AutoEventWireup="true" CodeFile="editCompost.aspx.cs" Inherits="EditDataPages_editFishPro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder5" Runat="Server">
    

    <asp:Label ID="ExceptionDetails" runat="server" CssClass="Warning"></asp:Label>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="datapointID" DataSourceID="LinqDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="datapointID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="datapointID" />
            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
            <asp:BoundField DataField="weight" HeaderText="weight" SortExpression="weight" />
            <asp:BoundField DataField="percentGrains" HeaderText="% Grains" SortExpression="percentGrains" />
            <asp:BoundField DataField="percentFruit" HeaderText="% Fruit" SortExpression="percentFruit" />
            <asp:BoundField DataField="percentVeg" HeaderText="% Veg" SortExpression="percentVeg" />
            <asp:BoundField DataField="percentDairy" HeaderText="% Dairy" SortExpression="percentDairy" />
            <asp:BoundField DataField="percentPaper" HeaderText="% Paper" SortExpression="percentPaper" />
            <asp:BoundField DataField="percentCoffeeGrounds" HeaderText="% CoffeeGrounds" SortExpression="percentCoffeeGrounds" />
            <asp:CheckBoxField DataField="trashPresent" HeaderText="trash?" SortExpression="trashPresent" />
            <asp:BoundField DataField="wasteType" HeaderText="wasteType" SortExpression="wasteType" />
            <asp:BoundField DataField="Vendor" HeaderText="Vendor" SortExpression="Vendor" />
            <asp:BoundField DataField="percentOilFull" HeaderText="% Oil Full" SortExpression="percentOilFull" />
        </Columns>
        <EditRowStyle CssClass="gridviewEdit" BackColor="#3aac74"/>
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
    <asp:LinqDataSource ID="LinqDataSource2" runat="server" EntityTypeName="">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="datapointID desc" TableName="Composts">
    </asp:LinqDataSource>
    















</asp:Content>

