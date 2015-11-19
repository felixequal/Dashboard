using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Data;
using System;
using System.Collections.Generic;


using System.Text;

[WebService(Namespace = "http://microsoft.com/webservices/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
//[System.Web.Script.Services.ScriptService]

public class graphStuff
{
  //  public int[] graphData;
    public int[] value;
    public string[] color;
    public string[] highlight;
    public string[] label;
    protected internal graphStuff()
    {
        value = new int[] { 5, 6, 7, 8, 9, 20, 50 };
        color = new string[] { "#4D5360", "#46BFBD", "#FDB45C", "#FFFF00", "#949FC1", "#4D5360", "#FFFF00" };
        highlight = new string[] { "#616774", "#A8B3C5", "#A8B3C5", "#FFFFAE", "#5AD3D1", "#FF5A5E", "#FFFF01" };
        label = new string[] {"red", "green", "blue", "grey", "yellow", "Dark Grey", "yellow" };
       // graphData  = new int[] {2, 3, 2, 10, 13, 15 };
        //testdata = "blah";
    }

    //Put data from table into the object being sent to the piechart
    public void setGraphData(double[] fromTable)
    {
       for (int x = 0; x< value.Length;x++)
            {
            value[x] = (int)fromTable[x];
           // Console.WriteLine(value[x]);
        };
    }
    
}

[ScriptService]
public class Service : WebService
{
    DataController d;
    DataClassesDataContext db;
    //foodWaste I;
    foodWaste f;
    foodWaste[] fa;
   // IQueryable<foodWaste> I;
    graphStuff g;
    public int[] theGraphArray;
    public double[] value;
    public Service()
    {
        d = new DataController();
        g = new graphStuff();
        f = new foodWaste();
        f.datapointID = 6;
        f.date = System.DateTime.Now;
        f.weight = 4;
        f.percentDairy = 10;
        f.percentFruit = 12;
        f.percentGrains = 13;
        f.percentVeg = 15;
        db = new DataClassesDataContext();
        //get data from foodwastes table. Send this to the value field in graphdata
        value = (from a in db.foodWastes
                   select a.weight).ToArray();
        fa = (from x in db.foodWastes
             select x).ToArray();
       g.setGraphData(value);
     //  I = d.returnData();
        // theGraphArray = g.getGraphData();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public graphStuff returnGraphStuff()
    {
        //g.setGraphData(value);
        return g;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public foodWaste[] returnWaste() { return fa; }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public foodWaste returnWasteObject() { return f; }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public double[] returnWeights() { return value; }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public int[] HelloWorld() { return theGraphArray; }
    
}