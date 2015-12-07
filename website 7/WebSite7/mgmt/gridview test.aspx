<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gridview test.aspx.cs" Inherits="mgmt_gridview_test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="datapointID" DataSourceID="fwSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="datapointID" HeaderText="datapointID" ReadOnly="True" SortExpression="datapointID" />
                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                <asp:BoundField DataField="weight" HeaderText="weight" SortExpression="weight" />
                <asp:BoundField DataField="percentGrains" HeaderText="percentGrains" SortExpression="percentGrains" />
                <asp:BoundField DataField="percentFruit" HeaderText="percentFruit" SortExpression="percentFruit" />
                <asp:BoundField DataField="percentVeg" HeaderText="percentVeg" SortExpression="percentVeg" />
                <asp:BoundField DataField="percentDairy" HeaderText="percentDairy" SortExpression="percentDairy" />
            </Columns>
        </asp:GridView>
        <asp:EntityDataSource ID="fwSource1" runat="server" ConnectionString="name=cdjamEntities2" DefaultContainerName="cdjamEntities2" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="foodWastes" EntityTypeFilter="foodWaste">
        </asp:EntityDataSource>
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="datapointID" DataSourceID="LinqDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                <asp:BoundField DataField="weight" HeaderText="weight" SortExpression="weight" />
                <asp:BoundField DataField="percentGrains" HeaderText="percentGrains" SortExpression="percentGrains" />
                <asp:BoundField DataField="percentFruit" HeaderText="percentFruit" SortExpression="percentFruit" />
                <asp:BoundField DataField="percentVeg" HeaderText="percentVeg" SortExpression="percentVeg" />
                <asp:BoundField DataField="percentDairy" HeaderText="percentDairy" SortExpression="percentDairy" />
                <asp:BoundField DataField="datapointID" HeaderText="datapointID" InsertVisible="False" ReadOnly="True" SortExpression="datapointID" />
            </Columns>
        </asp:GridView>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="date" TableName="foodWastes">
        </asp:LinqDataSource>
    </form>
</body>
</html>
