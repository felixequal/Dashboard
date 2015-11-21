<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<head runat="server">
    <link href="../Style/stylesheet.css" rel="stylesheet" />
</head>
<body class ="bodyColor">
    <div class ="header">   
        <h1>STORC Data Entry</h1>
    </div>
    <form class = "nameEntry" runat="server">
            <section>
                <div = class ="firstName">
                    <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
                    <asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
                </div>
                <div = class ="lastName">
                    <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
                    <asp:TextBox ID="LastName" runat="server"></asp:TextBox>
            </div>
        </section>
    </form>
</body>
