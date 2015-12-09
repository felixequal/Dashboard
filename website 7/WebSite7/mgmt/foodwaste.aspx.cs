
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
    //This list is the key to the whole form.  When a user hits the submit button it puts all the data from the textboxes into an object of type foodwaste. this object is put
    //into a LIST of foodwaste objects ("theList") and then bound to a gridview.  When they hit commit it takes that list of objects and puts it into the actual database.
    List<foodWaste> theList
    {
        get { return (List<foodWaste>)Session["theList"]; }
        set { Session["theList"] = value; }
    }
    //Thes things run when the page loads or does a postback event (i.e. on any asp button click).
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

    //This is the SUBMIT BUTTON code.  Please swap out the horrible try catch mess for the validation() function. It seems to work but needs some tweaking.
    protected void submitfw_Click(object sender, EventArgs e)
    {
        bool inputErrorFlag = false;
        food.date = (DateTime)validate(food.date, ref dateInputBox);
        Debug.WriteLine("dateInputBox.Text;" + dateInputBox.Text);

        Debug.WriteLine("food.date after validation: " + food.date);
        /*
        try {
            food.date = DateTime.Parse(dateInputBox.Text);
        } catch (Exception inputError)
        {
            Debug.WriteLine("input Error:" + inputError.Message);
            dateInputBox.Text = "Input Error!";
            inputErrorFlag = true;
        }
        */
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
        /*
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
       */
        food.percentDairy = (double)validate(food.percentDairy, ref percentDairyInputBox);
        
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

    //This function is called when you hit "edit" on the post-submit gridview. It just rebinds the current data.
    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView2.EditIndex = e.NewEditIndex;
        foodWaste ds = theList[e.NewEditIndex];
        GridView2.DataSource = theList;
        GridView2.DataBind();
    }

    //cancels editing.
    protected void gvCustomers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView2.EditIndex = -1;
        GridView2.DataBind();
    }

    //This is the function that's called when you hit "Update" after hitting "edit" on the submit gridview.  This needs to be integrated with the new validate() function.
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
    //This occurs when you hit the ROW DELETE BUTTON AFTER EDITING.
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (theList != null) theList.RemoveAt(e.RowIndex);
        GridView2.DataBind();
    }

    //The COMMIT button code.
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

    //!IMPORTANT - this function needs to be used everywhere so the code doesn't look like garbage and we have reliable validation. And we can re use this in every page.
    //A nicer function to validate all textbox to foodwaste property assignments. This can replace all try-catches in all places once it's complete.
    protected object validate(object a, ref TextBox b)  //textbox is passed by reference. It is not allowed to pass food.<whatevers>. I tried.
    {
        Object x = null;  //a holder object
        Type passedObjectType = a.GetType();  //what kind of object was passed in (double, dateTime, etc)?
        string theTypeString = passedObjectType.ToString();  //ok then we switch on that kind of object.
        Debug.WriteLine("D: " + theTypeString);  //debug
        Debug.WriteLine("B:" + b.Text);  //debug
        switch (theTypeString) //ADD MORE CASES PLEASE
        {
            case "System.Double":  //this string has to match exactly the kind of object type (case sensitive).
                try { x = Convert.ToDouble(b.Text); }
                catch (Exception e) { b.Text = "INPUT ERROR!"; Debug.WriteLine("error x:" + x.ToString()); }
                Debug.WriteLine("good x:" + x.ToString());
                return (double)x;  //returns the specific type so the calling function doesn't have to cast anything. This DOES work.

            case "System.DateTime":
                try { x = Convert.ToDateTime(b.Text); }
                catch (Exception e) { b.Text = "INPUT ERROR!"; }
                return (DateTime)x;

            default:
                break;
        }
        return a;
    }
}