using System;
using System.Data;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Data.SqlClient;


/// <summary>
/// Summary description for HtmlTables
/// </summary>
public class HtmlTables
{

    //Live Server
    public static string LiveServerConn = ConfigurationManager.ConnectionStrings["FormB"].ConnectionString;

    //Test Server
    public static string TestServerConn = ConfigurationManager.ConnectionStrings["FormB"].ConnectionString;

    
    public string LiveServer = "W5VWEBLIVE";

    string sConnection = "";

            
	public HtmlTables()
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
	


    public void SP_populateHtmlTables(Panel  pnlID, string sTableID, string sStoredProcedure, 
        string[] aColumnNames, string[] aDBFieldNames, List<string> sParams)
    {

        DataTable dt = new DataTable();
        SqlDataReader objDataReader = ExecuteReader(sConnection, sStoredProcedure, sParams);

        dt.Load(objDataReader);

               
        string sTable = "<table id='" + sTableID + "' class='table table-striped table-bordered' BorderStyle='Solid' BorderWidth='2'><thead><tr>";

        for (int i = 0; i < aColumnNames.Length; i++)
        {
            if (i == 0 || i == 4)
            {
                sTable += "<th class='input-filter' style='text-align:center;width: 10%'>" + aColumnNames[i] + "</th>";
            }
            else if (i == 1)
            {
                sTable += "<th class='input-filter' style='text-align:center;width: 30%'>" + aColumnNames[i] + "</th>";
            }            
            else
            {
                sTable += "<th class='input-filter' style='text-align:center;width: 17%'>" + aColumnNames[i] + "</th>";
            }
        }

        sTable += "<th class='input-filter' style='text-align:center;width: 16%'>Tools</th></tr></thead><tbody>";

        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {

            sTable += "<tr>";
            int count = 1;
            foreach (string name in aDBFieldNames)
            {
                if (count == 1)
                {
                    sTable += "<td style='text-align:center'><a class='btn btn-primary btn-xs' id='view_" + dt.Rows[i]["id"].ToString() + "' onclick=btnDetails_Click('" + dt.Rows[i]["id"].ToString() + "')>" + dt.Rows[i]["id"].ToString() + "</a></td>";
                }
                else
                {
                    sTable += "<td style='text-align:center'>" + dt.Rows[i][name].ToString() + "</td>";
                }
                count++;
            }

            //call javascript function 
            sTable += "<td><a class='btn btn-success btn-xs' style='margin-left: 6px;' id='edit_" + dt.Rows[i]["id"].ToString() + "' onclick=btnEdit_Click('" + dt.Rows[i]["id"].ToString() + "')>Edit</a>";

            sTable += "<a class='btn btn-info btn-xs' style='margin-left: 10px;' id='load_" + dt.Rows[i]["id"].ToString() + "' href=../Editor.aspx?fID=" + Uri.EscapeUriString(dt.Rows[i]["FormName"].ToString()) + ">Load</a>";

            sTable += "<a class='btn btn-warning btn-xs' target='_blank' style='margin-left: 10px;' id='load_" + dt.Rows[i]["id"].ToString() + "' href=../Preview.aspx?fID=" + Uri.EscapeUriString(dt.Rows[i]["FormName"].ToString()) + ">Preview</a>";


            sTable += "<a class='btn btn-primary btn-xs' target='_blank' style='margin-left: 10px;' id='load_" + dt.Rows[i]["id"].ToString() + "' href=../Form.aspx?fID=" + Uri.EscapeUriString(dt.Rows[i]["FormName"].ToString()) + ">Launch</a></td></tr> ";           
        }

        sTable += "</tbody>";

        //add footer if required
        sTable += "<tfoot><tr>";

        for (int i = 0; i < aColumnNames.Length; i++)
        {
            sTable += "<th>" + aColumnNames[i] + "</th>";
        }

        sTable += "<th></th></tr></tfoot>"; 

        pnlID.Controls.Add(new LiteralControl(sTable));
    }
}