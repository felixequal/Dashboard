<%@ Page Title="" Language="C#" MasterPageFile="AquaponicsForm.master" AutoEventWireup="true" CodeFile="Tank.aspx.cs" Inherits="Tank" %>


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
     <!--Food waste from-->
    <div id="FishProduction">
        <!--Validation summary location if something is wrong will appear in this div that is of type food validationgroup-->
        <div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="There were errors on the page: " ForeColor="Red" ValidationGroup="ft"/>
        </div>

        <!--Pick a date this contains a date picker. Once enter box calander opens up on it. Use Googles script plugins that is open to public--> 
        <div>
            <strong> Date:</strong>
            <asp:textbox runat="server" id="datepicker" ValidationGroup="ft"/>
            <!--Check to ensure that the date has something int the textbox-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="datepicker" ErrorMessage="A date is required" ForeColor="Red" ValidationGroup="ft"> * </asp:RequiredFieldValidator>
            <br />
            <!-- Googles function called in script-->
            <script>
                $(function () {
                    $("#<%= datepicker.ClientID %>").datepicker();
                });
            </script>   
        </div>
        <br />

        <!--DropDown list for where the tank isr) -->
        <div>
            <strong class="auto-style1">Fish Tank Location: &nbsp; </strong>
            <asp:DropDownList runat="server" id="Location" name="D1" ValidationGroup="ft">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem value="IBC1">IBC1</asp:ListItem>
                <asp:ListItem value="IBC2">IBC2</asp:ListItem>
                <asp:ListItem value="CATIBC">CATIBC</asp:ListItem>
                <asp:ListItem value="BASS">BASS</asp:ListItem>
                <asp:ListItem value="BASS Nursery">BASS Nursery</asp:ListItem>
                <asp:ListItem value="1000 Gallon">1000 Gallon</asp:ListItem>
                <asp:ListItem value="Blue GIll">Blue Gill</asp:ListItem>
                <asp:ListItem value="Perch">Perch</asp:ListItem>
                <asp:ListItem value="Other">Other</asp:ListItem>
            </asp:DropDownList>
            <!--Validation includes to ensure something is picked in this field (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Location" ErrorMessage="Please pick a tank in which the fish are in" ForeColor="Red" ValidationGroup="ft"> * </asp:RequiredFieldValidator>
        </div>
        <br />

         <!--tank temp-->
        <div> 
            <strong class="auto-style1">Water Temperature of Tank: &nbsp; </strong>
            <asp:textbox runat="server" id="water_temp" type="double" Width="80px" ValidationGroup="ft" />C
            <!-- ensure value is entered (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="water_temp" ErrorMessage="A temperature is required" ForeColor="Red" ValidationGroup="ft"> * </asp:RequiredFieldValidator>
        </div>
        <br />

                <!-- How much ammonia-->
        <div>
            <strong class="auto-style1">Ammonia Concentration: &nbsp; </strong>
            <asp:textbox runat="server" id="ac" type="double" Width="50px" ValidationGroup="ft" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="ac" ErrorMessage="Ammonia Concentration is required" ForeColor="Red" ValidationGroup="ft"> * </asp:RequiredFieldValidator>
        </div>
        <br />

        <div>
            <strong class="auto-style1">O2 Concentration: &nbsp; </strong>
            <asp:textbox runat="server" id="o2" type="double" Width="50px" ValidationGroup="ft" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="o2" ErrorMessage="O2  Concentration is required" ForeColor="Red" ValidationGroup="ft"> * </asp:RequiredFieldValidator>
        </div>
        <br />

        <div>
            <strong class="auto-style1">EC: &nbsp; </strong>
            <asp:textbox runat="server" id="ec" type="double" Width="50px" ValidationGroup="ft" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="ec" ErrorMessage="EC is required" ForeColor="Red" ValidationGroup="ft"> * </asp:RequiredFieldValidator>
        </div>
        <br />

        <div>
            <strong class="auto-style1">DO: &nbsp; </strong>
            <asp:textbox runat="server" id="d_o" type="double" Width="50px" ValidationGroup="ft" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="d_o" ErrorMessage="DO is required" ForeColor="Red" ValidationGroup="ft"> * </asp:RequiredFieldValidator>
        </div>
        <br />

        <div>
            <strong class="auto-style1">pH: &nbsp; </strong>
            <asp:textbox runat="server" id="ph" type="double" Width="50px" ValidationGroup="ft" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="ph" ErrorMessage="pH is required" ForeColor="Red" ValidationGroup="ft"> * </asp:RequiredFieldValidator>
        </div>
        <br />

        <div>
            <strong class="auto-style1"> NH3  & NH4: &nbsp; </strong>
            <asp:textbox runat="server" id="nh34" type="double" Width="50px" ValidationGroup="ft" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="nh34" ErrorMessage="NH3/NH4 is required" ForeColor="Red" ValidationGroup="ft"> * </asp:RequiredFieldValidator>
        </div>
        <br />

        <div>
            <strong class="auto-style1">NO2: &nbsp; </strong>
            <asp:textbox runat="server" id="no2" type="double" Width="50px" ValidationGroup="ft" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="no2" ErrorMessage="NO2 is required" ForeColor="Red" ValidationGroup="ft"> * </asp:RequiredFieldValidator>
        </div>
        <br />

        <div>
            <strong class="auto-style1">NO3: &nbsp; </strong>
            <asp:textbox runat="server" id="no3" type="double" Width="50px" ValidationGroup="ft" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="no3" ErrorMessage="NO3 is required" ForeColor="Red" ValidationGroup="ft"> * </asp:RequiredFieldValidator>
        </div>
        <br />

        <div>
            <strong class="auto-style1">FE: &nbsp; </strong>
            <asp:textbox runat="server" id="fe" type="double" Width="50px" ValidationGroup="ft" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="fe" ErrorMessage="FE is required" ForeColor="Red" ValidationGroup="ft"> * </asp:RequiredFieldValidator>
        </div>
        <br />

        <div>
            <strong class="auto-style1">P: &nbsp; </strong>
            <asp:textbox runat="server" id="p" type="double" Width="50px" ValidationGroup="ft" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="p" ErrorMessage="P is required" ForeColor="Red" ValidationGroup="ft"> * </asp:RequiredFieldValidator>
        </div>
        <br />

        <div>
            <strong class="auto-style1">K: &nbsp; </strong>
            <asp:textbox runat="server" id="k" type="double" Width="50px" ValidationGroup="ft" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="k" ErrorMessage="K is required" ForeColor="Red" ValidationGroup="ft"> * </asp:RequiredFieldValidator>
        </div>
        <br />

    <div>
            <strong class="auto-style1">CO: &nbsp; </strong>
            <asp:textbox runat="server" id="co" type="double" Width="50px" ValidationGroup="ft" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="co" ErrorMessage="CO is required" ForeColor="Red" ValidationGroup="ft"> * </asp:RequiredFieldValidator>
        </div>
        <br />

        <div>
            <strong class="auto-style1">MG: &nbsp; </strong>
            <asp:textbox runat="server" id="mg" type="double" Width="50px" ValidationGroup="ft" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="mg" ErrorMessage="MG is required" ForeColor="Red" ValidationGroup="ft"> * </asp:RequiredFieldValidator>
        </div>
        <br />
        <!-- Reset form and submit buttons-->
        <div>
            <input id="Reset1" type="reset" value="Reset" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <!--<input id="Submit2" type="submit" value="Submit" />-->
            <asp:Button ID="buttonSubmit" Text="Submit" ValidationGroup="ft" runat="server" OnClick="buttonSubmit_Click"/>
        </div>

        </div>
</asp:Content>

