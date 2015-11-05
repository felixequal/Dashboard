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
    public int[] graphData;
    public string testdata;
    protected internal graphStuff()
    {
       graphData  = new int[] {2, 3, 5, 25, 13, 15 };
       testdata = "blah";
    }

    public int[] getGraphData()
    {
        return graphData;
    }
}

[ScriptService]
public class Service : WebService
{

    graphStuff g;
    public int[] theGraphArray;
    public Service()
    {
        g = new graphStuff();
        theGraphArray = g.getGraphData();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public graphStuff returnGraphStuff() { return g; }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public int[] HelloWorld() { return theGraphArray; }
    
}