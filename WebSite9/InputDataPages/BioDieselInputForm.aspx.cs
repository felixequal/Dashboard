using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BioDieselInputForm : System.Web.UI.Page
{// Create an instance of a database
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //Validation check to ensure batch is not negative
    protected void CheckBatch(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double batch = Convert.ToDouble(batch_num.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (batch >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Validation check to ensure batch is not negative
    protected void CheckProcess(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(process_time.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Validation to ensure collected kwo not negative
    protected void CheckCollection(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(Collected_kwo.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Validation to ensure processed kwo not negative
    protected void CheckProcessed(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(Processed_kwo.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Validation to ensure bio produced kwo not negative
    protected void Checkbio(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(bio_produce.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Validation to ensure bio produced kwo not negative
    protected void CheckProWaste(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(waste_produce.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Validation to ensure Energy bio is not negative
    protected void CheckEnergyBio(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(energy_bio.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Validation to ensure methonal is not negative
    protected void CheckMethanol(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(methanol.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Validation to ensure KH2 is not negative
    protected void CheckKH2(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(KH2.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Ensure that cost of kwo is not negative
    protected void CheckCostkwo(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(cost_kwo.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Ensure that cost of wd is not negative
    protected void CheckCostwd(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(cost_wd.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Ensure that man hours is not negative
    protected void ManHrsSpent(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(Manhrs.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Ensure that man hours is not negative
    protected void CheckCostbd(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(martketcostbd.Text);
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
            //See if the biodesial is a pass or faile if fail switch present to false
            Boolean qual = true;
            if ((quality.SelectedItem.Text).Equals("Fail"))
            {
                qual = false;
            }
            //Create instance of compost db and load values to go into the db
            Biodiesel bd = new Biodiesel
            {
                BatchNumber = Convert.ToInt16(batch_num.Text),
                StartRunDate = Convert.ToDateTime(startdatepicker.Text),
                EndRunDate = Convert.ToDateTime(finishdatepicker.Text),
                TotalProcessingTime = Convert.ToDouble(process_time.Text),
                VolumeWasteOilColleted = Convert.ToDouble(Collected_kwo.Text),
                VolumeWasteOilProduced = Convert.ToDouble(Processed_kwo.Text),
                VolumeBiodieselProduced = Convert.ToDouble(bio_produce.Text),
                VolumeWasteProduced = Convert.ToDouble(waste_produce.Text),
                EnergyRequired = Convert.ToDouble(energy_bio.Text),
                MethanolUsed = Convert.ToDouble(methanol.Text),
                PotassiumHydroxideUsed = Convert.ToDouble(KH2.Text),
                QualityPassFail = qual,
                CostOfWasteOil = Convert.ToDecimal(cost_kwo.Text),
                ManHours = Convert.ToDouble(Manhrs.Text),
                CostOfDisposal = Convert.ToDecimal(cost_wd.Text),
                MarketCostBiodiesel = Convert.ToDecimal(martketcostbd.Text),
                Notes = Notes1.Text
            };
            //Insert fw into db
            db.Biodiesels.InsertOnSubmit(bd);
            //Submit the changes and go home page
            //NOTE: Will not go to home page runnign in VS due to the way master pages work.
            try
            {
                db.SubmitChanges();
                Response.Redirect("../Widgets.aspx");
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