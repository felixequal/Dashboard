using System.Linq;
using System.Web.Script.Services;
using System.Web.Services;
using System.Data;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System;
using System.Drawing;

[WebService(Namespace = "http://microsoft.com/webservices/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

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
    public string returnPieDonutChart(string type, string project )
    {
        Random rand = new Random();
        string result = "";

        if (type.Equals("Donut Graph")){
            if (project.Equals("Vermiculture"))
            {
                double[] value = (from data in db.foodWastes select data.weight).ToArray();
                List<PieDonutGraph> graph = new List<PieDonutGraph>();
                for (int i = 0; i < value.Length; i++)
                {
                    graph.Add(new PieDonutGraph() { value = value[i], color = generateRandomColor(rand), highlight = "#ffff00", label = value[i].ToString() });
                }
                result = new JavaScriptSerializer().Serialize(graph.ToArray());
            }
        }

        if (type.Equals("Pie Graph")){
            if (project.Equals("Vermiculture"))
            {
                double[] value = (from data in db.foodWastes select data.weight).ToArray();
                List<PieDonutGraph> graph = new List<PieDonutGraph>();
                for (int i = 0; i < value.Length; i++)
                {
                    graph.Add(new PieDonutGraph() { value = value[i], color = generateRandomColor(rand), highlight = "#ffff00", label = value[i].ToString() });
                }
                result = new JavaScriptSerializer().Serialize(graph.ToArray());
            }
        }
        System.Diagnostics.Debug.WriteLine(project);
        return result;
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
    private string generateRandomColor(Random random)
    {
        Color randomColor = Color.FromArgb(random.Next(0, 255), random.Next(0, 255), random.Next(0, 255));
        return "#" + randomColor.R.ToString("X2") + randomColor.G.ToString("X2") + randomColor.B.ToString("X2");
    }

}