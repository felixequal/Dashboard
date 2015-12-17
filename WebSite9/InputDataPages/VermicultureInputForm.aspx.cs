using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VermicultureInputForm : System.Web.UI.Page
{
    // Create an instance of a database
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //Ensure that vermi most is not negative
    protected void CheckMoist(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(vermi_moistcon.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Ensure that worms removed is not negative
    protected void Checkwormsrem(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(worms_removed.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Ensure that worms removed is not negative
    protected void Checkwormsadd(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(worms_added.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Ensure that vermicompost produced is not negative
    protected void Checkvermipro(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(Vol_vermiproducde.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Ensure that vermicompost tea is not negative
    protected void Checkvermitea(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(vermi_tea.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Ensure thatvermicompost cost is not negative
    protected void Checkcostvermi(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(Cost_vermi.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Ensure that worms removed is not negative
    protected void CheckMarCostvermi(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(marketcostvermi.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }




    protected void buttonSubmit_Click(object sender, EventArgs e)
    {
        //Ensure the page is valid before you submit to the database
        if (Page.IsValid)
        {
            //Create instance of compost db and load values to go into the db
            Vermiculture vc = new Vermiculture
            {
                StartDate = Convert.ToDateTime(startdatepicker.Text),
                EndDate = Convert.ToDateTime(finishdatepicker.Text),
                VolumeCompostProduced = Convert.ToDouble(Vol_vermiproducde.Text),
                BedTemperature = Convert.ToDouble(vermi_temp.Text),
                BedMoisture = Convert.ToDouble(vermi_moistcon.Text),
                TeaProduced = Convert.ToDouble(vermi_tea.Text),
                WormRemoved = Convert.ToInt16(worms_removed.Text),
                ProductionCost = Convert.ToDecimal(Cost_vermi.Text),
                MarketValue = Convert.ToDecimal(marketcostvermi.Text),
                WormsAdded = Convert.ToInt16(worms_added.Text),
                Notes = Notes1.Text

            };
            db.Vermicultures.InsertOnSubmit(vc);
            //Submit the changes and go home page
            //NOTE: Will not go to home page runnign in VS due to the way master pages work.
            try
            {
                db.SubmitChanges();
            }
            //If not throw error
            catch
            {
                Console.WriteLine(e);
                db.SubmitChanges();
            }

        }
    }
}