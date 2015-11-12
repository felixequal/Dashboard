using System.IO;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;

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
    //public string testdata;
    protected internal graphStuff()
    {
        value = new int[] { 5, 6, 7, 8, 9, 20, 50 };
        color = new string[] { "#4D5360", "#46BFBD", "#FDB45C", "#FFFF00", "#949FC1", "#4D5360", "#FFFF00" };
        highlight = new string[] { "#616774", "#A8B3C5", "#A8B3C5", "#FFFFAE", "#5AD3D1", "#FF5A5E", "#FFFF01" };
        label = new string[] {"red", "green", "blue", "grey", "yellow", "Dark Grey", "yellow" };
       // graphData  = new int[] {2, 3, 2, 10, 13, 15 };
        //testdata = "blah";
    }

   /* public int[] getGraphData()
    {
       // return graphData;
    }
    */
}

[ScriptService]
public class Service : WebService
{

    graphStuff g;
    public int[] theGraphArray;
    public Service()
    {
        g = new graphStuff();
       // theGraphArray = g.getGraphData();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public graphStuff returnGraphStuff() { return g; }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public int[] HelloWorld() { return theGraphArray; }
    
}