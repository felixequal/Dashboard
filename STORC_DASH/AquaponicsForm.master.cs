using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AquaponicsForm : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            AquaFormView.ActiveViewIndex = 0;
        }
    }

    // Loads the Food Waste Form
    protected void TabFishPro_Click(object sender, EventArgs e)
    {
        AquaFormView.ActiveViewIndex = 0;
    }


    // Load the Hot Compost Form
    protected void TabPlantPro_Click(object sender, EventArgs e)
    {
        AquaFormView.ActiveViewIndex = 1;
    }

    // Load the Veggie Oil Form
    protected void TabFishTank_Click(object sender, EventArgs e)
    {
        AquaFormView.ActiveViewIndex = 2;
    }
}
