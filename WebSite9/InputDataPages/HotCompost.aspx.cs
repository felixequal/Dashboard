using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InputDataPages_HotCompost : System.Web.UI.Page
{
    // Create an instance of a database
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CheckWeight(object sender, ServerValidateEventArgs e)
    {
        // Try to convert to double if not send error
        try
        {
            // Convert
            double weight = Convert.ToDouble(Weight_hc.Text);
            //Send the valid method if weight is greater than 0 (aka not negative)
            e.IsValid = (weight > 0);
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
            Compost fw = new Compost
            {
                date = Convert.ToDateTime(datepicker_hc.Text),
                weight = Convert.ToDouble(Weight_hc.Text),
                wasteType = "HotCompost"
            };
            db.Composts.InsertOnSubmit(fw);
            //Submit the changes and go home page
            //NOTE: Will not go to home page runnign in VS due to the way master pages work.
            try
            {
                db.SubmitChanges();
                //Response.Redirect("../Widgets.aspx");
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