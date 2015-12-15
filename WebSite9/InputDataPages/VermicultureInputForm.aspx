<%@ Page Title="" Language="C#" MasterPageFile="~/InputData.master" AutoEventWireup="true" CodeFile="VermicultureInputForm.aspx.cs" Inherits="VermicultureInputForm" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
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

<div id="vermiculture"> 
    <!-- Where all validation error messages will appear-->
    <div>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="There were errors on the page: " ForeColor="Red" ValidationGroup="vermi"/>
    </div>

    <!-- Date for data entered same method as on in Food Waste with Google scripts-->
    <div>
        <strong>Start Date:</strong>
        <asp:textbox runat="server" id="startdatepicker"/>
        <!-- Ensure a date was inputed-->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="startdatepicker" ErrorMessage="A start date is required" ForeColor="Red" ValidationGroup="vermi"> * </asp:RequiredFieldValidator>
        <!-- Google scripts to create datepicker-->
         <script>
                $(function () {
                    $("#<%= startdatepicker.ClientID %>").datepicker();
                });
            </script> 
    </div>
    <br />

    <!-- Date for data entered same method as on in Food Waste with Google scripts-->
    <div>
        <strong>Finish Date:</strong>
        <asp:textbox runat="server" id="finishdatepicker"/>
        <!-- Ensure a date was inputed-->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="finishdatepicker" ErrorMessage="A finish date is required" ForeColor="Red" ValidationGroup="vermi"> * </asp:RequiredFieldValidator>
        <!-- Google scripts to create datepicker-->
         <script>
                $(function () {
                    $("#<%= finishdatepicker.ClientID %>").datepicker();
                });
            </script> 
    </div>
    <br />

    <!--vermicompost bed temp-->
    <div> 
        <strong class="auto-style1">Vermicompost Temperature: &nbsp; </strong>
        <asp:textbox runat="server" id="vermi_temp" type="double" Width="80px" />C
        <!-- ensure value is entered (required)-->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="vermi_temp" ErrorMessage="A temperature is required" ForeColor="Red" ValidationGroup="vermi"> * </asp:RequiredFieldValidator>
    </div>
    <br />
         
    <!-- Vermicompost bed moisture concentration-->
    <div>
        <strong class="auto-style1">Vermicompost Moisture Concentration: &nbsp; </strong>
        <asp:textbox runat="server" id="vermi_moistcon" type="double" Width="50px" />
        <!-- Validator to ensure a number is in the text box (required)-->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="vermi_moistcon" ErrorMessage="Moisture concentration is required" ForeColor="Red" ValidationGroup="vermi"> * </asp:RequiredFieldValidator>
            <!-- Make custome method to ensure the methanol is not a negative number-->
        <asp:CustomValidator OnServerValidate="CheckMoist" ErrorMessage="Moisture concentration cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="vermi_moistcon" ValidationGroup="vermi">*</asp:CustomValidator>
    </div>
    <br />

    <!-- Worms remboved (lbs)-->
    <div>
        <strong class="auto-style1">Worms Removed: &nbsp; </strong>
        <asp:textbox runat="server" id="worms_removed" type="double" Width="50px" /> lbs
        <!-- Validator to ensure a number is in the text box (required)-->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="worms_removed" ErrorMessage="Worms removed is required" ForeColor="Red" ValidationGroup="vermi"> * </asp:RequiredFieldValidator>
            <!-- Make custome method to ensure the methanol is not a negative number-->
        <asp:CustomValidator OnServerValidate="Checkwormsrem" ErrorMessage="Worms removed cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="worms_removed" ValidationGroup="vermi">*</asp:CustomValidator>
    </div>
    <br />

    <!-- Worms added (lbs)-->
    <div>
        <strong class="auto-style1">Worms Added: &nbsp; </strong>
        <asp:textbox runat="server" id="worms_added" type="double" Width="50px" /> lbs
        <!-- Validator to ensure a number is in the text box (required)-->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="worms_added" ErrorMessage="Worms added is required" ForeColor="Red" ValidationGroup="vermi"> * </asp:RequiredFieldValidator>
            <!-- Make custome method to ensure the worms is not a negative number-->
        <asp:CustomValidator OnServerValidate="Checkwormsadd" ErrorMessage="Worms added cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="worms_added" ValidationGroup="vermi">*</asp:CustomValidator>
    </div>
    <br />

      <!-- Volume of vermicompost produced-->
    <div>
        <strong class="auto-style1">Volume of Vermicompost Produced: &nbsp; </strong>
        <asp:textbox runat="server" id="Vol_vermiproducde" type="double" Width="50px" />
        <!-- Validator to ensure a number is in the text box (required)-->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Vol_vermiproducde" ErrorMessage="Volume of vermicompost produced is required" ForeColor="Red" ValidationGroup="vermi"> * </asp:RequiredFieldValidator>
            <!-- Make custome method to ensure the volume vermicompost produced is not a negative number-->
        <asp:CustomValidator OnServerValidate="Checkvermipro" ErrorMessage="Volume of vermicompost produced cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="Vol_vermiproducde" ValidationGroup="vermi">*</asp:CustomValidator>
    </div>
    <br />

      <!-- Vol of vermicompost "tea" produced-->
    <div>
        <strong class="auto-style1">Volume of Vermicompost "Tea"  Produced: &nbsp; </strong>
        <asp:textbox runat="server" id="vermi_tea" type="double" Width="50px" />
        <!-- Validator to ensure a number is in the text box (required)-->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="vermi_tea" ErrorMessage="vermicompost tea is required" ForeColor="Red" ValidationGroup="vermi"> * </asp:RequiredFieldValidator>
            <!-- Make custome method to ensure the vermicompost tea is not a negative number-->
        <asp:CustomValidator OnServerValidate="Checkvermitea" ErrorMessage="Vermicompost tea produced cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="vermi_tea" ValidationGroup="vermi">*</asp:CustomValidator>
    </div>
    <br />

     <!-- Cost to create vermicompost-->
        <div>
            <strong class="auto-style1">Cost to Create Vermicompost: &nbsp; </strong>
            $<asp:textbox runat="server" id="Cost_vermi" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Cost_vermi" ErrorMessage="Cost to create vermicompost is required" ForeColor="Red" ValidationGroup="vermi"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the methanol is not a negative number-->
            <asp:CustomValidator OnServerValidate="Checkcostvermi" ErrorMessage="Cost to crete vermicompost cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="Cost_vermi" ValidationGroup="vermi">*</asp:CustomValidator>
        </div>
        <br />

     <!-- Market cost of vermicompost-->
        <div>
            <strong class="auto-style1">Market Cost of Vermicompost: &nbsp; </strong>
            $<asp:textbox runat="server" id="marketcostvermi" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="marketcostvermi" ErrorMessage="Market cost of vermicompost is required" ForeColor="Red" ValidationGroup="vermi"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the methanol is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckMarCostvermi" ErrorMessage="Market cost of vermicompost cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="marketcostvermi" ValidationGroup="vermi">*</asp:CustomValidator>
        </div>
        <br />
       
     <!-- Where they can put notes in if needed (Not required)-->
    <div>
        <strong class="auto-style1">Notes: &nbsp; </strong>
        <asp:textbox runat="server" id="Notes1" mode="multiline" />
    </div>
    <br />

    <!-- reset form and submit form buttons-->
    <div>
        <input id="Reset2" type="reset" value="Reset" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="buttonSubmit" Text="Submit" ValidationGroup="vermi" runat="server" OnClick="buttonSubmit_Click"/>
    </div>
</div> 



</asp:Content>

