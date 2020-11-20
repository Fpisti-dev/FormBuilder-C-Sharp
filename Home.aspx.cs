using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.HtmlControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // get logged in user name
        string sUserName = HttpContext.Current.User.Identity.Name.Replace("NORTHUMBERLAND\\", "").ToString();

        // access to a control on master page
        HtmlAnchor lblMasterUserName = (HtmlAnchor)Master.FindControl("lblUserName");
        lblMasterUserName.InnerText = sUserName;

        HtmlButton btnMasterAddButton = (HtmlButton)Master.FindControl("btnNewForm");
        btnMasterAddButton.Visible = true;
        HtmlButton btnMasterLoadButton = (HtmlButton)Master.FindControl("btnLoadForm");
        btnMasterLoadButton.Visible = false;
        HtmlButton btnMasterSaveButton = (HtmlButton)Master.FindControl("btnSaveForm");
        btnMasterSaveButton.Visible = false;
        HtmlButton btnMasterPreviewButton = (HtmlButton)Master.FindControl("btnPreviewForm");
        btnMasterPreviewButton.Visible = false;
        HtmlButton btnMasterLaunchButton = (HtmlButton)Master.FindControl("btnLaunchForm");
        btnMasterLaunchButton.Visible = false;
        HtmlButton btnMasterExitButton = (HtmlButton)Master.FindControl("btnExitForm");
        btnMasterExitButton.Visible = false;  

        populateTable();

    }

    public void populateTable()
    {
        // array for column names
        string[] aColumnNames = new string[] { "ID", "Form Name", "Creator", "Date", "Published" };

        // database column names
        string[] aDBFieldNames = new string[] { "id", "FormName", "CreatedBy", "CreatedAt", "Published" };

        // a list of parameters for stored procedors only!
        List<string> sParams = new List<string>();
        sParams.Clear();

        //sParams.Add("@id:" + "sample params");

        HtmlTables ht = new HtmlTables();
        ht.SP_populateHtmlTables(pnlMain, "example", "IF_SP_READ_FORMS", aColumnNames, aDBFieldNames, sParams);

    } 
}