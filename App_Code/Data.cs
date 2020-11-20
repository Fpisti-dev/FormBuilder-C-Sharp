using System;
using System.Data;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Collections.Generic;

/// <summary>
/// Summary description for Data
/// </summary>
public class Data
{

    //Live Server
    public static string LiveServerConn = ConfigurationManager.ConnectionStrings["FormB"].ConnectionString;

    //Test Server
    public static string TestServerConn = ConfigurationManager.ConnectionStrings["FormB"].ConnectionString;

    
    public string LiveServer = "W5VWEBLIVE";
    //public string LiveServer = "W5VWEBDEV";
    // public string LiveServer = "X000920";

    string sConnection = "";

    public Data()
    {
        if (System.Environment.MachineName == LiveServer)
        {
            sConnection = LiveServerConn;
        }
        else
        {
            sConnection = TestServerConn;
        }
    }

    public void databaseInteraction()
    {

    }

    public static SqlDataReader ExecuteReader(string sConnectionString, string sStoredProc, List<string> sParams)
    {
        SqlConnection objConn = new SqlConnection(sConnectionString);

        using (SqlCommand objCommand = new SqlCommand(sStoredProc, objConn))
        {
            objConn.Open();
            objCommand.CommandType = CommandType.StoredProcedure;

            foreach (string myparam in sParams)
            {
                string sName = "";
                string sValue = "";
                sName = myparam.Substring(0, myparam.IndexOf(":"));
                sValue = myparam.Substring(myparam.IndexOf(":") + 1);

                objCommand.Parameters.Add(sName, SqlDbType.VarChar).Value = sValue;
            }

            SqlDataReader reader = objCommand.ExecuteReader(CommandBehavior.CloseConnection);

            return reader;
        }
    }

    /*********************************************
    * 
    * Call SP to populate List passed in to method
    * 
    * *********************************************/

    public List<string> SP_populateStringList(string sStoredProc, string sFieldToAddtoList, List<string> sParams)
    {
        List<string> createList = new List<string>();
        createList.Clear();

        SqlDataReader objDataReader = ExecuteReader(sConnection, sStoredProc, sParams);      

        if (objDataReader.HasRows)
        {

            while (objDataReader.Read())
            {

                createList.Add(objDataReader[sFieldToAddtoList].ToString());

            }
        }

        return createList;
    }

    /*********************************************
     * 
     * Call SP to populate DDL passed in to method
     * 
     * *********************************************/

    public void SP_populateDDL(DropDownList ddlToPopulate, string sStoredProc, string sDVF, string sDTF, string sDefault, List<string> sParams)
    {
        SqlDataReader objDataReader = ExecuteReader(sConnection, sStoredProc, sParams);        

        ddlToPopulate.DataSource = objDataReader;
        ddlToPopulate.DataValueField = sDVF;
        ddlToPopulate.DataTextField = sDTF;
        ddlToPopulate.DataBind();

        if (sDefault == "N")
        {
        }
        else if (sDefault == "Y")
        {
            ddlToPopulate.Items.Insert(0, new ListItem("All", "0"));
        }
        else if (sDefault == "T")
        {
            ddlToPopulate.Items.Insert(0, new ListItem("Default, All", "0"));
        }        
        else
        {
            ddlToPopulate.Items.Insert(0, new ListItem("-Please Select-", "0"));
        }        
    }

    /*********************************************
     * 
     * Call SP to populate DDL passed in to method IF
     * 
     * *********************************************/

    public void SP_populateDDL_IF(DropDownList ddlToPopulate, string sStoredProc, string sDVF, string sDTF, string sDefault, List<string> sParams)
    {
        SqlDataReader objDataReader = ExecuteReader(sConnection, sStoredProc, sParams);      

        ddlToPopulate.DataSource = objDataReader;
        ddlToPopulate.DataValueField = sDVF;
        ddlToPopulate.DataTextField = sDTF;
        ddlToPopulate.DataBind();

        if (sDefault == "N")
        {
        }
        else if (sDefault == "Y")
        {
            ddlToPopulate.Items.Insert(0, new ListItem("All", "0"));
        }
        else if (sDefault == "T")
        {
            ddlToPopulate.Items.Insert(0, new ListItem("Default, All", "0"));
        }
        else if (sDefault == "U")
        {
            ddlToPopulate.Items.Insert(0, new ListItem("Default, All", "0"));
        }
        else
        {
            ddlToPopulate.Items.Insert(0, new ListItem("-Please Select-", "0"));
        }
    }

    public void SP_populateHTMLSelect(HtmlSelect GroupSelect, string sStoredProc, string sDVF, string sDTF, string sDefault, List<string> sParams)
    {
        SqlDataReader objDataReader = ExecuteReader(sConnection, sStoredProc, sParams);      

        GroupSelect.DataSource = objDataReader;
        GroupSelect.DataValueField = sDVF;
        GroupSelect.DataTextField = sDTF;
        GroupSelect.DataBind();

        if (sDefault == "N")
        {
        }
        else if (sDefault == "Y")
        {
            GroupSelect.Items.Insert(0, new ListItem("All", "0"));
        }
        else if (sDefault == "T")
        {
            GroupSelect.Items.Insert(0, new ListItem("Default, All", "0"));
        }
        else if (sDefault == "U")
        {
            GroupSelect.Items.Insert(0, new ListItem("Default, All", "0"));
        }
        else
        {
            GroupSelect.Items.Insert(0, new ListItem("-Please Select-", "0"));
        }
    }

    /*********************************************
    * 
    * Call SP to populate Radio button list passed in to method
    * 
    * *********************************************/

    public void SP_populateRBL(RadioButtonList rblToPopulate, string sStoredProc, string sDVF, string sDTF, List<string> sParams)
    {
        SqlDataReader objDataReader = ExecuteReader(sConnection, sStoredProc, sParams);      

        rblToPopulate.DataSource = objDataReader;
        rblToPopulate.DataValueField = sDVF;
        rblToPopulate.DataTextField = sDTF;
        rblToPopulate.DataBind();
    }

    /*********************************************
    * 
    * Call SP to populate Check Box list passed in to method
    * 
    * *********************************************/

    public void SP_populateCBL(CheckBoxList cblToPopulate, string sStoredProc, string sDVF, string sDTF, List<string> sParams)
    {
        SqlDataReader objDataReader = ExecuteReader(sConnection, sStoredProc, sParams);    

        cblToPopulate.DataSource = objDataReader;
        cblToPopulate.DataValueField = sDVF;
        cblToPopulate.DataTextField = sDTF;
        cblToPopulate.DataBind();
    }

    public bool SP_CheckValueExists(string sStoredProc, List<string> sParams)
    {
        bool bFound = false;

        SqlDataReader objDataReader = ExecuteReader(sConnection, sStoredProc, sParams);      

        if (objDataReader.HasRows)
        {
            bFound = true;
        }
        else
        {
            bFound = false;
        }

        return bFound;
    }

    public void SP_CreateUpdateRecord(string sStoredProc, List<string> sParams)
    {
        SqlConnection objConn = new SqlConnection(sConnection);
        objConn.Open();

        SqlCommand objCommand = new SqlCommand(sStoredProc, objConn);
        objCommand.CommandType = CommandType.StoredProcedure;

        objCommand.Parameters.Clear();

        foreach (string myparam in sParams)
        {
            string sName = "";
            string sValue = "";
            sName = myparam.Substring(0, myparam.IndexOf(":"));
            sValue = myparam.Substring(myparam.IndexOf(":") + 1);

            objCommand.Parameters.Add(sName, SqlDbType.VarChar).Value = sValue;
        }

        objCommand.ExecuteNonQuery();

        objCommand.Parameters.Clear();
        objCommand.Dispose();
        objConn.Close();
    }

    public int SP_CreateUpdateRecordReturnID(string sStoredProc, List<string> sParams)
    {
        SqlConnection objConn = new SqlConnection(sConnection);
        objConn.Open();

        SqlCommand objCommand = new SqlCommand(sStoredProc, objConn);
        objCommand.CommandType = CommandType.StoredProcedure;

        objCommand.Parameters.Clear();

        foreach (string myparam in sParams)
        {
            string sName = "";
            string sValue = "";
            sName = myparam.Substring(0, myparam.IndexOf(":"));
            sValue = myparam.Substring(myparam.IndexOf(":") + 1);

            objCommand.Parameters.Add(sName, SqlDbType.VarChar).Value = sValue;

        }

        objCommand.ExecuteNonQuery();

        objCommand.Parameters.Clear();

        string sIdentityQ = "SELECT @@IDENTITY;";
        int ID = 0;

        objCommand.CommandType = CommandType.Text;
        objCommand.CommandText = sIdentityQ;
        ID = System.Convert.ToInt32(objCommand.ExecuteScalar());

        Debug.Print("ID is: " + ID);

        //  objCommand.Dispose();
        // objConnection.Close();

        return ID;

        objCommand.Dispose();
        objConn.Close();

    }

    public String SP_RetrieveDataOneValue(string sStoredProc, List<string> sParams)
    {
        //create dataset
        //  DataSet ds = new DataSet();
        //  ds.Tables.Add(new DataTable());

        string sReturnString = "";

        SqlDataReader objDataReader = ExecuteReader(sConnection, sStoredProc, sParams);      

        if (objDataReader.HasRows)
        {            
            while (objDataReader.Read())
            {
                sReturnString = objDataReader[0].ToString();
            }
        }

        return sReturnString;
    }
    
    public DataSet SP_RetrieveData(string sStoredProc, List<string> sParams)
    {
        //create dataset
        DataSet ds = new DataSet();
        ds.Tables.Add(new DataTable());

        SqlDataReader objDataReader = ExecuteReader(sConnection, sStoredProc, sParams);      

        if (objDataReader.HasRows)
        {
            for (int k = 0; k < objDataReader.FieldCount; k++)
            {
                ds.Tables[0].Columns.Add(new DataColumn(objDataReader.GetName(k).ToString()));
            }

            int iRowCount = 1;
            while (objDataReader.Read())
            {
                DataRow dr = ds.Tables[0].NewRow();

                for (int colcount = 0; colcount < objDataReader.FieldCount; colcount++)
                {
                    dr[colcount] = objDataReader[colcount].ToString();
                }

                ds.Tables[0].Rows.Add(dr);
                iRowCount++;
            }
        }

        return ds;
    }    

    public DataSet SP_RetrieveDataMultipleTable(string sStoredProc, List<string> sParams)
    {        
        using (SqlConnection objConn = new SqlConnection(sConnection))
        {
            using (SqlCommand objCommand = new SqlCommand(sStoredProc, objConn))
            {
                objCommand.CommandType = CommandType.StoredProcedure;

                objCommand.Parameters.Clear();

                foreach (string myparam in sParams)
                {
                    string sName = "";
                    string sValue = "";
                    sName = myparam.Substring(0, myparam.IndexOf(":"));
                    sValue = myparam.Substring(myparam.IndexOf(":") + 1);

                    objCommand.Parameters.Add(sName, SqlDbType.VarChar).Value = sValue;

                }

                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    objCommand.Connection = objConn;
                    sda.SelectCommand = objCommand;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds);                        
                        return ds;
                    }
                }
            }
        } 
    }
    

    public int InsertRecord(string sStoredProc, List<string> sParams)
    {
        int ID = 0;
        try
        {
            using (SqlConnection objConnection = new SqlConnection(sConnection))
            {
                SqlCommand objCommand = new SqlCommand(sStoredProc, objConnection);
                objCommand.Connection.Open();
                objCommand.CommandType = CommandType.StoredProcedure;

                objCommand.Parameters.Clear();

                foreach (string myparam in sParams)
                {
                    string sName = "";
                    string sValue = "";
                    sName = myparam.Substring(0, myparam.IndexOf(":"));
                    sValue = myparam.Substring(myparam.IndexOf(":") + 1);

                    objCommand.Parameters.Add(sName, SqlDbType.VarChar).Value = sValue;

                }

                var returnParameter = objCommand.Parameters.Add("@ReturnVal", SqlDbType.Int);
                returnParameter.Direction = ParameterDirection.ReturnValue;

                objCommand.ExecuteNonQuery();
                objCommand.Parameters.Clear();
                ID = System.Convert.ToInt32(returnParameter.Value);

            }
        }
        catch (Exception ex)
        {
            // Handle exception
        }

        return ID;
    }

    
}
