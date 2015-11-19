using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

/// <summary>
/// Summary description for Class1
/// </summary>
public class DataController
{
    foodWaste f;
    DataClassesDataContext db;
    public DataController()
    {
       db = new DataClassesDataContext();
    }

    public IQueryable<foodWaste> returnData()
    {
    IQueryable<foodWaste> wste = from d in db.foodWastes
               select d;
    return wste;
    }

}