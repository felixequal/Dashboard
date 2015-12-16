<%@ Page Title="" Language="C#" MasterPageFile="~/EditDataPages/EditData.master" AutoEventWireup="true" CodeFile="editBiodiesel.aspx.cs" Inherits="EditDataPages_editBiodiesel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder5" Runat="Server">

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="BatchNumber" DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="BatchNumber" HeaderText="Batch #" InsertVisible="False" ReadOnly="True" SortExpression="BatchNumber" />
        <asp:BoundField DataField="StartRunDate" HeaderText="Start Run" SortExpression="StartRunDate" />
        <asp:BoundField DataField="EndRunDate" HeaderText="End Run" SortExpression="EndRunDate" />
        <asp:BoundField DataField="TotalProcessingTime" HeaderText="Processing Time" SortExpression="TotalProcessingTime" />
        <asp:BoundField DataField="VolumeWasteOilColleted" HeaderText="Waste Oil Collected" SortExpression="VolumeWasteOilColleted" />
        <asp:BoundField DataField="VolumeWasteOilProduced" HeaderText="Waste Oil Produced" SortExpression="VolumeWasteOilProduced" />
        <asp:BoundField DataField="VolumeBiodieselProduced" HeaderText="Biodiesel Volume" SortExpression="VolumeBiodieselProduced" />
        <asp:BoundField DataField="VolumeWasteProduced" HeaderText="Waste Volume" SortExpression="VolumeWasteProduced" />
        <asp:BoundField DataField="EnergyRequired" HeaderText="Energy Required" SortExpression="EnergyRequired" />
        <asp:BoundField DataField="MethanolUsed" HeaderText="Methanol Used" SortExpression="MethanolUsed" />
        <asp:BoundField DataField="PotassiumHydroxideUsed" HeaderText="KOH Used" SortExpression="PotassiumHydroxideUsed" />
        <asp:CheckBoxField DataField="QualityPassFail" HeaderText="Quality" SortExpression="QualityPassFail" />
        <asp:BoundField DataField="CostOfWasteOil" HeaderText="Waste Oil Cost" SortExpression="CostOfWasteOil" />
        <asp:BoundField DataField="ManHours" HeaderText="ManHours" SortExpression="ManHours" />
        <asp:BoundField DataField="CostOfDisposal" HeaderText="Disposal Cost" SortExpression="CostOfDisposal" />
        <asp:BoundField DataField="MarketCostBiodiesel" HeaderText="Market Cost" SortExpression="MarketCostBiodiesel" />
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
<asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="BatchNumber desc" TableName="Biodiesels">
</asp:LinqDataSource>

</asp:Content>

