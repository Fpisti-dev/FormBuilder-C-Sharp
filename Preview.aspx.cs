using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Preview : System.Web.UI.Page
{
    string fID = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Debug.Print("Preview loaded");
        if (!IsPostBack) { Debug.Print("not postback"); }
        else { Debug.Print("postback"); }

        if (!String.IsNullOrEmpty(Request.QueryString["fID"]))
        {
            // Query string value is there so now use it
            fID = Convert.ToString(Request.QueryString["fID"]);
        }

        if (fID != "")
        {
            Debug.Print("ID: " + fID);
        }
    }
}