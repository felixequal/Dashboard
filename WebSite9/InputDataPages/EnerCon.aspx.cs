using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnerCon : System.Web.UI.Page
{
    // Create an instance of a database
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //Validation check to ensure energy produce is not negative
    protected void CheckKW(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double pro = Convert.ToDouble(kw_h.Text);
            //Send the valid method if weight is greater than 0 (aka not negative)
            e.IsValid = (pro >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //Validation check to ensure energy cost is not negative
    protected void CheckCostKW(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double pro = Convert.ToDouble(cost_kw.Text);
            //Send the valid method if weight is greater than 0 (aka not negative)
            e.IsValid = (pro >= 0);
        }
        catch
        { e.IsValid = false; }
    }

    //When the submit button is commeted should do the following
    protected void buttonSubmit_Click(object sender, EventArgs e)
    {
        //Ensure the page is valid before you submit to the database
        if (Page.IsValid)
        {
            //Create instance of compost db and load values to go into the db
            EnergyConsumed ec = new EnergyConsumed
            {
                EnergyConsumer = Convert.ToString(consumer.SelectedItem.Text),
                SourceOfEnergyUse = Convert.ToString(producer.SelectedItem.Text),
                Date = Convert.ToDateTime(datepicker.Text),
                kWPerHour = Convert.ToDouble(kw_h.Text),
                CostkWPerHour = Convert.ToDecimal(cost_kw.Text),
                Notes = Convert.ToString(Notes1.Text)

            };
            //Insert fw into db
            db.EnergyConsumeds.InsertOnSubmit(ec);
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