$(document).ready(function () {

    //Hook up the click event for the add/edit work request button
    $("#btnNewForm").click(function () {
        //clear form
        ClearForm();

        //open modal window
        $('#newFormModal').modal('toggle');
    });

    //Hook up the click event for the save button on the add/edit popup window
    $("#btnSaveForm").click(function () {
        //validate that name and last name were entered
        var errorMsg = "";
        if (!$("#txtName").val()) {
            errorMsg += "\n* Name required!";
        }

        if (errorMsg != "") {
            errorMsg = "The following errors were found: \n" + errorMsg + "\n\n Please enter the required information and try again.";
            alert(errorMsg);
        }
        else {
            //JQuery ajax call
            $.ajax({
                method: "POST",
                url: "../Handlers/SaveRequest.ashx",
                dataType: "json",
                data: {
                    Name: $("#txtName").val(),
                    Description: $("#txtDescription").val(),
                    SourceLocation: $("#txtSourceLocation").val(),
                    SourceLayer: $("#txtSourceLayer").val(),
                    DestLocation: $("#txtDestLocation").val(),
                    DestPrefix: $("#txtDestPrefix").val(),
                    DestLayer: $("#txtDestLayer").val(),
                    ServiceURL: $("#txtServiceURL").val(),
                    Owner: $("#txtOwner").val(),
                    Update: $("#slbUpdate").val(),
                    Notes: $("#txtNotes").val(),
                    Alias: $("#txtAlias").val()
                },
                success: function (result) {
                    switch (result.code) {
                        case "OK":
                            $('#newRequest').modal('hide'); //hide the popup window
                            alert("Successfully saved to database!");
                            location.reload();
                            break;
                        case "Not Valid":
                            alert("Server received invalid information.");
                            break;
                        default:
                            alert("Unknown server issue." + result.code);
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert("AJAX Save Request error" + thrownError);
                }
            })
        }
    });
});


function ClearForm() //blank the add/edit popup form
{
    $("#newRequest input").each(function () {
        $(this).val('');
    });
    $("#slbUpdate").val('');
}