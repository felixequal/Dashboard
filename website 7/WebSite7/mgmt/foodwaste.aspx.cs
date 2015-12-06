
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
    List<foodWaste> theList
    {
        get { return (List<foodWaste>)Session["theList"]; }
        set { Session["theList"] = value; }
    }

    globalFood f;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (theList == null) theList = new List<foodWaste>();
        //f = new globalFood();
        using (cdjamEntities2 myEntities = new cdjamEntities2())
            {
            var allwaste = from foodWaste in myEntities.foodWastes
                           orderby foodWaste.date
                           select foodWaste;
            GridView1.DataSource = allwaste;
            GridView1.DataBind();
            }          
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

    protected void ASPxGridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        DataSet ds = (DataSet)Session["theList"];
        //ds = (DataSet)Session["TheList"];
        GridView GridView = (GridView)sender;
        DataTable dataTable = GridView.GetMasterRowKeyValue() != null ? ds.Tables[1] : ds.Tables[0];
        DataRow row = dataTable.Rows.Find(e.Keys[0]);
        IDictionaryEnumerator enumerator = e.NewValues.GetEnumerator();
        enumerator.Reset();
        while (enumerator.MoveNext())
            row[enumerator.Key.ToString()] = enumerator.Value;
        GridView.CancelEdit();
        e.Cancel = true;
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
     
    }
}