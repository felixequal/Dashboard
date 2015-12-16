<%@ Page Title="" Language="C#" MasterPageFile="AquaponicsForm.master" AutoEventWireup="true" CodeFile="FishPro.aspx.cs" Inherits="FishPro" %>

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
    <div id="FishProduction">
        <!--Validation summary location if something is wrong will appear in this div that is of type food validationgroup-->
        <div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="There were errors on the page: " ForeColor="Red" ValidationGroup="fp"/>
        </div>

        <!--Pick a date this contains a date picker. Once enter box calander opens up on it. Use Googles script plugins that is open to public--> 
        <div>
            <strong> Date:</strong>
            <asp:textbox runat="server" id="datepicker" />
            <!--Check to ensure that the date has something int the textbox-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="datepicker" ErrorMessage="A date is required" ForeColor="Red" ValidationGroup="fp"> * </asp:RequiredFieldValidator>
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
            <asp:DropDownList runat="server" id="Location" name="D1">
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
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Location" ErrorMessage="Please pick a tank in which the fish are in" ForeColor="Red" ValidationGroup="fp"> * </asp:RequiredFieldValidator>
        </div>
        <br />

        <!--species of fish-->
        <div> 
            <strong class="auto-style1">Species of Fish: &nbsp; </strong>
            <asp:textbox runat="server" id="species" Width="80px" />
            <!-- Validates to make sure something is entered into the field (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="species" ErrorMessage="Species type of fish is required" ForeColor="Red" ValidationGroup="fp"> * </asp:RequiredFieldValidator>
        </div>
        <br />


        <!-- Number of fish-->
        <div>
            <strong class="auto-style1">Number of Fish (The type of species stated above): &nbsp; </strong>
            <asp:textbox runat="server" id="num_fish" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="num_fish" ErrorMessage="Number of fish is required" ForeColor="Red" ValidationGroup="fp"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the collect kwo is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckNum" ErrorMessage="Invalid number of fish" ForeColor="Red" runat="server" ControlToValidate="num_fish" ValidationGroup="fp">*</asp:CustomValidator> 
        </div>
        <br />

            <!--tank temp-->
        <div> 
            <strong class="auto-style1">Water Temperature of Tank: &nbsp; </strong>
            <asp:textbox runat="server" id="water_temp" type="double" Width="80px" />C
            <!-- ensure value is entered (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="water_temp" ErrorMessage="A temperature is required" ForeColor="Red" ValidationGroup="fp"> * </asp:RequiredFieldValidator>
        </div>
        <br />
              
        <!--DropDown list for heathy fishy -->
        <div>
            <strong class="auto-style1"> Health of Fish: &nbsp; </strong>
            <asp:DropDownList runat="server" id="health_fish" name="D1">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem value="Healthy">Healthy</asp:ListItem>
                <asp:ListItem value="Okay">Okay</asp:ListItem>
                <asp:ListItem value="Sick">Sick</asp:ListItem>
                <asp:ListItem value="Dead">Dead</asp:ListItem>
            </asp:DropDownList>
            <!--Validation includes to ensure something is picked in this field (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="health_fish" ErrorMessage="Please pick the health of the fish" ForeColor="Red" ValidationGroup="fp"> * </asp:RequiredFieldValidator>
        </div>
        <br />

          <!--DropDown list for quality of water -->
        <div>
            <strong class="auto-style1"> Quality of Water: &nbsp; </strong>
            <asp:DropDownList runat="server" id="quality_aqua" name="D1">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem value="Clear">Clear</asp:ListItem>
                <asp:ListItem value="Murky">Murky</asp:ListItem>
                <asp:ListItem value="Unable to see fish">Unable to see fish</asp:ListItem>
            </asp:DropDownList>
            <!--Validation includes to ensure something is picked in this field (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="quality_aqua" ErrorMessage="Please pick the quality of water" ForeColor="Red" ValidationGroup="fp"> * </asp:RequiredFieldValidator>
        </div>
        <br />
          
        <!--Pick a date this contains a date picker. Once enter box calander opens up on it. Use Googles script plugins that is open to public--> 
        <div>
            <strong> Date of Last Water Change:</strong>
            <asp:textbox runat="server" id="water_change" />
            <!--Check to ensure that the date has something int the textbox-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="water_change" ErrorMessage="A date of last water change is required" ForeColor="Red" ValidationGroup="fp"> * </asp:RequiredFieldValidator>
            <br />
            <!-- Googles function called in script-->
            <script>
                $(function () {
                    $("#<%= water_change.ClientID %>").datepicker();
                });
            </script>   
        </div>
        <br />

        <!--Pick a date this contains a date picker. Once enter box calander opens up on it. Use Googles script plugins that is open to public--> 
        <div>
            <strong> Date of Buffer Last Added:</strong>
            <asp:textbox runat="server" id="buffer" />
            <!--Check to ensure that the date has something int the textbox-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="buffer" ErrorMessage="A date of buffer last added is required" ForeColor="Red" ValidationGroup="fp"> * </asp:RequiredFieldValidator>
            <br />
            <!-- Googles function called in script-->
            <script>
                $(function () {
                    $("#<%= buffer.ClientID %>").datepicker();
                });
            </script>   
        </div>
        <br />

         <!--Pick a date this contains a date picker. Once enter box calander opens up on it. Use Googles script plugins that is open to public--> 
        <div>
            <strong> Date of Fish Last Fed:</strong>
            <asp:textbox runat="server" id="fish_fed" />
            <!--Check to ensure that the date has something int the textbox-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="fish_fed" ErrorMessage="A date of fish last fed is required" ForeColor="Red" ValidationGroup="fp"> * </asp:RequiredFieldValidator>
            <br />
            <!-- Googles function called in script-->
            <script>
                $(function () {
                    $("#<%= fish_fed.ClientID %>").datepicker();
                });
            </script>   
        </div>
        <br />

        <!-- Amount of buffere added-->
        <div>
            <strong class="auto-style1">Amount of Buffer Added: &nbsp; </strong>
            <asp:textbox runat="server" id="buf_add" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="buf_add" ErrorMessage="Amount of Buffer added is required" ForeColor="Red" ValidationGroup="fp"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the bio is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckBuf" ErrorMessage="Invalid Buffer added" ForeColor="Red" runat="server" ControlToValidate="buf_add" ValidationGroup="fp">*</asp:CustomValidator>
        </div>
        <br />

        <!-- How much fed-->
        <div>
            <strong class="auto-style1">Quanity of Fish Food: &nbsp; </strong>
            <asp:textbox runat="server" id="fish_food" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="fish_food" ErrorMessage="Fish food is required" ForeColor="Red" ValidationGroup="fp"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the bio is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckFood" ErrorMessage="Invalid Fish food entry" ForeColor="Red" runat="server" ControlToValidate="fish_food" ValidationGroup="fp">*</asp:CustomValidator>
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
            <asp:Button ID="buttonSubmit" Text="Submit" ValidationGroup="fp" runat="server" OnClick="buttonSubmit_Click"/>
        </div>
    </div> 
</asp:Content>

