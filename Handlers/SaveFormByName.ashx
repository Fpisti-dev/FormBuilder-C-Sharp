<%@ WebHandler Language="C#" Class="SaveFormByName" %>

using System;
using System.Web;
using System.Net.Mail;
using System.Collections.Generic;

public class SaveFormByName : IHttpHandler {

    public static string sUserName;

    public void ProcessRequest(HttpContext context)
    {

        sUserName = HttpContext.Current.User.Identity.Name.Replace("NORTHUMBERLAND\\", "").ToString();

        //default return value
        var returnValue = "Unknown";
        try
        {
            //We get all the values entered on the add/edit form            
            var sFormName = context.Request.Form["FormName"].ToString();
            var sPages = context.Request.Form["Pages"].ToString();
            var sDesigner = context.Request.Form["Designer"].ToString();
            var sStyling = context.Request.Form["Styling"].ToString();
            var sScripting = context.Request.Form["Scripting"].ToString();
            var sResourcesStyle = context.Request.Form["ResourcesStyle"].ToString();
            var sResourcesScript = context.Request.Form["ResourcesScript"].ToString();

            //we make sure that neither the fullname, address and postcode are empty            
            if (string.IsNullOrEmpty(sFormName))
            {
                returnValue = "Not valid";
            }
            else
            {
                int ID = 0;

                try
                {
                    Data da = new Data();
                    List<string> sParams = new List<string>();
                    sParams.Clear();

                    sParams.Add("@FormName:" + sFormName);
                    sParams.Add("@PageHtml:" + sPages);
                    sParams.Add("@DesignerHtml:" + sDesigner);
                    sParams.Add("@UserName:" + sUserName);
                    sParams.Add("@Styling:" + sStyling);
                    sParams.Add("@Scripting:" + sScripting);
                    sParams.Add("@ResourcesStyle:" + sResourcesStyle);
                    sParams.Add("@ResourcesScript:" + sResourcesScript);                    

                    ID = da.InsertRecord("IF_SP_UPDATE_FORM_HTML_BY_NAME", sParams);
                }
                catch
                {

                }

                if (ID != -1)
                {
                    //Send email
                    MailMessage message = new MailMessage("NoReply@northumberland.gov.uk", "istvan.franko@northumberland.gov.uk", "New form saved.", " Form's ID number is: " + ID);
                    SmtpClient emailClient = new SmtpClient("smtp-ob.northumberland.local");
                    emailClient.Port = 25;
                    //emailClient.Send(message);

                    returnValue = "OK"; //Operation succeeded.
                }
                else
                {
                    returnValue = "Exist"; //Operation failed.
                }
            }
        }
        catch (Exception ex)
        {
            returnValue = "Exception generated: " + ex.Message; //report the exception message if one was hit
        }
        finally
        {
            //JSON template
            string jsonTemplate = @"{{
              ""code"": ""{0}""
            }}";

            context.Response.ContentType = "application/json";
            var jsonReturn = string.Format(jsonTemplate, returnValue);
            context.Response.Write(jsonReturn); //write off the oeration code
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