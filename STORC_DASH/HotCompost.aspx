<%@ Page Title="" Language="C#" MasterPageFile="~/CompostForms.master" AutoEventWireup="true" CodeFile="HotCompost.aspx.cs" Inherits="HotCompost" %>

<asp:Content ID="Content2" ContentPlaceHolderID="hotCompHolder" Runat="Server">
<style type="text/css">
    .auto-style1 {
        position: relative;
        float: left;
    }
    #Text1 {
        position: relative;
    }
    #Notes {
        height: 56px;
        width: 313px;
    }
    #Submit1 {
        text-align: right;
    }
</style>
<!-- need this for date picker to do the calander drop down-->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<br />
<br />

<div id="hotCompost"> 
    <!-- Where all validation error messages will appear-->
    <div>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="There were errors on the page: " ForeColor="Red" ValidationGroup="hot"/>
    </div>

    <!-- Date for data entered same method as on in Food Waste with Google scripts-->
    <div>
        <strong>Date:</strong>
        <asp:textbox runat="server" id="datepicker_hc"/>
        <!-- Ensure a date was inputed-->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="datepicker_hc" ErrorMessage="A date is required" ForeColor="Red" ValidationGroup="hot"> * </asp:RequiredFieldValidator>
        <!-- Google scripts to create datepicker-->
         <script>
                $(function () {
                    $("#<%= datepicker_hc.ClientID %>").datepicker();
                });
            </script> 
    </div>
    <br />

    <!-- Weight of hot compost-->
    <div> 
        <strong class="auto-style1">Weight: &nbsp; </strong>
        <asp:textbox runat="server" id="Weight_hc" type="double" Width="80px" />
        <!-- ensure value is entered (required)-->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Weight_hc" ErrorMessage="A Weight is required" ForeColor="Red" ValidationGroup="hot"> * </asp:RequiredFieldValidator>
        <!-- Custome validator to ensure not negative-->
        <asp:CustomValidator OnServerValidate="CheckWeight" ErrorMessage="Your weight cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="Weight_hc" ValidationGroup="hot">*</asp:CustomValidator>
    </div>
    <br />
            
    <!-- reset form and submit form buttons-->
    <div>
        <input id="Reset2" type="reset" value="Reset" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="buttonSubmit" Text="Submit" ValidationGroup="hot" runat="server" OnClick="buttonSubmit_Click"/>
    </div>
</div> 
</asp:Content>
