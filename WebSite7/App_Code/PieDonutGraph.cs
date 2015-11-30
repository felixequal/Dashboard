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
using System.Drawing;

public class PieDonutGraph
    {

        private double value;
        private string color;
        private string highlight;
        private string label;

        public PieDonutGraph(double val)
        {
            value = val;
            color = generateRandomColor();
            highlight = "#ffff00";
            label = value.ToString();
        }
        private String generateRandomColor()
        {
            Random random = new Random();
            Color randomColor = Color.FromArgb(random.Next(0, 255), random.Next(0, 255), random.Next(0, 255));
            System.Diagnostics.Debug.WriteLine("Color String is #" + randomColor.R.ToString("X2") + randomColor.G.ToString("X2") + randomColor.B.ToString("X2"));
            return "#" + randomColor.R.ToString("X2") + randomColor.G.ToString("X2") + randomColor.B.ToString("X2");
        }
        
    }

