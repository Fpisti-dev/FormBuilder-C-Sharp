<%@ WebHandler Language="C#" Class="UpdateForm" %>

using System;
using System.Web;
using System.Net.Mail;
using System.Collections.Generic;

public class UpdateForm : IHttpHandler {

    public static string sUserName;
    
    public void ProcessRequest (HttpContext context) {

        sUserName = HttpContext.Current.User.Identity.Name.Replace("NORTHUMBERLAND\\", "").ToString();
        
        //default return value
        var returnValue = "Unknown";
        try
        {
            //Get all the values 
            var sID = context.Request.Form["ID"].ToString();
            var sFormName = context.Request.Form["FormName"].ToString();
            var sPublished = context.Request.Form["Published"].ToString();          
            
            
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

                    sParams.Add("@ID:" + sID);
                    sParams.Add("@FormName:" + sFormName);
                    sParams.Add("@Published:" + sPublished);
                    sParams.Add("@UserName:" + sUserName);

                    ID = da.InsertRecord("IF_SP_UPDATE_FORM_DETAILS", sParams);
                }
                catch
                {

                }

                if (ID != -1)
                {
                    //Send email
                    MailMessage message = new MailMessage("NoReply@northumberland.gov.uk", "istvan.franko@northumberland.gov.uk", "Form update.", " Form's ID number is: " + ID);
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
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}