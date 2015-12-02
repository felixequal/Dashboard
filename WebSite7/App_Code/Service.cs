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
    public List<object> returnPieDonutChart(string type, string project)
    {
        Random rand = new Random();
        List<object> result = new List<object>();

        if (type.Equals("Donut Graph")|| type.Equals("Pie Graph")) {
            if (project.Equals("Vermiculture"))
            {
                double[] value = (from data in db.foodWastes select data.weight).ToArray();
                for (int i = 0; i < value.Length; i++)
                {
                    PieDonutGraph p = new PieDonutGraph();
                    p.value = value[i];
                    p.color = generateRandomColor(rand, 1);
                    p.highlight = "#ffff00";
                    p.label = value[i].ToString();
                    result.Add(p);
                }
            }
        }
        if (type.Equals("Bar Graph") || type.Equals("Line Graph"))
        {
            DateTime beginDate = new DateTime(2015, 2, 1);
            DateTime[] dates = (from data in db.foodWastes where data.date <= beginDate select data.date).ToArray();
            double[] dataInFruit = (from data in db.foodWastes where data.date <= beginDate select data.percentFruit).ToArray();
            double[] dataInVeg = (from data in db.foodWastes where data.date <= beginDate select data.percentVeg).ToArray();
            List<string> labels = new List<string>();
            List<double> dataSet1 = new List<double>();
            List<double> dataSet2 = new List<double>();
            for (int i = 0; i < dataInFruit.Length; i++)
            {
                labels.Add(dates[i].ToShortDateString());
                dataSet1.Add(dataInFruit[i]);
                dataSet2.Add(dataInVeg[i]);
            }
            result.Add(labels);
            result.Add(dataSet1);
            result.Add(dataSet2);
        }

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
    private string generateRandomColor(Random random, double opacity)
    {
        Color randomColor = Color.FromArgb(random.Next(0, 255), random.Next(0, 255), random.Next(0, 255));
        return "rgba("+ random.Next(0, 255) + ","+ random.Next(0, 255) + ","+ random.Next(0, 255) + ","+opacity+")";
    }

}