<%@ Page Title="" Language="C#" MasterPageFile="AquaponicsForm.master" AutoEventWireup="true" CodeFile="Plants.aspx.cs" Inherits="Plants" %>

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
        #plantProduction{
            background: rgba(255, 255, 255, 0.5);
            margin:auto;
            width:30%;
        }
         br {
             line-height:22px;
         }
    </style>
    <!-- need this for date picker to do the calander drop down-->
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

    <br/>
    <br/>
     <!--Food waste from-->
    <div id="plantProduction">
        <!--Validation summary location if something is wrong will appear in this div that is of type food validationgroup-->
        <div class = "center">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="There were errors on the page: " ForeColor="Red" ValidationGroup="pp"/>
        </div>

        <!--Pick a date this contains a date picker. Once enter box calander opens up on it. Use Googles script plugins that is open to public--> 
        <div>
            <strong> Date:</strong>
            <asp:textbox runat="server" id="datepicker" />
            <!--Check to ensure that the date has something int the textbox-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="datepicker" ErrorMessage="A date is required" ForeColor="Red" ValidationGroup="pp"> * </asp:RequiredFieldValidator>
            <br />
            <!-- Googles function called in script-->
            <script>
                $(function () {
                    $("#<%= datepicker.ClientID %>").datepicker();
                });
            </script>   
        </div>
        <br />

        <!--species of plant-->
        <div> 
            <strong class="auto-style1">Species of Plant: &nbsp; </strong>
            <asp:textbox runat="server" id="species" Width="80px" />
            <!-- Validates to make sure something is entered into the field (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="species" ErrorMessage="Species type of plant is required" ForeColor="Red" ValidationGroup="pp"> * </asp:RequiredFieldValidator>
        </div>
        <br />

         <!--DropDown list for heathy fishy -->
        <div>
            <strong class="auto-style1"> Health of Plants: &nbsp; </strong>
            <asp:DropDownList runat="server" id="health_plant" name="D1">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem value="Healthy">Healthy</asp:ListItem>
                <asp:ListItem value="Okay">Okay</asp:ListItem>
                <asp:ListItem value="Close to Dead">Close to Dead</asp:ListItem>
                <asp:ListItem value="Dead">Dead</asp:ListItem>
            </asp:DropDownList>
            <!--Validation includes to ensure something is picked in this field (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="health_plant" ErrorMessage="Please pick the health of the plant" ForeColor="Red" ValidationGroup="pp"> * </asp:RequiredFieldValidator>
        </div>
        <br />


        <!-- Number of plant-->
        <div>
            <strong class="auto-style1">Number of That Plant Havested: &nbsp; </strong>
            <asp:textbox runat="server" id="num_plant" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="num_plant" ErrorMessage="Number of plant is required" ForeColor="Red" ValidationGroup="pp"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the collect kwo is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckNum" ErrorMessage="Number of plant cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="num_plant" ValidationGroup="pp">*</asp:CustomValidator> 
        </div>
        <br />

        <!--plant bed harvest-->
        <div> 
            <strong class="auto-style1">Bed Harvested From: &nbsp; </strong>
            <asp:textbox runat="server" id="plant_bed" Width="80px" />
            <!-- Validates to make sure something is entered into the field (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="plant_bed" ErrorMessage="Bed Harvested from is required" ForeColor="Red" ValidationGroup="pp"> * </asp:RequiredFieldValidator>
              <asp:CustomValidator OnServerValidate="plantBed" ErrorMessage="Number of plant cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="plant_bed" ValidationGroup="pp">*</asp:CustomValidator>
        </div>
        <br />

            <!--greenhouse temp-->
        <div> 
            <strong class="auto-style1">Greenhouse Temperature: &nbsp; </strong>
            <asp:textbox runat="server" id="green_temp" type="double" Width="80px" />C
            <!-- ensure value is entered (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="green_temp" ErrorMessage="A greenhouse temperature is required" ForeColor="Red" ValidationGroup="pp"> * </asp:RequiredFieldValidator>
          <asp:CustomValidator OnServerValidate="CheckNum" ErrorMessage="Number of plant cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="green_temp" ValidationGroup="pp">*</asp:CustomValidator>
        </div>
        <br />
              
               <!-- Vermicompost bed moisture concentration-->
        <div>
            <strong class="auto-style1">Greenhouse Humidity: &nbsp; </strong>
            <asp:textbox runat="server" id="green_humidity" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="green_humidity" ErrorMessage="Greenhouse humidity is required" ForeColor="Red" ValidationGroup="pp"> * </asp:RequiredFieldValidator>
                <!-- Make custome method to ensure the methanol is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckHumidity" ErrorMessage="Greenhouse humidity cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="green_humidity" ValidationGroup="pp">*</asp:CustomValidator>
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
            <asp:Button ID="buttonSubmit" Text="Submit" ValidationGroup="pp" runat="server" OnClick="buttonSubmit_Click"/>
        </div>
    </div> 
</asp:Content>


