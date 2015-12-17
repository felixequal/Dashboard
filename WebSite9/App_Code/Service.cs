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
    /*public List<object> returnChart(string type, string project, string dataType, int count)
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
            /*DateTime beginDate = new DateTime(2015, 2, 1);
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
        
    }*/
    private string generateRandomColor(Random random, double opacity)
    {
        Color randomColor = Color.FromArgb(random.Next(0, 255), random.Next(0, 255), random.Next(0, 255));
        return "rgba(" + random.Next(0, 255) + "," + random.Next(0, 255) + "," + random.Next(0, 255) + "," + opacity + ")";
    }
    /*private object[] getDataByProject(string data, string type)
    {
        object[] returnData;

        if (data.Equals("Foodwaste - Weights") && (type.Equals("Pie Chart") || type.Equals("Donut Chart")))
        {
            /*
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
    */
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
    public List<object> returnData(string data)
    {
        List<object> result = new List<object>();
        
        //Group By Section Queries

        //Foodwaste
        if (data == "Foodwaste - By Vendor")
        {
            var vendGroups = (from vends in db.Composts group vends by vends.Vendor);
            foreach(var vend in vendGroups)
            {
                if (vend.Key != null)
                {
                    result.Add(vend.Key);
                } 
            }
        }
        

        return result;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<object> returnDataDates(string param1, string param2, string dateBeg, string dateEnd)
    {
        const string coffeeColor = "#72A435";
        const string dairyColor = "#878787";
        const string fruitColor = "#3186AD";
        const string grainColor = "#EAEFF9";
        const string vegColor = "#EE5921";
        const string paperColor = "#484848";

        const string coffeeColorT = "rbga(114, 164, 53,0.2)";
        const string dairyColorT = "rgba(135,135,135,0.2)";
        const string fruitColorT = "rgba(49,134,173,0.2)";
        const string grainColorT = "rgba(234,239,249,0.2)";
        const string vegColorT = "rgba(238,89,33,0.2)";
        const string paperColorT = "rgba(72,72,72,0.2)";

        List<object> result = new List<object>();

        //Group By Section Queries

        //Foodwaste
        if (param1 == "GetVendorDates")
        {
            var vendDates = ((from vends in db.Composts where vends.Vendor == param2 select vends.date.ToString()).ToList());
            foreach (var vend in vendDates)
            {
                result.Add(vend);
            }
        }

        if (param1 == "Foodwaste - By Vendor")
        {
            var vendReturn = (from vends in db.Composts where (vends.date.ToString() == dateBeg) && (vends.Vendor == param2) select vends).ToList();

            var firstVendor = vendReturn[0];
            // Add Coffee Grounds
            PieDonutGraph p = new PieDonutGraph();
            p.value = (double)firstVendor.percentCoffeeGrounds;
            p.color = coffeeColor;
            p.highlight = "#FFFF66";
            p.label = "Coffee Grounds";
            result.Add(p);
            //Add Dairy
            p = new PieDonutGraph();
            p.value = (double)firstVendor.percentDairy;
            p.color = dairyColor;
            p.highlight = "#FFFF66";
            p.label = "Dairy";
            result.Add(p);
            // Add Fruit 
            p = new PieDonutGraph();
            p.value = (double)firstVendor.percentFruit;
            p.color = fruitColor;
            p.highlight = "#FFFF66";
            p.label = "Fruit";
            result.Add(p);
            // Add Grains 
            p = new PieDonutGraph();
            p.value = (double)firstVendor.percentGrains;
            p.color = grainColor;
            p.highlight = "#FFFF66";
            p.label = "Grains";
            result.Add(p);
            // Add Veg 
            p = new PieDonutGraph();
            p.value = (double)firstVendor.percentVeg;
            p.color = vegColor;
            p.highlight = "#FFFF66";
            p.label = "Vegtables";
            result.Add(p);
            // Add Veg 
            p = new PieDonutGraph();
            p.value = (double)firstVendor.percentPaper;
            p.color = paperColor;
            p.highlight = "#FFFF66";
            p.label = "Paper";
            result.Add(p);
        }
        if (param1 == "Foodwaste - by Vendor Line/Bar")
        {
            var vendReturn = (from vends in db.Composts where (vends.date >= Convert.ToDateTime(dateBeg)) && (vends.date <= Convert.ToDateTime(dateEnd)) && (vends.Vendor == param2) select vends).ToList();
            string[] labelHold = new string[vendReturn.Count];
            int counter = 0;
            List<double> coffee = new List<double>();
            List<double> dairy = new List<double>();
            List<double> fruit = new List<double>();
            List<double> grains = new List<double>();
            List<double> paper = new List<double>();
            List<double> veg = new List<double>();

            foreach (var vend in vendReturn)
            {
                coffee.Add((double)vend.percentCoffeeGrounds);
                dairy.Add((double)vend.percentDairy);
                fruit.Add((double)vend.percentFruit);
                grains.Add((double)vend.percentGrains);
                paper.Add((double)vend.percentPaper);
                veg.Add((double)vend.percentVeg);
                labelHold[counter] = vend.date.ToShortDateString();
                counter++;
            }
            result.Add(labelHold);
            //Cofee Grounds
            LineChart dataIn = new LineChart();
            dataIn.label = "Percent Cofee Grounds";
            dataIn.fillColor = coffeeColorT;
            dataIn.strokeColor = coffeeColor;
            dataIn.pointColor = coffeeColor;
            dataIn.pointStrokeColor = "#fff";
            dataIn.pointHighlightFill = "#fff";
            dataIn.pointHighlightStroke = coffeeColor;
            dataIn.data = coffee.ToArray();
            result.Add(dataIn);
            //Dairy
            dataIn = new LineChart();
            dataIn.label = "Percent Dairy";
            dataIn.fillColor = dairyColorT;
            dataIn.strokeColor = dairyColor;
            dataIn.pointColor = dairyColor;
            dataIn.pointStrokeColor = "#fff";
            dataIn.pointHighlightFill = "#fff";
            dataIn.pointHighlightStroke = dairyColor;
            dataIn.data = dairy.ToArray();
            result.Add(dataIn);
            //Grains
            dataIn = new LineChart();
            dataIn.label = "Percent Grains";
            dataIn.fillColor = grainColorT;
            dataIn.strokeColor = grainColor;
            dataIn.pointColor = grainColor;
            dataIn.pointStrokeColor = "#fff";
            dataIn.pointHighlightFill = "#fff";
            dataIn.pointHighlightStroke = grainColor;
            dataIn.data = grains.ToArray();
            result.Add(dataIn);
            //Fruit
            dataIn = new LineChart();
            dataIn.label = "Percent Fruit";
            dataIn.fillColor = fruitColorT;
            dataIn.strokeColor = fruitColor;
            dataIn.pointColor = fruitColor;
            dataIn.pointStrokeColor = "#fff";
            dataIn.pointHighlightFill = "#fff";
            dataIn.pointHighlightStroke = fruitColor;
            dataIn.data = fruit.ToArray();
            result.Add(dataIn);
            //Veg
            dataIn = new LineChart();
            dataIn.label = "Percent Vegtables";
            dataIn.fillColor = vegColorT;
            dataIn.strokeColor = vegColor;
            dataIn.pointColor = vegColor;
            dataIn.pointStrokeColor = "#fff";
            dataIn.pointHighlightFill = "#fff";
            dataIn.pointHighlightStroke = vegColor;
            dataIn.data = veg.ToArray();
            result.Add(dataIn);
            //Paper
            dataIn = new LineChart();
            dataIn.label = "Percent Paper";
            dataIn.fillColor = paperColorT;
            dataIn.strokeColor = paperColor;
            dataIn.pointColor = paperColor;
            dataIn.pointStrokeColor = "#fff";
            dataIn.pointHighlightFill = "#fff";
            dataIn.pointHighlightStroke = paperColor;
            dataIn.data = paper.ToArray();
            result.Add(dataIn);


        }
    
        if (param1 == "Foodwaste - by Type of Waste Line/Bar" && param2 == "Coffee Grounds")
        {
            var vendGroups = (from vends in db.Composts group vends by vends.Vendor);
            List<string> dateLabelHold = new List<string>();

            for (DateTime date = Convert.ToDateTime(dateBeg); date.Date <= Convert.ToDateTime(dateEnd).Date; date = date.AddDays(1))
            {
                dateLabelHold.Add(date.ToShortDateString());
            }

            result.Add(dateLabelHold);

            foreach (var vend in vendGroups)
            {
                if (vend.Key != null)
                {
                    List<Compost> vendReturn = new List<Compost>();
                    LineChart dataIn = new LineChart();
                    dataIn.label = vend.Key;
                    dataIn.fillColor = coffeeColorT;
                    dataIn.strokeColor = coffeeColor;
                    dataIn.pointColor = coffeeColor;
                    dataIn.pointStrokeColor = "#fff";
                    dataIn.pointHighlightFill = "#fff";
                    dataIn.pointHighlightStroke = coffeeColor;
     
                    List<double> dateHold = new List<double>();
                    var counter = 0;
                    vendReturn = (from vends in db.Composts where (vends.date >= Convert.ToDateTime(dateBeg)) && (vends.date <= Convert.ToDateTime(dateEnd)) && (vends.Vendor == vend.Key) orderby vends.date select vends).ToList();
                    for (DateTime date = Convert.ToDateTime(dateBeg).Date; date.Date <= Convert.ToDateTime(dateEnd).Date; date = date.AddDays(1))
                    {
                        if (counter < vendReturn.Count)
                        {
                            System.Diagnostics.Debug.WriteLine(vendReturn[counter].date.Date);
                            System.Diagnostics.Debug.WriteLine(date.Date);
                            if (Equals(vendReturn[counter].date.Date, date.Date))
                            {
                                dateHold.Add((double)vendReturn[counter].percentCoffeeGrounds);
                                System.Diagnostics.Debug.WriteLine("Im here");
                                counter++;
                            }
                            else
                            {
                                dateHold.Add(0);
                            }
                        }
                        else
                        {
                            dateHold.Add(0);
                        }
                    }
                    dataIn.data = dateHold.ToArray();
                    result.Add(dataIn);
                }
            }
        }
        foreach (var p in result)
        {
            System.Diagnostics.Debug.WriteLine(p.ToString());
        }

        return result;
    }
}