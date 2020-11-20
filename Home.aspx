<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register src="~/Modals/NewForm.ascx" TagName="NewForm" TagPrefix="nf" %>
<%@ Register src="~/Modals/EditForm.ascx" TagName="EditForm" TagPrefix="ef" %>
<%@ Register src="~/Modals/FormDetails.ascx" TagName="FormDetails" TagPrefix="fd" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">
    <form id="form1" runat="server">
        <div>
            <nf:NewForm ID="newForm" runat="server" />
            <ef:EditForm ID="editForm" runat="server" />
            <fd:FormDetails ID="formDetails" runat="server" />

            <asp:Panel ID="pnlMain" runat="server"></asp:Panel>
        </div>
    </form>

    <script src="Scripts/js/Home.js"></script>

</asp:Content>
