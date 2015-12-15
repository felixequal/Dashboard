<%@ Page Title="" Language="C#" MasterPageFile="~/InputData.master" AutoEventWireup="true" CodeFile="BioDieselInputForm.aspx.cs" Inherits="BioDieselInputForm" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
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
    <div id="biodiesel">
        <!--Validation summary location if something is wrong will appear in this div that is of type food validationgroup-->
        <div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="There were errors on the page: " ForeColor="Red" ValidationGroup="bd"/>
        </div>

        <!--Batch Number input -->
        <div>
            <strong class="auto-style1">Batch Number: &nbsp; </strong>
            <asp:textbox runat="server" id="batch_num" type="int"/>
            <!--Validation includes to ensure something is picked in this field (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="batch_num" ErrorMessage="Please input a batch number" ForeColor="Red" ValidationGroup="bd"> * </asp:RequiredFieldValidator>
            <asp:CustomValidator OnServerValidate="CheckBatch" ErrorMessage="Your batch number cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="batch_num" ValidationGroup="bd">*</asp:CustomValidator>
        </div>
        <br />

        <!--Pick a start date this contains a date picker. Once enter box calander opens up on it. Use Googles script plugins that is open to public--> 
        <div>
            <strong>Batch Start Date:</strong>
            <asp:textbox runat="server" id="startdatepicker" />
            <!--Check to ensure that the date has something int the textbox-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="startdatepicker" ErrorMessage="A start date is required" ForeColor="Red" ValidationGroup="bd"> * </asp:RequiredFieldValidator>
            <br />
            <!-- Googles function called in script-->
            <script>
                $(function () {
                    $("#<%= startdatepicker.ClientID %>").datepicker();
                });
            </script>   
        </div>
        <br />

        <!--Pick a finish date this contains a date picker. Once enter box calander opens up on it. Use Googles script plugins that is open to public--> 
        <div>
            <strong>Batch Finish Date:</strong>
            <asp:textbox runat="server" id="finishdatepicker" />
            <!--Check to ensure that the date has something int the textbox-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="finishdatepicker" ErrorMessage="A end date is required" ForeColor="Red" ValidationGroup="bd"> * </asp:RequiredFieldValidator>
            <br />
            <!-- Googles function called in script-->
            <script>
                $(function () {
                    $("#<%= finishdatepicker.ClientID %>").datepicker();
                });
            </script>   
        </div>

        <br />
        <!--Total process time of the product-->
        <div> 
            <strong class="auto-style1">Total Process Time (hours): &nbsp; </strong>
            <asp:textbox runat="server" id="process_time" type="double" Width="80px" />
            <!-- Validates to make sure something is entered into the field (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="process_time" ErrorMessage="A total process time for Biodeisel is required" ForeColor="Red" ValidationGroup="bd"> * </asp:RequiredFieldValidator>
            <!-- Make custome method to ensure the process time is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckProcess" ErrorMessage="Your total process time for biodeisel cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="process_time" ValidationGroup="bd">*</asp:CustomValidator>
        </div>
        <br />


        <!-- VOlume of Collected Kitchen Waste Oil-->
        <div>
            <strong class="auto-style1">Volume of Collected Kitchen Waste Oil: &nbsp; </strong>
            <asp:textbox runat="server" id="Collected_kwo" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Collected_kwo" ErrorMessage="Volume for Collected Kitchen waste Oil is required" ForeColor="Red" ValidationGroup="bd"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the collect kwo is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckCollection" ErrorMessage="Your volume for collected Waste oil cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="Collected_kwo" ValidationGroup="bd">*</asp:CustomValidator> 
        </div>
        <br />

         <!-- VOlume of Collected Kitchen Waste Oil-->
        <div>
            <strong class="auto-style1">Volume of Processed Kitchen Waste Oil: &nbsp; </strong>
            <asp:textbox runat="server" id="Processed_kwo" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Processed_kwo" ErrorMessage="Volume for Processed Kitchen waste Oil is required" ForeColor="Red" ValidationGroup="bd"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the processed kwo is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckProcessed" ErrorMessage="Your volume for processed Waste oil cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="Processed_kwo" ValidationGroup="bd">*</asp:CustomValidator>
        </div>
        <br />
                
        <!-- VOlume of biodiesel produced-->
        <div>
            <strong class="auto-style1">Volume of Biodiesel Produced: &nbsp; </strong>
            <asp:textbox runat="server" id="bio_produce" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="bio_produce" ErrorMessage="Volume of biodiesel produced is required" ForeColor="Red" ValidationGroup="bd"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the bio is not a negative number-->
            <asp:CustomValidator OnServerValidate="Checkbio" ErrorMessage="Your volume for biodiesel produced cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="bio_produce" ValidationGroup="bd">*</asp:CustomValidator>
        </div>
        <br />

        <!-- VOlume of waste produced-->
        <div>
            <strong class="auto-style1">Volume of Waste Produced: &nbsp; </strong>
            <asp:textbox runat="server" id="waste_produce" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="waste_produce" ErrorMessage="Volume of waste produced is required" ForeColor="Red" ValidationGroup="bd"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the bio is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckProWaste" ErrorMessage="Your volume for waste produced cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="waste_produce" ValidationGroup="bd">*</asp:CustomValidator>
        </div>
        <br />

        <!-- energy required-->
        <div>
            <strong class="auto-style1">Energy required to Produce Biodiesel: &nbsp; </strong>
            <asp:textbox runat="server" id="energy_bio" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="energy_bio" ErrorMessage="Energry required to produce biodiesel is required" ForeColor="Red" ValidationGroup="bd"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the energy on bio is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckEnergyBio" ErrorMessage="Your energy to produce biodiesel cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="energy_bio" ValidationGroup="bd">*</asp:CustomValidator>
        </div>
        <br />
                
        <!-- amount of methanol used-->
        <div>
            <strong class="auto-style1">Amount of Methanol Used: &nbsp; </strong>
            <asp:textbox runat="server" id="methanol" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="methanol" ErrorMessage="Methanol used is required" ForeColor="Red" ValidationGroup="bd"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the methanol is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckMethanol" ErrorMessage="Methanol used cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="methanol" ValidationGroup="bd">*</asp:CustomValidator>
        </div>
        <br />

        <!-- amount of potassium hydroxide used-->
        <div>
            <strong class="auto-style1">Amount of Potassium Hydroxide Used: &nbsp; </strong>
            <asp:textbox runat="server" id="KH2" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="KH2" ErrorMessage="Potassium Hydroxide used is required" ForeColor="Red" ValidationGroup="bd"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the methanol is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckKH2" ErrorMessage="Potassium Hydroxide used cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="KH2" ValidationGroup="bd">*</asp:CustomValidator>
        </div>
        <br />
                
        <!-- Quality of finished product (passed/failed)-->
        <div>
            <strong class="auto-style1">Quality of Finsihed Product: &nbsp; </strong>
            <asp:DropDownList runat="server" id="quality" name="qfp">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem value="Pass">Pass</asp:ListItem>
                <asp:ListItem value="Fail">Fail</asp:ListItem>
            </asp:DropDownList>
            <!-- Make sure choice was made-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="quality" ValidationGroup="bd" ErrorMessage="Please pick a value for the qualityof finished product" ForeColor="Red"> * </asp:RequiredFieldValidator>
        </div>
        <br />
        
         <!-- Cost of kitchen waste oil-->
        <div>
            <strong class="auto-style1">Cost of Kitchen Waste Oil: &nbsp; </strong>
            $<asp:textbox runat="server" id="cost_kwo" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="cost_kwo" ErrorMessage="Cost of kitchen waste oil is required" ForeColor="Red" ValidationGroup="bd"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the methanol is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckCostkwo" ErrorMessage="Cost of kitchen waste oil cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="cost_kwo" ValidationGroup="bd">*</asp:CustomValidator>
        </div>
        <br />

        <!-- Cost of waste disposal-->
        <div>
            <strong class="auto-style1">Cost of Waste Disposal: &nbsp; </strong>
            $<asp:textbox runat="server" id="cost_wd" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="cost_wd" ErrorMessage="Cost of waste disposal is required" ForeColor="Red" ValidationGroup="bd"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the methanol is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckCostwd" ErrorMessage="Cost of waste disposal cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="cost_wd" ValidationGroup="bd">*</asp:CustomValidator>
        </div>
        <br />

         <!-- man hours spend-->
        <div>
            <strong class="auto-style1">Man Hours Spent on Batch: &nbsp; </strong>
            <asp:textbox runat="server" id="Manhrs" type="double" Width="50px" /> Hours
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Manhrs" ErrorMessage="Man hours spent on batch is required" ForeColor="Red" ValidationGroup="bd"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the methanol is not a negative number-->
            <asp:CustomValidator OnServerValidate="ManHrsSpent" ErrorMessage="Man hours spent on batch cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="Manhrs" ValidationGroup="bd">*</asp:CustomValidator>
        </div>
        <br />

         <!-- Market cost of BD at time of finished run-->
        <div>
            <strong class="auto-style1">Market Cost of Biodiesel: &nbsp; </strong>
            $<asp:textbox runat="server" id="martketcostbd" type="double" Width="50px" />
            <!-- Validator to ensure a number is in the text box (required)-->
            <asp:RequiredFieldValidator runat="server" ControlToValidate="martketcostbd" ErrorMessage="Market cost of biodiesel is required" ForeColor="Red" ValidationGroup="bd"> * </asp:RequiredFieldValidator>
             <!-- Make custome method to ensure the methanol is not a negative number-->
            <asp:CustomValidator OnServerValidate="CheckCostbd" ErrorMessage="Market cost of biodiesel cannot be negative!" ForeColor="Red" runat="server" ControlToValidate="martketcostbd" ValidationGroup="bd">*</asp:CustomValidator>
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
            <asp:Button ID="buttonSubmit" Text="Submit" ValidationGroup="bd" runat="server" OnClick="buttonSubmit_Click"/>
        </div>
    </div> 
</asp:Content>

