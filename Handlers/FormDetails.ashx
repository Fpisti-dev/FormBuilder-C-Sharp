<%@ WebHandler Language="C#" Class="FormDetails" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Data;
using System.Web.Script.Serialization;

public class FormDetails : IHttpHandler {

    string sFormName, sCreatedBy, sCreatedAt, sPublished, sLastEditedBy, sLastEditDate = "";
    
    public void ProcessRequest (HttpContext context) {
        
        var id = context.Request["Id"]; //This is the ID receiced by the client to be loaded
        var returnValue = "Unknown"; //default return value
        var data = ""; //this will hold the JSON object with the customer information

        try
        {
            Data da = new Data();
            List<string> sParams = new List<string>();
            sParams.Clear();

            sParams.Add("@id:" + id);

            DataSet dsINFO = da.SP_RetrieveData("[IF_SP_READ_FORM_DETAILS_BY_ID]", sParams);

            if (dsINFO.Tables.Count > 0)
            {
                foreach (DataTable tableINFO in dsINFO.Tables)
                {
                    foreach (DataRow rowINFO in tableINFO.Rows)
                    {                            
                        sFormName = rowINFO["FormName"].ToString();
                        sCreatedBy = rowINFO["CreatedBy"].ToString();
                        sPublished = rowINFO["Published"].ToString();
                        sLastEditedBy = rowINFO["LastEditedBy"].ToString();

                        string CreatedAt = rowINFO["CreatedAt"].ToString();
                        if (CreatedAt == "" || CreatedAt.IndexOf("1900") >= 0)
                        {
                            sCreatedAt = "";
                        }
                        else
                        {
                            DateTime ddatecontractor = Convert.ToDateTime(rowINFO["CreatedAt"].ToString());
                            string tCreatedAt = ddatecontractor.ToShortDateString();
                            sCreatedAt = tCreatedAt;
                        }                        

                        string LastEditDate = rowINFO["LastEditDate"].ToString();
                        if (LastEditDate== "" || LastEditDate.IndexOf("1900") >= 0)
                        {
                            sLastEditDate = "";
                        }
                        else
                        {
                            DateTime ddatecontractor = Convert.ToDateTime(rowINFO["LastEditDate"].ToString());
                            string tLastEditDate = ddatecontractor.ToShortDateString();
                            sLastEditDate = tLastEditDate;
                        }
                    }
                }

                //record was found, so we pass OK
                returnValue = "OK";
                var serializer = new JavaScriptSerializer(); //Object that converts our object into JSON
                data = serializer.Serialize(
                    new //This is an anonymous object with all the contents converted to string so we prepare everything to be packed on the JSON string
                    {
                        FormName = sFormName,
                        CreatedBy = sCreatedBy, 
                        CreatedAt = sCreatedAt, 
                        Published = sPublished, 
                        LastEditedBy = sLastEditedBy, 
                        LastEditDate = sLastEditDate                        
                    }
                );
            }

        }
        catch (Exception ex)
        {
            //We pass report the oporation as an error and we return the exception information
            data = "\"" + ex.Message + "\"";
            returnValue = "Error";
        }
        finally
        {
            //JSON string template
            string jsonTemplate = @"{{
              ""code"": ""{0}"",
              ""data"": {1}  
            }}";

            context.Response.ContentType = "application/json";
            var jsonReturn = string.Format(jsonTemplate, returnValue, data);
            context.Response.Write(jsonReturn); //Writes out the JSON packed string
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}