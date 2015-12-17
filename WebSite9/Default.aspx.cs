using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterClientScriptInclude("GridsterJS", ResolveUrl(@"Scripts\gridster.js"));
        Page.ClientScript.RegisterClientScriptInclude("CreateWidgetJS", ResolveUrl(@"Scripts\CreateNewWidget.js"));
        Page.ClientScript.RegisterClientScriptInclude("ChartJS", ResolveUrl(@"Scripts\Chart.js"));
    }
}