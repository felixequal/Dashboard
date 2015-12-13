using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InputDataTabs : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Aquaponics.CssClass = "Clicked_Datasub_aqua";
            SubInputView.ActiveViewIndex = 0;
        }
    }

    protected void aqua_Click(object sender, EventArgs e)
    {
        Aquaponics.CssClass = "Clicked_Datasub_aqua";
        Vermiculture.CssClass = "Initial_DataSub_vermi";
        Compost.CssClass = "Initial_DataSub_comp";
        Energy.CssClass = "Initial_DataSub_energy";
        Biodiesel.CssClass = "Initial_DataSub_bio";
        SubInputView.ActiveViewIndex = 0;
    }

    protected void vermi_Click(object sender, EventArgs e)
    {
        Aquaponics.CssClass = "Initial_DataSub_aqua";
        Vermiculture.CssClass = "Clicked_Datasub_vermi";
        Compost.CssClass = "Initial_DataSub_comp";
        Energy.CssClass = "Initial_DataSub_energy";
        Biodiesel.CssClass = "Initial_DataSub_bio";
        SubInputView.ActiveViewIndex = 1;
    }

    protected void comp_Click(object sender, EventArgs e)
    {
        Aquaponics.CssClass = "Initial_DataSub_aqua";
        Vermiculture.CssClass = "Initial_DataSub_vermi";
        Compost.CssClass = "Clicked_Datasub_comp";
        Energy.CssClass = "Initial_DataSub_energy";
        Biodiesel.CssClass = "Initial_DataSub_bio";
        SubInputView.ActiveViewIndex = 2;
    }

    protected void energy_Click(object sender, EventArgs e)
    {
        Aquaponics.CssClass = "Initial_DataSub_aqua";
        Vermiculture.CssClass = "Initial_DataSub_vermi";
        Compost.CssClass = "Initial_DataSub_comp";
        Energy.CssClass = "Clicked_Datasub_energy";
        Biodiesel.CssClass = "Initial_DataSub_bio";
        SubInputView.ActiveViewIndex = 3;
    }

    protected void bio_Click(object sender, EventArgs e)
    {
        Aquaponics.CssClass = "Initial_DataSub_aqua";
        Vermiculture.CssClass = "Initial_DataSub_vermi";
        Compost.CssClass = "Initial_DataSub_comp";
        Energy.CssClass = "Initial_DataSub_energy";
        Biodiesel.CssClass = "Clicked_Datasub_bio";
        SubInputView.ActiveViewIndex = 4;
    }
}
