using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FishPro : System.Web.UI.Page
{// Create an instance of a database
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
            double batch = Convert.ToDouble(num_fish.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (batch >= 0);
        }
        catch
        {
            e.IsValid = false;
        }
    }

    //Validation check to ensure batch is not negative
    protected void CheckBuf(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(buf_add.Text);
            //Send the valid method if batch is greater than 0 (aka not negative)
            e.IsValid = (process >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Validation to ensure collected kwo not negative
    protected void CheckFood(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double process = Convert.ToDouble(fish_food.Text);
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
            AquaFish fishes = new AquaFish
            {
                Date = Convert.ToDateTime(datepicker.Text),
                TankLocation = Convert.ToString(Location.SelectedItem.Text),
                Specie = Convert.ToString(species.Text),
                NumberOfFish = Convert.ToInt16(num_fish.Text),
                TankTemp = Convert.ToDouble(water_temp.Text),
                HealthOfFish = Convert.ToString(health_fish.SelectedItem.Text),
                QualityOfWater = Convert.ToString(quality_aqua.SelectedItem.Text),
                LastDateOfWaterChange = Convert.ToDateTime(water_change.Text),
                DateBufferAdded = Convert.ToDateTime(buffer.Text),
                AmountBufferAdded = Convert.ToDouble(buf_add.Text),
                DateLastFed = Convert.ToDateTime(fish_fed.Text),
                AmountFed = Convert.ToDouble(fish_food.Text),
                Notes = Notes1.Text
            };
            //Insert fw into db
            db.AquaFishes.InsertOnSubmit(fishes);
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