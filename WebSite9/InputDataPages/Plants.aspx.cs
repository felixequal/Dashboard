using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Plants : System.Web.UI.Page
{
    // Create an instance of a database
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //Validation check to ensure fish count is not negative
    protected void CheckNum(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double batch = Convert.ToDouble(num_plant.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (batch >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    protected void plantBed(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double batch = Convert.ToDouble(plant_bed.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (batch >= 0);
        }
        catch
        { e.IsValid = false; }
    }



    //Validation check to ensure batch is not negative
    protected void CheckHumidity(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(green_humidity.Text);
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
            AquaFarming plant = new AquaFarming
            {
                Date = Convert.ToDateTime(datepicker.Text),
                GreenHouseTemp = Convert.ToDouble(green_temp.Text),
                GreenHouseHumidity = Convert.ToDouble(green_humidity.Text),
                PlantType = Convert.ToString(species.Text),
                AmountHarvested = Convert.ToInt16(num_plant.Text),
                HarvestedBedNumber = Convert.ToInt16(plant_bed.Text),
                PlantHealth = Convert.ToString(health_plant.SelectedItem.Text),
                Notes = Notes1.Text
            };
            //Insert fw into db
            db.AquaFarmings.InsertOnSubmit(plant);
            //Submit the changes and go home page
            //NOTE: Will not go to home page runnign in VS due to the way master pages work.
            try
            {
                db.SubmitChanges();
                Response.Redirect("~/Default.aspx");
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