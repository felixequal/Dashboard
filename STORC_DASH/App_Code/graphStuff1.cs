public class graphStuff
{
  
    public int[] value;
    public string[] color;
    public string[] highlight;
    public string[] label;

    public graphStuff()
    {
        value = new int[] { 5, 6, 7, 8, 9, 20, 50 };
        color = new string[] { "#4D5360", "#46BFBD", "#FDB45C", "#FFFF00", "#949FC1", "#4D5360", "#FFFF00" };
        highlight = new string[] { "#616774", "#A8B3C5", "#A8B3C5", "#FFFFAE", "#5AD3D1", "#FF5A5E", "#FFFF01" };
        label = new string[] { "red", "green", "blue", "grey", "yellow", "Dark Grey", "yellow" };
    }

    //Put data from table into the object being sent to the piechart
    public void setGraphData(double[] fromTable)
    {
        if (fromTable.Length != 0)
        {
            for (int x = 0; x < value.Length; x++)
            {
                value[x] = (int)fromTable[x];
            };
        }
    }
}
    
