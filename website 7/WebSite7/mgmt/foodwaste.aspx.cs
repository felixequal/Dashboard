
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
    foodWaste food;
    List<System.Reflection.PropertyInfo> foodmembers;
    List<double> inputBoxes;
    List<foodWaste> theList
    {
        get { return (List<foodWaste>)Session["theList"]; }
        set { Session["theList"] = value; }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        food = new foodWaste();
        
        
        if (!Page.IsPostBack)
        {
        if (theList == null)
        {
            Debug.WriteLine("NULL LIST. CREATING NEW"); theList = new List<foodWaste>();
        }
            GridView2.DataSource = theList;
            GridView2.DataBind();
        }
    }

    protected void submitfw_Click(object sender, EventArgs e)
    {
        bool inputErrorFlag = false;
        try {
            food.date = DateTime.Parse(dateInputBox.Text);
        } catch (Exception inputError)
        {
            Debug.WriteLine("input Error:" + inputError.Message);
            dateInputBox.Text = "Input Error!";
            inputErrorFlag = true;
        }

        try
        {
            food.percentGrains = double.Parse(percentGrainsInputBox.Text);
        }
        catch (Exception inputError)
        {
            Debug.WriteLine("input Error:" + inputError.Message);
            percentGrainsInputBox.Text = "Input Error!";
            inputErrorFlag = true;
        }

        try
        {
            food.percentFruit = double.Parse(percentFruitInputBox.Text);
        }
        catch (Exception inputError)
        {
            Debug.WriteLine("input Error:" + inputError.Message);
            percentFruitInputBox.Text = "Input Error!";
            inputErrorFlag = true;

        }

        try
        {
            food.percentVeg = double.Parse(percentVegInputBox.Text);
        }
        catch (Exception inputError)
        {
            Debug.WriteLine("input Error:" + inputError.Message);
            percentVegInputBox.Text = "Input Error!";
            inputErrorFlag = true;
        }

        try
        {
            food.percentDairy = double.Parse(percentDairyInputBox.Text);
        }
        catch (Exception inputError)
        {
            Debug.WriteLine("input Error:" + inputError.Message);
            percentDairyInputBox.Text = "Input Error!";
            inputErrorFlag = true;
        }

        
        try
        {

            food.weight = double.Parse(weightInputBox.Text);
        }
        catch (Exception inputError)
        {
            Debug.WriteLine("input Error:" + inputError.Message);
            weightInputBox.Text = "Input Error!";
            inputErrorFlag = true;
        }

        if (!inputErrorFlag)
        {
            theList.Add(food);
            GridView2.DataSource = theList;
            GridView2.DataBind();
        }      
    }

    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView2.EditIndex = e.NewEditIndex;
        foodWaste ds = theList[e.NewEditIndex];
        GridView2.DataSource = theList;
        GridView2.DataBind();
    }

    protected void gvCustomers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView2.EditIndex = -1;
        GridView2.DataBind();
    }

    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow Grow = GridView2.Rows[e.RowIndex];
        int row = e.RowIndex;

        TextBox tDate = Grow.Cells[2].Controls[0] as TextBox;
        if (tDate == null) { Debug.WriteLine("tDate is null"); }
        TextBox tWeight = Grow.Cells[3].Controls[0] as TextBox;
        TextBox tpGrains = Grow.Cells[4].Controls[0] as TextBox;
        TextBox tpFruit = Grow.Cells[5].Controls[0] as TextBox;
        TextBox tpVeg = Grow.Cells[6].Controls[0] as TextBox;
        TextBox tpDairy = Grow.Cells[7].Controls[0] as TextBox;
        GridView2.EditIndex = -1;

        theList[row].date = Convert.ToDateTime(tDate.Text);
        theList[row].weight = Convert.ToInt32(tWeight.Text);
        theList[row].percentGrains = Convert.ToInt32(tpGrains.Text);
        theList[row].percentFruit = Convert.ToInt32(tpFruit.Text);
        theList[row].percentVeg = Convert.ToInt32(tpVeg.Text);
        theList[row].percentDairy = Convert.ToInt32(tpDairy.Text);

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