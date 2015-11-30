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

/* public class graphStuff
{
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
    }

    //Put data from table into the object being sent to the piechart
    public void setGraphData(double[] fromTable)
    {
        if(fromTable.Length != 0)
        { 
       for (int x = 0; x<value.Length; x++)
       {
            value[x] = (int)fromTable[x];
       };
        }
    }
    
}*/

[ScriptService]
public class Service : WebService
{
    DataController d;
    DataClassesDataContext db;
 
    public int[] theGraphArray;

    public Service()
    {
        d = new DataController();
        //g = new graphStuff();
        db = new DataClassesDataContext();
        //get data from foodwastes table. Send this to the value field in graphdata
       
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public String[] returnGraphStuff()
    {
        double[] value = (from a in db.foodWastes select a.weight).ToArray();
        String[] graph = new String[value.Length];    
        for (int i = 0; i < value.Length; i++) { 
            PieDonutGraph g = new PieDonutGraph(value[i]);
            graph[i] = g.ToString();
        }
        return graph;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string returnTwoWay(List<string> sendme)
    {
        switch(sendme[0])
        {
            case ("2010"):
                return "yay";
            default:
                return "nope"; 
        }
    }


}