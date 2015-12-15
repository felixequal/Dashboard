<%@ Page Title="" Language="C#" MasterPageFile="EnergyForms.master" AutoEventWireup="true" CodeFile="EnerPro.aspx.cs" Inherits="EnerPro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
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
     <!--Food waste from-->
    <div id="energypro">
        <!--Validation summary location if something is wrong will appear in this div that is of type food validationgroup-->
        <div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="There were errors on the page: " ForeColor="Red" ValidationGroup="enpro"/>
        </div>

        <!--DropDown list for where they energy was produced -->
        <div>
            <strong class="auto-style1">Energy Producer: &nbsp; </strong>
            <asp:DropDownList runat="server" id="producer" name="D1">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem value="Solar">Solar</asp:ListItem>
                <asp:ListItem value="Wind">Wind</asp:ListItem>
                <asp:ListItem value="Water">Water</asp:ListItem>
                <asp:ListItem value="SMUD">SMUD</asp:ListItem>
                <asp:ListItem value="Other">Other</asp:ListItem>
            </asp:DropDownList>
            <!--Validation includes to ensure something is picked in this field (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="producer" ErrorMessage="Please pick a producer in which the energy came from" ForeColor="Red" ValidationGroup="enpro"> * </asp:RequiredFieldValidator>
        </div>
        <br />

        <!--Pick a date this contains a date picker. Once enter box calander opens up on it. Use Googles script plugins that is open to public--> 
        <div>
            <strong>Date:</strong>
            <asp:textbox runat="server" id="datepicker" />
            <!--Check to ensure that the date has something int the textbox-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="datepicker" ErrorMessage="A date is required" ForeColor="Red" ValidationGroup="enpro"> * </asp:RequiredFieldValidator>
            <br />
            <!-- Googles function called in script-->
            <script>
                $(function () {
                    $("#<%= datepicker.ClientID %>").datepicker();
                });
            </script>   
        </div>

        <br />
        <!--Energy produced-->
        <div> 
            <strong class="auto-style1">"Amount of Energy Produced: &nbsp; </strong>
            <asp:textbox runat="server" id="energy_pro" type="double" Width="80px" /> kW/h
            <!-- Validates to make sure something is entered into the field (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="energy_pro" ErrorMessage="Energy produced is required" ForeColor="Red" ValidationGroup="enpro"> * </asp:RequiredFieldValidator>
            <!-- Make custome method to ensure the weight is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckEP" ErrorMessage="Your energy produced cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="energy_pro" ValidationGroup="enpro">*</asp:CustomValidator>
        </div>
        <br />


        <!-- Percentage of energy-->
        <div>
            <strong class="auto-style1">Percentage of Energy: &nbsp; </strong>
            <asp:textbox runat="server" id="Percent_Energy" type="double" Width="50px" />%
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Percent_Energy" ErrorMessage="A percentage value for energy is required" ForeColor="Red" ValidationGroup="enpro"> * </asp:RequiredFieldValidator>
            <!-- Ensure the value is between 0 - 100 (percent) for validation-->
            <asp:RangeValidator runat="server" MinimumValue="0" MaximumValue="100" Type="Double" EnableClientScript="false" ErrorMessage="Please enter a percentage between 0 to 100 for the Percentage of energy" ControlToValidate="Percent_Energy" ForeColor="Red" ValidationGroup="enpro">*</asp:RangeValidator>
        </div>
        <br />
                
        <!-- Where they can put notes in if needed (Not required)-->
        <div>
            <strong class="auto-style1">Notes: &nbsp; </strong>
            <asp:textbox runat="server" id="Notes1" mode="multiline" />
        </div>
        <br />
        <!-- Reset form and submit buttons-->
        <div>
            <input id="Reset1" type="reset" value="Reset" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <!--<input id="Submit2" type="submit" value="Submit" />-->
            <asp:Button ID="buttonSubmit" Text="Submit" ValidationGroup="enpro" runat="server" OnClick="buttonSubmit_Click"/>
        </div>
    </div> 
</asp:Content>

