using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CompostForms : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CompFormView.ActiveViewIndex = 0;
        }
    }

    // Loads the Food Waste Form
    protected void TabFoodWaste_Click(object sender, EventArgs e)
    {
        CompFormView.ActiveViewIndex = 0;
    }


    // Load the Hot Compost Form
    protected void TabHotCompost_Click(object sender, EventArgs e)
    {
        CompFormView.ActiveViewIndex = 1;
    }

    // Load the Veggie Oil Form
    protected void TabVegOil_Click(object sender, EventArgs e)
    {
        CompFormView.ActiveViewIndex = 2;
    }
}
