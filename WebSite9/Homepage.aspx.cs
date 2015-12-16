using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Homepage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Tab1.CssClass = "Clicked";
            MainView.ActiveViewIndex = 0;
        }
    }

    protected void Tab1_Click(object sender, EventArgs e)
    {
        Tab1.CssClass = "Clicked";
        Tab2.CssClass = "Initial";
        Tab3.CssClass = "Initial";
        MainView.ActiveViewIndex = 0;
    }

    protected void Tab2_Click(object sender, EventArgs e)
    {
        Tab1.CssClass = "Initial";
        Tab2.CssClass = "Clicked";
        Tab3.CssClass = "Initial";
        MainView.ActiveViewIndex = 1;
    }

    protected void Tab3_Click(object sender, EventArgs e)
    {
        Tab1.CssClass = "Initial";
        Tab2.CssClass = "Initial";
        Tab3.CssClass = "Clicked";
        MainView.ActiveViewIndex = 2;
    }

    protected void aqua_Click(object sender, EventArgs e)
    {
        Aquaponics.CssClass = "Clicked_Datasub_aqua";
        Vermiculture.CssClass = "Initial_DataSub_vermi";
        Compost.CssClass = "Initial_DataSub_comp";
        Energy.CssClass = "Initial_DataSub_energy";
        Biodiesel.CssClass = "Initial_DataSub_bio";
    }

    protected void vermi_Click(object sender, EventArgs e)
    {
        Aquaponics.CssClass = "Initial_DataSub_aqua";
        Vermiculture.CssClass = "Clicked_Datasub_vermi";
        Compost.CssClass = "Initial_DataSub_comp";
        Energy.CssClass = "Initial_DataSub_energy";
        Biodiesel.CssClass = "Initial_DataSub_bio";
    }

    protected void comp_Click(object sender, EventArgs e)
    {
        Aquaponics.CssClass = "Initial_DataSub_aqua";
        Vermiculture.CssClass = "Initial_DataSub_vermi";
        Compost.CssClass = "Clicked_Datasub_comp";
        Energy.CssClass = "Initial_DataSub_energy";
        Biodiesel.CssClass = "Initial_DataSub_bio";
    }

    protected void energy_Click(object sender, EventArgs e)
    {
        Aquaponics.CssClass = "Initial_DataSub_aqua";
        Vermiculture.CssClass = "Initial_DataSub_vermi";
        Compost.CssClass = "Initial_DataSub_comp";
        Energy.CssClass = "Clicked_Datasub_energy";
        Biodiesel.CssClass = "Initial_DataSub_bio";
    }

    protected void bio_Click(object sender, EventArgs e)
    {
        Aquaponics.CssClass = "Initial_DataSub_aqua";
        Vermiculture.CssClass = "Initial_DataSub_vermi";
        Compost.CssClass = "Initial_DataSub_comp";
        Energy.CssClass = "Initial_DataSub_energy";
        Biodiesel.CssClass = "Clicked_Datasub_bio";
    }

    protected void adduser_Click(object sender, EventArgs e)
    {
        add_user.CssClass = "Clicked_adduser";
        delete_user.CssClass = "Initial_deleteuser";
        manage_user.CssClass = "Initial_manageuser";
    }

    protected void deleteuser_Click(object sender, EventArgs e)
    {
        delete_user.CssClass = "Clicked_deleteuser";
        add_user.CssClass = "Initial_adduser";
        manage_user.CssClass = "Initial_manageuser";
    }

    protected void manageuser_Click(object sender, EventArgs e)
    {
        delete_user.CssClass = "Initial_deleteuser";
        add_user.CssClass = "Initial_adduser";
        manage_user.CssClass = "Clicked_manageuser";
    }

}