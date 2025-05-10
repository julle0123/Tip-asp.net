using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class DbMan
{
    //static string dataSource = "Data Source=(local); User Id = Up; Password = pass; Intial Catalog = Tip";
    static string dataSource = @"Server=(local)\SQLEXPRESS3; uid=sa; Password=pass; Initial Catalog=Tip";

    static SqlConnection myConnection;

    public static SqlConnection Open()
    {
        myConnection = new SqlConnection(dataSource);
        myConnection.Open();
        return myConnection;
    }

    public static void Close()
    {
        myConnection.Close();
    }

    public static void ExecuteNonQuery(string strSQL)
    {
        SqlCommand myCommand = new SqlCommand(strSQL, Open());
        myCommand.ExecuteNonQuery();
    }

    public static void ExecuteNonQuery(SqlCommand myCommand)
    {
        myCommand.ExecuteNonQuery();
    }

    public static int ExecuteStoredProcedure(SqlCommand myCommand, SqlParameter ParamOut)
    {
        myCommand.ExecuteNonQuery();

        int returnValue = (int)ParamOut.Value;

        Close();

        return returnValue;
    }

    public static SqlDataReader ExecuteReader(string strSql)
    {
        SqlCommand myCommand = new SqlCommand(strSql, Open());

        return myCommand.ExecuteReader();
    }

    public static DataSet DataAdapterFill(string strSql, string mytable)
    {
        DataSet myDs = new DataSet(mytable);

        SqlDataAdapter myAdapter = new SqlDataAdapter(strSql, Open());
        myAdapter.Fill(myDs, mytable);

        myAdapter.Dispose();
        Close();

        return myDs;
    }

    public DbMan()
    {
        
    }
}