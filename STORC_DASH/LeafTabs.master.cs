using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LeafTabs : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TabWidget.CssClass = "Clicked";
            MainView.ActiveViewIndex = 0;
        }
    }

    // When the Widget tab is loaded tabs look different depending on image. Also load page associated with it
    // Loads Widgets
    protected void TabWidget_Click(object sender, EventArgs e)
    {
        TabWidget.CssClass = "Clicked";
        TabInput.CssClass = "Initial";
        TabEdit.CssClass = "Initial";
        MainView.ActiveViewIndex = 0;
    }


    // When the Input Data tab is loaded tabs look different depending on image. Also load page associated with it
    // Loads Input Data
    protected void TabInput_Click(object sender, EventArgs e)
    {
        TabWidget.CssClass = "Initial";
        TabInput.CssClass = "Clicked";
        TabEdit.CssClass = "Initial";
        MainView.ActiveViewIndex = 1;
    }

    // When the Edit Data tab is loaded tabs look different depending on image. Also load page associated with it
    // Loads Edit Data
    protected void TabEdit_Click(object sender, EventArgs e)
    {
        TabWidget.CssClass = "Initial";
        TabInput.CssClass = "Initial";
        TabEdit.CssClass = "Clicked";
        MainView.ActiveViewIndex = 2;
    }
}
