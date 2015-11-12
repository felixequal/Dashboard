<%@ Page Title="" Language="C#" MasterPageFile="~/mgmt.master" AutoEventWireup="true" CodeFile="stuff.aspx.cs" Inherits="mgmt_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="DataID" DataSourceID="SqlDataSource1" DefaultMode="Insert" EnableModelValidation="True" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="DataID" HeaderText="DataID" ReadOnly="True" SortExpression="DataID" />
            <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DataID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" EnableModelValidation="True" Width="211px">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="DataID" HeaderText="DataID" ReadOnly="True" SortExpression="DataID" />
            <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cdjamConnectionString1 %>" DeleteCommand="DELETE FROM [data] WHERE [DataID] = @DataID" InsertCommand="INSERT INTO [data] ([DataID], [data]) VALUES (@DataID, @data)" ProviderName="<%$ ConnectionStrings:cdjamConnectionString1.ProviderName %>" SelectCommand="SELECT [DataID], [data] FROM [data]" UpdateCommand="UPDATE [data] SET [data] = @data WHERE [DataID] = @DataID">
        <DeleteParameters>
            <asp:Parameter Name="DataID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DataID" Type="Int32" />
            <asp:Parameter Name="data" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="data" Type="Int32" />
            <asp:Parameter Name="DataID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

