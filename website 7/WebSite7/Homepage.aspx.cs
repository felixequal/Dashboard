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
            //Type of Widget Dropdown setup 
           // string[] widgetTypes = new string[5];
            //widgetTypes[0] = "--Select--";
            //widgetTypes[1] = "Bar Chart";
            //widgetTypes[2] = "Line Chart";
            //widgetTypes[3] = "Pie Chart";
            //widgetTypes[4] = "Donut Chart";
            //WidgetTypeSelection.DataSource = widgetTypes;
            //WidgetTypeSelection.DataBind();
            //Project Dropdown setup 
            //DataClassesDataContext db = new DataClassesDataContext();
            //List<string> populateProjectDropdown = (from project in db.Projects select project.Project_Name).ToList();
            //populateProjectDropdown.Insert(0, "--Select--");
            //ProjectSelection.DataSource = populateProjectDropdown;
            //ProjectSelection.DataBind();

        }
    }
   
    /*protected void ProjectSelection_SelectedIndexChanged(object sender, EventArgs e)
    {
        ProjectDataSelect.ClearSelection();
        string dataSelect = ProjectSelection.SelectedValue.ToString();
        if (dataSelect.Equals("Aquaponics"))
        {
            string[] dropdownPopulate = new string[3];
            dropdownPopulate[0] = "--Select--";
            dropdownPopulate[1] = "Chemical Levels";
            dropdownPopulate[2] = "Fish Stats";
            ProjectDataSelect.DataSource = dropdownPopulate;
            ProjectDataSelect.DataBind();
        }
        else if (dataSelect.Equals("Vermiculture"))
        {
            string[] dropdownPopulate = new string[3];
            dropdownPopulate[0] = "--Select--";
            dropdownPopulate[1] = "Foodwaste - Weights";
            dropdownPopulate[2] = "Foodwaste - Percentages";
            ProjectDataSelect.DataSource = dropdownPopulate;
            ProjectDataSelect.DataBind();
        }
        else if (dataSelect.Equals("Biodiesil"))
        {
            string[] dropdownPopulate = new string[3];
            dropdownPopulate[0] = "--Select--";
            dropdownPopulate[1] = "Foodwaste - Weights";
            dropdownPopulate[2] = "Foodwaste - Percentages";
            ProjectDataSelect.DataSource = dropdownPopulate;
            ProjectDataSelect.DataBind();
        }
        else if (dataSelect.Equals("Energy"))
        {
            string[] dropdownPopulate = new string[3];
            dropdownPopulate[0] = "--Select--";
            dropdownPopulate[1] = "Foodwaste - Weights";
            dropdownPopulate[2] = "Foodwaste - Percentages";
            ProjectDataSelect.DataSource = dropdownPopulate;
            ProjectDataSelect.DataBind();
        }
        else
        {
            string[] dropdownPopulate = new string[1];
            dropdownPopulate[0] = "--N/A--";
            ProjectDataSelect.DataSource = dropdownPopulate;
            ProjectDataSelect.DataBind();
        }
        ProjectDataSelect.Visible = true;
        ProjectDataSelectLabel.Visible = true;
    }
    protected void WidgetTypeSelection_SelectionIndexChanged(object sender, EventArgs e)
    {
        ProjectSelectionLabel.Visible = true;
        ProjectSelection.Visible = true;
        ProjectDataSelect.Visible = false;
        ProjectDataSelectLabel.Visible = false;
        ProjectSelection.ClearSelection();
        ProjectDataSelect.ClearSelection();
    }*/
}