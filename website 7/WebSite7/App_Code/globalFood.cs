using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Class2
/// </summary>
public class globalFood
{
    private List<foodWaste> foods = new List<foodWaste>();
    public globalFood()
    {
        
    }

    public void addToFoods(foodWaste food)
    {
        foods.Add(food);
    }

    public List<foodWaste> getFoods()
    {
        return foods;
    }

}