
using cdjamModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mgmt_foodwaste : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        using (cdjamEntities2 myEntities = new cdjamEntities2())
            {
            var allwaste = from foodWaste in myEntities.foodWastes
                           orderby foodWaste.date
                           select foodWaste;
            GridView1.DataSource = allwaste;
            GridView1.DataBind();
            }
    }

  
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}