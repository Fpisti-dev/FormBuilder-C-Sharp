<%@ WebHandler Language="C#" Class="LoadFormByName" %>

using System;
using System.Data;
using System.Web;
using System.Collections.Generic;
using System.Web.Script.Serialization;

public class LoadFormByName : IHttpHandler {

    string sPageHtml, sDesignerHtml, sPublished, sStyling, sScripting, sResourcesStyle, sResourcesScript = "";

    public void ProcessRequest(HttpContext context)
    {
        var sFormName = context.Request["FormName"]; //This is the ID receiced by the client to be loaded
        var returnValue = "Unknown"; //default return value
        var data = ""; //this will hold the JSON object with the customer information       

        try
        {
            Data da = new Data();
            List<string> sParams = new List<string>();
            sParams.Clear();

            sParams.Add("@FormName:" + sFormName);

            DataSet dsINFO = da.SP_RetrieveData("IF_SP_READ_FORM_HTML_BY_NAME", sParams);

            if (dsINFO.Tables.Count > 0)
            {
                foreach (DataTable tableINFO in dsINFO.Tables)
                {
                    foreach (DataRow rowINFO in tableINFO.Rows)
                    {
                        sPageHtml = rowINFO["PageHtml"].ToString();                        
                        sDesignerHtml = rowINFO["DesignerHtml"].ToString();
                        sPublished = rowINFO["Published"].ToString();
                        sStyling = rowINFO["Styling"].ToString();
                        sScripting = rowINFO["Scripting"].ToString();
                        sResourcesStyle = rowINFO["ResourcesStyle"].ToString();
                        sResourcesScript = rowINFO["ResourcesScript"].ToString();
                    }
                }
            }

            //record was found, so we pass OK
            returnValue = "OK";
            var serializer = new JavaScriptSerializer(); //Object that converts our object into JSON
            data = serializer.Serialize(
                new //This is an anonymous object with all the contents converted to string so we prepare everything to be packed on the JSON string
                {
                    Pages = sPageHtml,
                    Designer = sDesignerHtml,
                    Published = sPublished,
                    Styling = sStyling,
                    Scripting = sScripting,
                    ResourcesStyle = sResourcesStyle,
                    ResourcesScript = sResourcesScript
                }
           );
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

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}