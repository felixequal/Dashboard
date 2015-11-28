using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    int counter;
    protected void Page_Load(object sender, EventArgs e)
    {
        counter = 0;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string count = counter.ToString();
        System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
        dynDiv.ID = "dynDivCode" + count;
        dynDiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, "Gray");
        dynDiv.Style.Add(HtmlTextWriterStyle.Height, "20px");
        dynDiv.Style.Add(HtmlTextWriterStyle.Width, "300px");
        dynDiv.InnerHtml = "I was created using Code Behind";
        this.Controls.Add(dynDiv);
        counter++;
    }
}