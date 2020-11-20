using System;
using System.Web;
using System.Diagnostics;
using System.Web.UI.HtmlControls;

public partial class Editor : System.Web.UI.Page
{
    string fID = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        // get logged in user name
        string sUserName = HttpContext.Current.User.Identity.Name.Replace("NORTHUMBERLAND\\", "").ToString();

        // access to a control on master page
        HtmlAnchor lblMasterUserName = (HtmlAnchor)Master.FindControl("lblUserName");
        lblMasterUserName.InnerText = sUserName;
        
        HtmlButton btnMasterAddButton = (HtmlButton)Master.FindControl("btnNewForm");
        btnMasterAddButton.Visible = false;
        HtmlButton btnMasterLoadButton = (HtmlButton)Master.FindControl("btnLoadForm");
        btnMasterLoadButton.Visible = true;
        HtmlButton btnMasterSaveButton = (HtmlButton)Master.FindControl("btnSaveForm");
        btnMasterSaveButton.Visible = true;
        HtmlButton btnMasterPreviewButton = (HtmlButton)Master.FindControl("btnPreviewForm");
        btnMasterPreviewButton.Visible = true;
        HtmlButton btnMasterLaunchButton = (HtmlButton)Master.FindControl("btnLaunchForm");
        btnMasterLaunchButton.Visible = true;
        HtmlButton btnMasterExitButton = (HtmlButton)Master.FindControl("btnExitForm");
        btnMasterExitButton.Visible = true;

        Debug.Print("Editor loaded");
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