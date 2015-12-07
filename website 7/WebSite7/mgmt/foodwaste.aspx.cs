
using cdjamModel;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mgmt_foodwaste : System.Web.UI.Page
{
    //GridView GridView2;
    List<foodWaste> theList
    {
        get { return (List<foodWaste>)Session["theList"]; }
        set { Session["theList"] = value; }
    }

    globalFood f;
    

    protected void Page_Load(object sender, EventArgs e)
    {


        System.Web.UI.HtmlControls.HtmlGenericControl myDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
        myDiv.ID = "myDiv";
        myDiv.InnerText = "No Data to Submit";
        Panel1.Controls.Add(myDiv);
        if (theList == null)
        {
            
            Panel1.Visible = true;
        }


        if (theList == null)
        {
            Debug.WriteLine("NULL LIST. CREATING NEW"); theList = new List<foodWaste>();
        }
        if (!Page.IsPostBack)
        {
            GridView2.DataSource = theList;
            GridView2.DataBind();
        }
       
        //f = new globalFood();

    }

    protected void submitfw_Click(object sender, EventArgs e)
    {
        // GridView GridView2 = new GridView();
        DateTime dateInput = new DateTime();
        var weightinput = new double();
        var grainsInput = new double();
        var fruitInput = new double();
        var vegInput = new double();
        var dairyInput = new double();

        foodWaste food = new foodWaste();
        DateTime.TryParse(DateInputBox.Text, out dateInput);
        double.TryParse(WeightInputBox.Text, out weightinput);
        double.TryParse(GrainsInputBox.Text, out grainsInput);
        double.TryParse(FruitInputBox.Text, out fruitInput);
        double.TryParse(VegInputBox.Text, out vegInput);
        double.TryParse(DairyInputBox.Text, out dairyInput);

        food.date = dateInput;
        food.weight = weightinput;
        food.percentGrains = grainsInput;
        food.percentFruit = fruitInput;
        food.percentVeg = vegInput;
        food.percentDairy = dairyInput;

        theList.Add(food);
        //f.addToFoods(food);
        for (int y = 0;y<theList.Count; y++)
        {
            Debug.WriteLine("count: " + theList.Count + " " + theList.ElementAt(y).date);
        }
        GridView2.DataSource = theList;
        GridView2.DataBind();      
    }

    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)

    {

        GridView2.EditIndex = e.NewEditIndex;
        Debug.WriteLine("e.NewEditIndex: " + e.NewEditIndex);
        //List<foodWaste> ds = theList;
        //GridView2.DataSource = ds;
        foodWaste ds = theList[e.NewEditIndex];
        GridView2.DataSource = theList;
        GridView2.DataBind();
        Debug.WriteLine("e.RowIndex: " + e.NewEditIndex + "ID: " + ds.datapointID + " date: " + ds.date + " weight: " + ds.weight);

    }

    protected void gvCustomers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView2.EditIndex = -1;
        GridView2.DataBind();
       // this.BindGridView();
    }

    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //foodWaste ds = theList[e.RowIndex];
        //Debug.WriteLine("e.RowIndex: " + e.RowIndex + "ID: " + ds.datapointID + " date: " + ds.date + " weight: " + ds.weight);

        //int dataPointID = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow Grow = GridView2.Rows[e.RowIndex];
        //ds = (DataSet)Session["TheList"];
        //GridViewRow Grow = (GridViewRow)sender;
        int row = e.RowIndex;

        TextBox tDate = Grow.Cells[2].Controls[0] as TextBox;
        if (tDate == null) { Debug.WriteLine("tDate is null"); }
        TextBox tWeight = Grow.Cells[3].Controls[0] as TextBox;
        TextBox tpGrains = Grow.Cells[4].Controls[0] as TextBox;
        TextBox tpFruit = Grow.Cells[5].Controls[0] as TextBox;
        TextBox tpVeg = Grow.Cells[6].Controls[0] as TextBox;
        TextBox tpDairy = Grow.Cells[7].Controls[0] as TextBox;
        GridView2.EditIndex = -1;

        Debug.WriteLine("tdate text: " + tDate.Text);
        Debug.WriteLine("theList[" + row + "].date" + theList[row].date);
        
        theList[row].date = Convert.ToDateTime(tDate.Text);
        theList[row].weight = Convert.ToInt32(tWeight.Text);
        theList[row].percentGrains = Convert.ToInt32(tpGrains.Text);
        theList[row].percentFruit = Convert.ToInt32(tpFruit.Text);
        theList[row].percentVeg = Convert.ToInt32(tpVeg.Text);
        double pd;
        string tpd = tpDairy.Text;
        double.TryParse(tpd, out pd);
        theList[row].percentDairy = pd;
        //theList[row].datapointID = dataPointID;
        GridView2.DataSource = theList;
        GridView2.DataBind();
    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (theList != null) theList.RemoveAt(e.RowIndex);
        GridView2.DataBind();
    }

    protected void submitToDB_Click(object sender, EventArgs e)
    {
         DataClassesDataContext db = new DataClassesDataContext();

        foreach (foodWaste x in theList)
        {
            db.foodWastes.InsertOnSubmit(x);
        }
        // Add the new object to the Orders collection.
        // Submit the change to the database.
        try
        {
            db.SubmitChanges();
        }
        catch (Exception exception)
        {
            Console.WriteLine(exception);
            // Make some adjustments.
            // ...
            // Try again.
            db.SubmitChanges();
        }

        theList = null;
        GridView2.DataSource = theList;
        GridView2.DataBind();
        GridView3.DataBind();
    }

}