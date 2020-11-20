<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Preview.aspx.cs" Inherits="Preview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Form Builder Preview</title>

    <script src="/Scripts/js/jquery-1.12.4.js"></script>
    <script src="/Scripts/js/jquery-ui.js"></script>
    <script src="/Scripts/Bootstrap/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/Scripts/css/jquery-ui.css" />
    <link rel="stylesheet" href="/Scripts/Bootstrap/css/bootstrap-select.css"  />
    <link rel="stylesheet" href="/Scripts/Bootstrap/css/bootstrap.min.css" />

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="/Scripts/css/style.css" />
    <link rel="stylesheet" href="/Scripts/css/custom.css" />    

</head>
<body>
    <form id="form1" runat="server">
    <h2 id="title-preview" class="page-header" style="margin-left: 1em;"></h2>
    <div id="form-preview" class="col-sm-12">
        <div id="menu-preview" class="col-sm-3"></div>
        <div id="pages-preview" class="col-sm-9"></div>    
    </div>
    </form>
    <script src="Scripts/js/Preview.js"></script>
</body>
</html>
