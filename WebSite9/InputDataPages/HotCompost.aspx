<%@ Page Title="" Language="C#" MasterPageFile="CompostForms.master" AutoEventWireup="true" CodeFile="HotCompost.aspx.cs" Inherits="InputDataPages_HotCompost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">

<!-- need this for date picker to do the calander drop down-->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<br />
<br />

    <!-- Where all validation error messages will appear-->
    <div style="display:block; text-align:left; ">
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="There were errors on the page: " ForeColor="Red" ValidationGroup="hot"/>
    </div>
    <br />
    <div style="display:block; text-align:left;">
    <!-- Date for data entered same method as on in Food Waste with Google scripts-->
        <br/>
        <strong class="auto-style1">Date:</strong>
        <asp:textbox runat="server" id="datepicker_hc" CssClass="inputbox"/>
        <!-- Ensure a date was inputed-->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="datepicker_hc" ErrorMessage="A date is required" ForeColor="Red" ValidationGroup="hot"> * </asp:RequiredFieldValidator>
        <!-- Google scripts to create datepicker-->
         <script>
                $(function () {
                    $("#<%= datepicker_hc.ClientID %>").datepicker();
                });
            </script> 

    <br />
        </div>
    <!-- Weight of hot compost-->
    <div style="display:block; text-align:left;">
        <strong class="auto-style1">Weight: &nbsp; </strong>
        <asp:textbox runat="server" id="Weight_hc" type="double" Width="80px" />
        <!-- ensure value is entered (required)-->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Weight_hc" ErrorMessage="A Weight is required" ForeColor="Red" ValidationGroup="hot"> * </asp:RequiredFieldValidator>
        <!-- Custome validator to ensure not negative-->
        <asp:CustomValidator OnServerValidate="CheckWeight" ErrorMessage="Your weight cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="Weight_hc" ValidationGroup="hot">*</asp:CustomValidator>

    <br />
         </div>   
    <!-- reset form and submit form buttons-->
    <div style="display:block; text-align:left;">
        <input id="Reset2" type="reset" value="Reset" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="buttonSubmit" Text="Submit" ValidationGroup="hot" runat="server" OnClick="buttonSubmit_Click"/>
    </div>

</asp:Content>


