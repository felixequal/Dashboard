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
    public List<object> returnChart(string type, string project, string dataType, int count)
    {
        Random rand = new Random();
        List<object> result = new List<object>();
        result.Add(count);
        if (type.Equals("Donut Chart") || type.Equals("Pie Chart"))
        {
            object[] valueHold;

            valueHold = getDataByProject(dataType, type);

            for (int i = 0; i < valueHold.Length / 2; i++)
            {
                PieDonutGraph p = new PieDonutGraph();
                p.value = (double)valueHold[i];
                p.color = generateRandomColor(rand, 1);
                p.highlight = "#ffff00";
                p.label = (string)valueHold[i + (valueHold.Length / 2)];
                result.Add(p);
            }
        }
        if (type.Equals("Bar Chart") || type.Equals("Line Chart"))
        {
            DateTime beginDate = new DateTime(2015, 2, 1);
            DateTime[] dates = (from values in db.foodWastes where values.date <= beginDate select values.date).ToArray();
            double[] dataInFruit = (from values in db.foodWastes where values.date <= beginDate select values.percentFruit).ToArray();
            double[] dataInVeg = (from values in db.foodWastes where values.date <= beginDate select values.percentVeg).ToArray();
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
    private string generateRandomColor(Random random, double opacity)
    {
        Color randomColor = Color.FromArgb(random.Next(0, 255), random.Next(0, 255), random.Next(0, 255));
        return "rgba(" + random.Next(0, 255) + "," + random.Next(0, 255) + "," + random.Next(0, 255) + "," + opacity + ")";
    }
    private object[] getDataByProject(string data, string type)
    {
        object[] returnData;

        if (data.Equals("Foodwaste - Weights") && (type.Equals("Pie Chart") || type.Equals("Donut Chart")))
        {
            double[] getWeights = (from values in db.foodWastes select values.weight).ToArray();
            DateTime[] getDates = (from values in db.foodWastes select values.date).ToArray();
            returnData = new object[getWeights.Length * 2];
            for (int i = 0; i < getWeights.Length; i++)
            {
                returnData[i] = getWeights[i];
                returnData[i + getWeights.Length] = getDates[i].ToShortDateString();
            }
            return returnData;
        }
        else if (data.Equals("Foodwaste - Percentages") && (type.Equals("Pie Chart") || type.Equals("Donut Chart")))
        {
            DateTime dateDelim = new DateTime(2015, 04, 16);
            returnData = new object[8];
            double hold;

            hold = adder((from values in db.foodWastes where values.date == dateDelim select values.percentDairy).ToArray());
            returnData[0] = hold;
            returnData[4] = "Dairy";
            hold = adder((from values in db.foodWastes where values.date == dateDelim select values.percentFruit).ToArray());
            returnData[1] = hold;
            returnData[5] = "Fruit";
            hold = adder((from values in db.foodWastes where values.date == dateDelim select values.percentVeg).ToArray());
            returnData[2] = hold;
            returnData[6] = "Vegtables";
            hold = adder((from values in db.foodWastes where values.date == dateDelim select values.percentGrains).ToArray());
            returnData[3] = hold;
            returnData[7] = "Grains";
            return returnData;
        }
        else
        {
            return null;
        }
    }
    private double adder(double[] addingArray)
    {
        double addedNumber = 0;
        for (int i = 0; i < addingArray.Length; i++)
        {
            addedNumber = addedNumber + (addingArray[i] * 100);
        }
        addedNumber = addedNumber / addingArray.Length;
        return addedNumber;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<object> returnProjects(int count)
    {
        List<object> result = new List<object>();

        System.Diagnostics.Debug.WriteLine(count);
        result.Add(count);
        result.AddRange(from values in db.Projects select values.Project_Name);

        return result;
    }
}