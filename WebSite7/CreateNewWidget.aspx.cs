using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateNewWidget : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            //Type of Widget Dropdown setup 
            string[] widgetTypes = new string[6];
            widgetTypes[0] = "";
            widgetTypes[1] = "Calendar";
            widgetTypes[2] = "Bar Graph";
            widgetTypes[3] = "Line Graph";
            widgetTypes[4] = "Pie Graph";
            widgetTypes[5] = "Donut Graph";
            WidgetTypeSelection.DataSource = widgetTypes;
            WidgetTypeSelection.DataBind();
            //Project Dropdown setup 
            DataClassesDataContext db = new DataClassesDataContext();
            List<string> populateProjectDropdown = (from project in db.Projects select project.Project_Name).ToList();
            populateProjectDropdown.Insert(0, "");
            ProjectSelection.DataSource = populateProjectDropdown;
            ProjectSelection.DataBind();
        }
    }

    protected void ProjectSelection_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}