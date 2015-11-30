<%@ Page Title="" Language="C#" MasterPageFile="~/mgmt.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="datapointID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
            <asp:BoundField DataField="weight" HeaderText="weight" SortExpression="weight" />
            <asp:BoundField DataField="datapointID" HeaderText="datapointID" InsertVisible="False" ReadOnly="True" SortExpression="datapointID" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:cdjamConnectionString %>" DeleteCommand="DELETE FROM [foodWaste] WHERE [datapointID] = @original_datapointID AND [date] = @original_date AND [weight] = @original_weight" InsertCommand="INSERT INTO [foodWaste] ([date], [weight]) VALUES (@date, @weight)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [date], [weight], [datapointID] FROM [foodWaste]" UpdateCommand="UPDATE [foodWaste] SET [date] = @date, [weight] = @weight WHERE [datapointID] = @original_datapointID AND [date] = @original_date AND [weight] = @original_weight">
        <DeleteParameters>
            <asp:Parameter Name="original_datapointID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_date" />
            <asp:Parameter Name="original_weight" Type="Double" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="date" />
            <asp:Parameter Name="weight" Type="Double" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="date" />
            <asp:Parameter Name="weight" Type="Double" />
            <asp:Parameter Name="original_datapointID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_date" />
            <asp:Parameter Name="original_weight" Type="Double" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="datapointID" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
            <asp:BoundField DataField="weight" HeaderText="weight" SortExpression="weight" />
            <asp:BoundField DataField="percentGrains" HeaderText="percentGrains" SortExpression="percentGrains" />
            <asp:BoundField DataField="percentFruit" HeaderText="percentFruit" SortExpression="percentFruit" />
            <asp:BoundField DataField="percentVeg" HeaderText="percentVeg" SortExpression="percentVeg" />
            <asp:BoundField DataField="percentDairy" HeaderText="percentDairy" SortExpression="percentDairy" />
            <asp:BoundField DataField="datapointID" HeaderText="datapointID" InsertVisible="False" ReadOnly="True" SortExpression="datapointID" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:cdjamConnectionString %>" DeleteCommand="DELETE FROM [foodWaste] WHERE [datapointID] = @original_datapointID AND [date] = @original_date AND [weight] = @original_weight AND [percentGrains] = @original_percentGrains AND [percentFruit] = @original_percentFruit AND [percentVeg] = @original_percentVeg AND [percentDairy] = @original_percentDairy" InsertCommand="INSERT INTO [foodWaste] ([date], [weight], [percentGrains], [percentFruit], [percentVeg], [percentDairy]) VALUES (@date, @weight, @percentGrains, @percentFruit, @percentVeg, @percentDairy)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [foodWaste]" UpdateCommand="UPDATE [foodWaste] SET [date] = @date, [weight] = @weight, [percentGrains] = @percentGrains, [percentFruit] = @percentFruit, [percentVeg] = @percentVeg, [percentDairy] = @percentDairy WHERE [datapointID] = @original_datapointID AND [date] = @original_date AND [weight] = @original_weight AND [percentGrains] = @original_percentGrains AND [percentFruit] = @original_percentFruit AND [percentVeg] = @original_percentVeg AND [percentDairy] = @original_percentDairy">
        <DeleteParameters>
            <asp:Parameter Name="original_datapointID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_date" />
            <asp:Parameter Name="original_weight" Type="Double" />
            <asp:Parameter Name="original_percentGrains" Type="Double" />
            <asp:Parameter Name="original_percentFruit" Type="Double" />
            <asp:Parameter Name="original_percentVeg" Type="Double" />
            <asp:Parameter Name="original_percentDairy" Type="Double" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="date" />
            <asp:Parameter Name="weight" Type="Double" />
            <asp:Parameter Name="percentGrains" Type="Double" />
            <asp:Parameter Name="percentFruit" Type="Double" />
            <asp:Parameter Name="percentVeg" Type="Double" />
            <asp:Parameter Name="percentDairy" Type="Double" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="date" />
            <asp:Parameter Name="weight" Type="Double" />
            <asp:Parameter Name="percentGrains" Type="Double" />
            <asp:Parameter Name="percentFruit" Type="Double" />
            <asp:Parameter Name="percentVeg" Type="Double" />
            <asp:Parameter Name="percentDairy" Type="Double" />
            <asp:Parameter Name="original_datapointID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_date" />
            <asp:Parameter Name="original_weight" Type="Double" />
            <asp:Parameter Name="original_percentGrains" Type="Double" />
            <asp:Parameter Name="original_percentFruit" Type="Double" />
            <asp:Parameter Name="original_percentVeg" Type="Double" />
            <asp:Parameter Name="original_percentDairy" Type="Double" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

