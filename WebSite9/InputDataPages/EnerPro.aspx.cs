using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnerPro : System.Web.UI.Page
{
    // Create an instance of a database
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //Validation check to ensure energy produce is not negative
    protected void CheckEP(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double pro = Convert.ToDouble(energy_pro.Text);
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
            EnergyProduction ep = new EnergyProduction
            {
                EnergyProducer = Convert.ToString(producer.SelectedItem.Text),
                Date = Convert.ToDateTime(datepicker.Text),
                AmountEnergyCreated = Convert.ToDouble(energy_pro.Text),
                PercentageOfEnergyProduced = Convert.ToDouble(Percent_Energy.Text),
                Notes = Convert.ToString(Notes1.Text)
                
            };
            //Insert fw into db
            db.EnergyProductions.InsertOnSubmit(ep);
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