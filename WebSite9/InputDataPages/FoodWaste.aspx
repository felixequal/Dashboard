<%@ Page Title="" Language="C#" MasterPageFile="CompostForms.master" AutoEventWireup="true" CodeFile="FoodWaste.aspx.cs" Inherits="FoodWaste" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width:50%;
            text-align: right;
            font-size: 18px;
            position: relative;
            float: left;
        }
        #Text1 {
            position: relative;
        }
        #Notes {
            height: auto;
            width: 50%;
        }
        #Submit1 {
            text-align: right;
        }
        #foodWaste{
            background: rgba(255, 255, 255, 0.5);
            margin:auto;
            width:30%;
        }
        #FoodWasteTitle{
            font-family: 'Trebuchet MS';
            font-size: 30px;
            text-align: center;
        }
        input{
            width: 45%;
            height: auto;
        }
    </style>
    <!-- need this for date picker to do the calander drop down-->
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

    <br />
    <br />
     <!--Food waste from-->
    <div id="foodWaste">
        <div id ="FoodWasteTitle">
            <label>Vendor Foodwaste Data Collection Form</label>
            <br/>
        </div>
        <!--Validation summary location if something is wrong will appear in this div that is of type food validationgroup-->
        <div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="There were errors on the page: " ForeColor="Red" ValidationGroup="food"/>
        </div>

        <!--DropDown list for where they recived the food waste (which  vendor) -->
        <div>
            <strong class="auto-style1">Waste Received From: </strong>
            <asp:DropDownList runat="server" id="Location" name="D1">
                <asp:ListItem>--Select--</asp:ListItem>
                <asp:ListItem value="Buzz_Ecogrounds">The Buzz/Ecogrounds</asp:ListItem>
                <asp:ListItem value="Epicure">Epicure</asp:ListItem>
                <asp:ListItem value="DC">The Dining Commons</asp:ListItem>
                <asp:ListItem value="CC">Children's Center</asp:ListItem>
                <asp:ListItem value="JC">Java City</asp:ListItem>
                <asp:ListItem value="Roundhouse">Roundhouse</asp:ListItem>
                <asp:ListItem value="Starbucks">Starbucks</asp:ListItem>
                <asp:ListItem value="Misc">Misc</asp:ListItem>
            </asp:DropDownList>
            <!--Validation includes to ensure something is picked in this field (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Location" ErrorMessage="Please pick a place in which the waste was recived from" ForeColor="Red" ValidationGroup="food"> * </asp:RequiredFieldValidator>
        </div>
        <br />

        <!--Pick a date this contains a date picker. Once enter box calander opens up on it. Use Googles script plugins that is open to public--> 
        <div>
            <strong class="auto-style1">Date: &nbsp; </strong>
            <asp:textbox runat="server" id="datepicker" Width="90px"/>
            <!--Check to ensure that the date has something int the textbox-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="datepicker" ErrorMessage="A date is required" ForeColor="Red" ValidationGroup="food"> * </asp:RequiredFieldValidator>
            <br />
            <!-- Googles function called in script-->
            <script>
                $(function () {
                    $("#<%= datepicker.ClientID %>").datepicker();
                });
            </script>   
        </div>

        <br />
        <!--Weight of the product-->
        <div> 
            <strong class="auto-style1">Weight: &nbsp; </strong>
            <asp:textbox runat="server" id="Weight" type="double" Width="50px" />lbs
            <!-- Validates to make sure something is entered into the field (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Weight" ErrorMessage="A Weight is required" ForeColor="Red" ValidationGroup="food"> * </asp:RequiredFieldValidator>
            <!-- Make custome method to ensure the weight is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckWeight" ErrorMessage="Your weight cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="Weight" ValidationGroup="food">*</asp:CustomValidator>
        </div>
        <br />


        <!-- Percentage of grains-->
        <div>
            <strong class="auto-style1">Percentage Grains: &nbsp; </strong>
            <asp:textbox runat="server" id="Percent_Grains" type="double" Width="50px" />%
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Percent_Grains" ErrorMessage="A percentage value for grains is required" ForeColor="Red" ValidationGroup="food"> * </asp:RequiredFieldValidator>
            <!-- Ensure the value is between 0 - 100 (percent) for validation-->
            <asp:RangeValidator runat="server" MinimumValue="0" MaximumValue="100" Type="Double" EnableClientScript="false" ErrorMessage="Please enter a percentage between 0 to 100 for the Percentage of Grains" ControlToValidate="Percent_Grains" ForeColor="Red" ValidationGroup="food">*</asp:RangeValidator>
                <!-- Validation for the percentages to ensure they = up to exaclty 100% and not anything lower or higher-->
            <asp:CustomValidator OnServerValidate="CheckPercent" ErrorMessage="Your percentage total is greater or less then 100%. Please check your values again!" ForeColor="Red" runat="server" ValidationGroup="food"> .</asp:CustomValidator>
        </div>
        <br />

        <!-- Precentage of Fruit-->
        <div>
            <strong class="auto-style1">Percentage Fruit: &nbsp; </strong>
            <asp:textbox runat="server" id="Percent_Fruit" type="double" Width="50px"/>%
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Percent_Fruit" ErrorMessage="A percentage value for fruit is required" ForeColor="Red" ValidationGroup="food"> * </asp:RequiredFieldValidator>
            <!-- Ensure the value is between 0 - 100 (percent) for validation-->
            <asp:RangeValidator runat="server" MinimumValue="0" MaximumValue="100" Type="Double" EnableClientScript="false" ValidationGroup="food" ErrorMessage="Please enter a percentage between 0 to 100 for the Percentage of Fruit" ControlToValidate="Percent_Fruit" ForeColor="Red">*</asp:RangeValidator>
        </div>
        <br />
                
        <!-- Percentage of Vegetables-->
        <div>
            <strong class="auto-style1">Percentage Vegetables: &nbsp; </strong>
            <asp:textbox runat="server" id="Percent_Veg" type="double" Width="50px" />%
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Percent_Veg" ErrorMessage="A percentage value for vegetables is required" ValidationGroup="food" ForeColor="Red"> * </asp:RequiredFieldValidator>
            <!-- Ensure the value is between 0 - 100 (percent) for validation-->
            <asp:RangeValidator runat="server" MinimumValue="0" MaximumValue="100" Type="Double" EnableClientScript="false" ValidationGroup="food" ErrorMessage="Please enter a percentage between 0 to 100 for the Percentage of Vegetables" ControlToValidate="Percent_Veg" ForeColor="Red">*</asp:RangeValidator>
        </div>
        <br />

        <!-- Percentage of Dairy-->
        <div>
            <strong class="auto-style1">Percentage Dairy: &nbsp; </strong>
            <asp:textbox runat="server" id="Percent_Dairy" type="double" Width="50px" />%
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Percent_Dairy" ErrorMessage="A percentage value for dairy is required" ForeColor="Red" ValidationGroup="food"> * </asp:RequiredFieldValidator>
            <!-- Ensure the value is between 0 - 100 (percent) for validation-->
            <asp:RangeValidator runat="server" MinimumValue="0" MaximumValue="100" Type="Double" EnableClientScript="false" ValidationGroup="food" ErrorMessage="Please enter a percentage between 0 to 100 for the Percentage of Dairy" ControlToValidate="Percent_Dairy" ForeColor="Red">*</asp:RangeValidator>
        </div>
        <br />

        <!-- Precentage of Paper-->
        <div>
            <strong class="auto-style1">Percentage Paper: &nbsp; </strong>
            <asp:textbox runat="server" id="Percent_Paper" type="double" Width="50px" />%
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Percent_Paper" ErrorMessage="A percentage value for paper is required" ForeColor="Red" ValidationGroup="food"> * </asp:RequiredFieldValidator>
            <!-- Ensure the value is between 0 - 100 (percent) for validation-->
            <asp:RangeValidator runat="server" MinimumValue="0" MaximumValue="100" Type="Double" EnableClientScript="false" ValidationGroup="food" ErrorMessage="Please enter a percentage between 0 to 100 for the Percentage of Paper" ControlToValidate="Percent_Paper" ForeColor="Red">*</asp:RangeValidator>
        </div>
        <br />
                
        <!-- Precentage of Coffee Grounds-->
        <div>
            <strong class="auto-style1">Percentage Coffee Grounds: &nbsp; </strong>
            <asp:textbox runat="server" id="Percent_CG" type="double" Width="50px" />%
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Percent_CG" ErrorMessage="A percentage value for coffee grounds is required" ForeColor="Red" ValidationGroup="food"> * </asp:RequiredFieldValidator>
            <!-- Ensure the value is between 0 - 100 (percent) for validation-->
            <asp:RangeValidator runat="server" MinimumValue="0" MaximumValue="100" Type="Double" EnableClientScript="false" ValidationGroup="food" ErrorMessage="Please enter a percentage between 0 to 100 for the Percentage of Coffee Grounds" ControlToValidate="Percent_CG" ForeColor="Red">*</asp:RangeValidator>
        </div>
        <br />
                
        <!-- Trash Present dropdown (yes/no)-->
        <div>
            <strong class="auto-style1">Trash Present: &nbsp; </strong>
            <asp:DropDownList runat="server" id="Trash" name="D1">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem value="Yes">Yes</asp:ListItem>
                <asp:ListItem value="No">No</asp:ListItem>
            </asp:DropDownList>
            <!-- Make sure choice was made-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Trash" ValidationGroup="food" ErrorMessage="Please pick a value for if trash in the food waste" ForeColor="Red"> * </asp:RequiredFieldValidator>
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
            <asp:Button ID="Reset1" Text="Reset" runat="server" OnClick="Reset1_Click"/>
           
          <!--<input id="Submit2" type="submit" value="Submit" />-->
            <asp:Button ID="buttonSubmit" Text="Submit" ValidationGroup="food" Style="float:right; " runat="server" OnClick="buttonSubmit_Click"/>
        </div>
    </div> 
</asp:Content>

