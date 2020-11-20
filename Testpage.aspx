<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Testpage.aspx.cs" Inherits="Testpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

        <script src="/Scripts/js/jquery-1.12.4.js"></script>
    <script src="/Scripts/js/jquery-ui.js"></script>

    <%--Style sheets--%>
    <link rel="stylesheet" href="/Scripts/css/jquery-ui.css" />

      <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    <p>Date: <input type="text" id="datepicker" /></p>
    </div>
    </form>
</body>
</html>
