using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tank : System.Web.UI.Page
{
    // Create an instance of a database
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void buttonSubmit_Click(object sender, EventArgs e)
    {
        //Ensure the page is valid before you submit to the database
        if (Page.IsValid)
        {
            //Create instance of compost db and load values to go into the db
            Fishtank_DataPoint tank = new Fishtank_DataPoint
            {
                TankID = Convert.ToString(Location.SelectedItem.Text),
                Ammonia_Concentration = Convert.ToDouble(ac.Text),
                O2_Concentration  = Convert.ToDouble(o2.Text),
                Temp = Convert.ToDouble(water_temp.Text),
                EC = Convert.ToDouble(ec.Text),
                DO = Convert.ToDouble(d_o.Text),
                pH = Convert.ToDouble(ph.Text),
                NH3_NH4 = Convert.ToDouble(nh34.Text),
                NO2 = Convert.ToDouble(no2.Text),
                NO3 = Convert.ToDouble(no3.Text),
                FE = Convert.ToDouble(fe.Text),
                P = Convert.ToDouble(p.Text),
                K = Convert.ToDouble(k.Text),
                CO = Convert.ToDouble(co.Text),
                MG = Convert.ToDouble(mg.Text),
                DataDate = Convert.ToDateTime(datepicker.Text)
            };
            //Insert fw into db
            db.Fishtank_DataPoints.InsertOnSubmit(tank);
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