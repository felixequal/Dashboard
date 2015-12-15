<%@ Page Title="" Language="C#" MasterPageFile="CompostForms.master" AutoEventWireup="true" CodeFile="VegetableOil.aspx.cs" Inherits="VegetableOil" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
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
     <!-- Veggie Oil form-->
    <div id="vegOil">
        <!-- Where validation errors will appear-->
        <div>
            <asp:ValidationSummary ID="ValidationSummary3" runat="server" HeaderText="There were errors on the page: " ForeColor="Red" ValidationGroup="veg"/>
        </div>

        <!-- Date picker same as one above int food waste from-->
        <div>
            <strong>Date:</strong>
            <asp:textbox runat="server" id="datepicker_vo"/>
            <!-- Ensure that a date was inputted-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="datepicker_vo" ErrorMessage="A date is required" ForeColor="Red" ValidationGroup="veg"> * </asp:RequiredFieldValidator> 
            <br />
            <!-- Google api for datepicker-->
            <script>
                $(function () {
                    $("#<%= datepicker_vo.ClientID %>").datepicker();
                });
            </script>  
        </div>
        <br />
            
        <!-- weight of veggie oil-->
        <div> 
            <strong class="auto-style1">Weight: &nbsp; </strong>
            <asp:textbox runat="server" id="Weight_vo" type="double" Width="80px" />
            <!-- ensure something was inputeed-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Weight_vo" ErrorMessage="A Weight is required" ForeColor="Red" ValidationGroup="veg"> * </asp:RequiredFieldValidator>
            <!-- costume validation to ensure not negative-->
            <asp:CustomValidator OnServerValidate="CheckWeight" ErrorMessage="Your weight cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="Weight_vo" ValidationGroup="veg">*</asp:CustomValidator>
        </div>
        <br />

        <!-- Perecentage full for oil-->
        <div>
            <strong class="auto-style1">Percentage Full: &nbsp; </strong>
            <asp:textbox runat="server" id="Percent_Full" type="double" Width="50px" />%
            <!--Ensure something is inputed-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Percent_Full" ErrorMessage="A percentage of fullness is required" ForeColor="Red" ValidationGroup="veg"> * </asp:RequiredFieldValidator>
            <!-- make sure the percentage is between 0 - 100 %-->
            <asp:RangeValidator runat="server" MinimumValue="0" MaximumValue="100" Type="Double" EnableClientScript="false" ValidationGroup="veg" ErrorMessage="Please enter a percentage between 0 to 100 for the Percentage of full" ControlToValidate="Percent_full" ForeColor="Red">*</asp:RangeValidator>
            <br />
        </div>
        <br />
            
        <!-- Reset form button and submit-->
        <div>
            <input id="Reset3" type="reset" value="Reset" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="buttonSubmit" Text="Submit" ValidationGroup="veg" runat="server" OnClick="buttonSubmit_Click"/>
        </div>
    </div> 
</asp:Content>

