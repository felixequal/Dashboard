using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnergyForms : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            EnergyFormView.ActiveViewIndex = 0;
        }
    }

    // Loads the Food Waste Form
    protected void TabEnergyProd_Click(object sender, EventArgs e)
    {
        EnergyFormView.ActiveViewIndex = 0;
    }


    // Load the Hot Compost Form
    protected void TabEnergyCon_Click(object sender, EventArgs e)
    {
        EnergyFormView.ActiveViewIndex = 1;
    }
}
