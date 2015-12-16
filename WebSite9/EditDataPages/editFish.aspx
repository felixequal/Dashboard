<%@ Page Title="" Language="C#" MasterPageFile="~/EditDataPages/EditData.master" AutoEventWireup="true" CodeFile="editFish.aspx.cs" Inherits="EditDataPages_editFish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder5" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="TankLocation" HeaderText="Location" SortExpression="TankLocation" />
            <asp:BoundField DataField="Specie" HeaderText="Species" SortExpression="Specie" />
            <asp:BoundField DataField="NumberOfFish" HeaderText="# Fish" SortExpression="NumberOfFish" />
            <asp:BoundField DataField="TankTemp" HeaderText="Temp" SortExpression="TankTemp" />
            <asp:BoundField DataField="HealthOfFish" HeaderText="Health" SortExpression="HealthOfFish" />
            <asp:BoundField DataField="QualityOfWater" HeaderText="Water Quality" SortExpression="QualityOfWater" />
            <asp:BoundField DataField="LastDateOfWaterChange" HeaderText="Water Changed" SortExpression="LastDateOfWaterChange" />
            <asp:BoundField DataField="DateBufferAdded" HeaderText="Buffer Added" SortExpression="DateBufferAdded" />
            <asp:BoundField DataField="AmountBufferAdded" HeaderText="Amount Buffer" SortExpression="AmountBufferAdded" />
            <asp:BoundField DataField="DateLastFed" HeaderText="Last Fed" SortExpression="DateLastFed" />
            <asp:BoundField DataField="AmountFed" HeaderText="Amount Fed" SortExpression="AmountFed" />
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
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="Date desc" TableName="AquaFishes">
    </asp:LinqDataSource>
</asp:Content>

