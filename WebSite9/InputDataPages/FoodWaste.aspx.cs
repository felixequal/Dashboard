using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FoodWaste : System.Web.UI.Page
{
    // Create an instance of a database
    DataClassesDataContext db = new DataClassesDataContext();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    //Validation to check to ensure all percentage valuse in the food waste from vendors forms add up to exactly 100%
    protected void CheckPercent(object sender, ServerValidateEventArgs e)
    {
        //Try to convert them to doubles if not send error
        try
        {
            //convert and add to percentage
            double percent = Convert.ToDouble(Percent_Grains.Text) + Convert.ToDouble(Percent_Fruit.Text) + Convert.ToDouble(Percent_Veg.Text) + Convert.ToDouble(Percent_Dairy.Text) + Convert.ToDouble(Percent_Paper.Text) + Convert.ToDouble(Percent_CG.Text);
            //Send the valid method if percent == exzctly 100
            e.IsValid = (percent == 100.00);
        }
        catch
        {

        }
    }

    //Validation check to ensure weight is not negative
    protected void CheckWeight(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double weight = Convert.ToDouble(Weight.Text);
            //Send the valid method if weight is greater than 0 (aka not negative)
            e.IsValid = (weight >= 0);
        }
        catch
        { }
    }

    //When the submit button is commeted should do the following
    protected void buttonSubmit_Click(object sender, EventArgs e)
    {
        //Ensure the page is valid before you submit to the database
        if (Page.IsValid)
        {
            //See if the trash is a yes/no if no switch present to false
            Boolean present = true;
            if((Trash.SelectedItem.Text).Equals("No"))
            {
                present = false;
            }
            //Create instance of compost db and load values to go into the db
            Compost fw = new Compost
            {
                date = Convert.ToDateTime(datepicker.Text),
                weight = Convert.ToDouble(Weight.Text),
                percentGrains = Convert.ToDouble(Percent_Grains.Text),
                percentFruit = Convert.ToDouble(Percent_Fruit.Text),
                percentVeg = Convert.ToDouble(Percent_Veg.Text),
                percentDairy = Convert.ToDouble(Percent_Dairy.Text),
                percentPaper = Convert.ToDouble(Percent_Paper.Text),
                percentCoffeeGrounds = Convert.ToDouble(Percent_CG.Text),
                trashPresent = present,
                Notes = Convert.ToString(Notes1.Text),
                wasteType = "Foodwaste",
                Vendor = Convert.ToString(Location.SelectedItem.Text)
            };
            //Insert fw into db
            db.Composts.InsertOnSubmit(fw);
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