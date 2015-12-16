<%@ Page Title="" Language="C#" MasterPageFile="~/EditDataPages/EditData.master" AutoEventWireup="true" CodeFile="editVermi.aspx.cs" Inherits="EditDataPages_editVermi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder5" Runat="Server">







    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" />
            <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" />
            <asp:BoundField DataField="VolumeCompostProduced" HeaderText="Volume Produced" SortExpression="VolumeCompostProduced" />
            <asp:BoundField DataField="BedTemperature" HeaderText="Bed Temp" SortExpression="BedTemperature" />
            <asp:BoundField DataField="BedMoisture" HeaderText="Bed Moisture" SortExpression="BedMoisture" />
            <asp:BoundField DataField="TeaProduced" HeaderText="Tea Produced" SortExpression="TeaProduced" />
            <asp:BoundField DataField="ProductionCost" HeaderText="Production Cost" SortExpression="ProductionCost" />
            <asp:BoundField DataField="MarketValue" HeaderText="Market Value" SortExpression="MarketValue" />
            <asp:BoundField DataField="WormsAdded" HeaderText="Worms Added" SortExpression="WormsAdded" />
            <asp:BoundField DataField="WormRemoved" HeaderText="Worm Removed" SortExpression="WormRemoved" />
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
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="EndDate desc" TableName="Vermicultures">
    </asp:LinqDataSource>







</asp:Content>

