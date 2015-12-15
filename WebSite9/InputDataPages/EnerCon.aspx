<%@ Page Title="" Language="C#" MasterPageFile="EnergyForms.master" AutoEventWireup="true" CodeFile="EnerCon.aspx.cs" Inherits="EnerCon" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
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
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="There were errors on the page: " ForeColor="Red" ValidationGroup="encon"/>
        </div>

        <!--DropDown list for where they energy was produced -->
        <div>
            <strong class="auto-style1">Energy Consumer: &nbsp; </strong>
            <asp:DropDownList runat="server" id="consumer" name="D1">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem value="Fish Tanks">Fish Tanks</asp:ListItem>
                <asp:ListItem value="Biodiesel">Biodiesel</asp:ListItem>
                <asp:ListItem value="Lights">Lights</asp:ListItem>
                <asp:ListItem value="Water">Water</asp:ListItem>
                <asp:ListItem value="Vermiculture">Vermiculture</asp:ListItem>
                <asp:ListItem value="Compost">Compost</asp:ListItem>
                <asp:ListItem value="Other">Other</asp:ListItem>
            </asp:DropDownList>
            <!--Validation includes to ensure something is picked in this field (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="consumer" ErrorMessage="Please pick a consumer in which the energy came from" ForeColor="Red" ValidationGroup="encon"> * </asp:RequiredFieldValidator>
        </div>
        <br />

        <!--DropDown list for where they energy was produced -->
        <div>
            <strong class="auto-style1">Source of Energy: &nbsp; </strong>
            <asp:DropDownList runat="server" id="producer" name="D1">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem value="Solar">Solar</asp:ListItem>
                <asp:ListItem value="Wind">Wind</asp:ListItem>
                <asp:ListItem value="Water">Water</asp:ListItem>
                <asp:ListItem value="SMUD">SMUD</asp:ListItem>
                <asp:ListItem value="Other">Other</asp:ListItem>
            </asp:DropDownList>
            <!--Validation includes to ensure something is picked in this field (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="producer" ErrorMessage="Please pick a source in which the energy came from" ForeColor="Red" ValidationGroup="encon"> * </asp:RequiredFieldValidator>
        </div>
        <br />

        <!--Pick a date this contains a date picker. Once enter box calander opens up on it. Use Googles script plugins that is open to public--> 
        <div>
            <strong>Date:</strong>
            <asp:textbox runat="server" id="datepicker" />
            <!--Check to ensure that the date has something int the textbox-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="datepicker" ErrorMessage="A date is required" ForeColor="Red" ValidationGroup="encon"> * </asp:RequiredFieldValidator>
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
            <strong class="auto-style1">Kilowatts Per Hour: &nbsp; </strong>
            <asp:textbox runat="server" id="kw_h" type="double" Width="80px" /> kW/h
            <!-- Validates to make sure something is entered into the field (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="kw_h" ErrorMessage="kilowatts per hour is required" ForeColor="Red" ValidationGroup="encon"> * </asp:RequiredFieldValidator>
            <!-- Make custome method to ensure the weight is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckKW" ErrorMessage="Your kilowatts per hour cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="kw_h" ValidationGroup="encon">*</asp:CustomValidator>
        </div>
        <br />


        <!-- Percentage of energy-->
        <div>
            <strong class="auto-style1">Cost of Kilowatts Per Hour: &nbsp; </strong>
            $<asp:textbox runat="server" id="cost_kw" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="cost_kw" ErrorMessage="Cost of kilowatts per hour is required" ForeColor="Red" ValidationGroup="encon"> * </asp:RequiredFieldValidator>
        <!-- Make custome method to ensure the weight is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckCostKW" ErrorMessage="Your cost for kilowatts per hour cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="cost_kw" ValidationGroup="encon">*</asp:CustomValidator>
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
            <asp:Button ID="buttonSubmit" Text="Submit" ValidationGroup="encon" runat="server" OnClick="buttonSubmit_Click"/>
        </div>
    </div> 
</asp:Content>

