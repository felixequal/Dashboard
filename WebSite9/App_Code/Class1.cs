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
    Compost c;
    DataClassesDataContext db;
    public DataController()
    {
       db = new DataClassesDataContext();
    }

    public IQueryable<Compost> returnData()
    {
    IQueryable<Compost> wste = from d in db.Composts
               select d;
    return wste;
    }

}