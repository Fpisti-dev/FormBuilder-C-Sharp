$(document).ready(function () {

    //Datatable
    $('#example tfoot th').each(function (i) {

        if (i < ($('#example tfoot th').length - 1)) {
            var title = $(this).text();
            $(this).html('<input class="col-sm-12" type="text" placeholder="' + title + '" />');
        }
    });

    // DataTable
    var table = $('#example').DataTable({
        dom: 'lBfrtip',
        buttons: [
            {
                extend: 'copyHtml5',
                exportOptions: {
                    columns: [0, 1, 2, 3, 4]
                }
            },
            {
                extend: 'print',
                exportOptions: {
                    columns: [0, 1, 2, 3, 4]
                }
            },
            {
                extend: 'csvHtml5',
                exportOptions: {
                    columns: [0, 1, 2, 3, 4]
                }
            },
            {
                extend: 'pdfHtml5',
                exportOptions: {
                    columns: [0, 1, 2, 3, 4]
                }
            }
        ],
        "oLanguage": {
            "sZeroRecords": "No records to display",
            "sSearchPlaceholder": "Search in all columns",
            "sSearch": "Search "
        },
        "aLengthMenu": [[10, 20, 50, 100, 150, 250], [10, 20, 50, 100, 150, 250]],
        "iDisplayLength": 10,
        "bSortClasses": false,
        "bStateSave": false,
        "bPaginate": true,
        "bAutoWidth": false,
        "bProcessing": true,
        "bDestroy": true,
        "bJQueryUI": true,
        "sPaginationType": "full_numbers",
        "bDeferRender": true,
        "columnDefs": [{ //this definition is set so the column with the action buttons is not sortable
            "targets": -1, //this references the last column of the date
            "orderable": false,
            "searchable": false
        }]
    });


    // Apply columns search
    table.columns().every(function () {
        var that = this;

        $('input', this.footer()).on('keyup change', function () {
            if (that.search() !== this.value) {
                that
                    .search(this.value)
                    .draw();
            }
        });
    });


    //Hook up the click event for the add/edit work request button
    $("#btnNewForm").click(function () {
        //clear form
        ClearForm();

        //open modal window
        $('#newFormModal').modal('toggle');
    });

    //Hook up the click event for the save button on the add popup window
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
                url: "../Handlers/InsertForm.ashx",
                dataType: "json",
                data: {
                    Name: $("#txtName").val()
                },
                success: function (result) {
                    switch (result.code) {
                        case "OK":
                            $('#newFormModal').modal('hide'); //hide the popup window
                            alert("Successfully saved to database!");
                            location.reload();
                            break;
                        case "Not Valid":
                            alert("Server received invalid information.");
                            break;
                        case "Exist":
                            alert("Name duplication! Please select another name?");
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

function btnDetails_Click(x) {

    console.log("clicked: " + x);

    //Clear form
    //ClearForm();

    $.ajax({
        method: "POST",
        url: "../Handlers/FormDetails.ashx",
        dataType: "json",
        async: true,
        data: {
            Id: x
        },
        success: function (result) {
            switch (result.code) {
                case "OK":

                    $('#lblID').text(x);
                    $('#lblFormName').text(result.data.FormName);
                    $('#lblCreatedBy').text(result.data.CreatedBy);
                    $('#lblCreatedAt').text(result.data.CreatedAt);
                    $('#lblPublished').text(result.data.Published);
                    $('#lblLastEditedBy').text(result.data.LastEditedBy);
                    $('#lblLastEditDate').text(result.data.LastEditDate);

                    $('#DetailsModal').modal('toggle');
                    break;
                case "NotFound":
                    alert("Record not found.");
                    break;
                case "Error":
                    alert("Handler Error" + result.data);
                    break;
                default:
                    alert("Unknown server issue" + result.code);
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert("Load User AJAX Error:" + thrownError);
        }
    });
}

function btnEdit_Click(x) {

    console.log("Edit: " + x);

    //Clear form
    //ClearForm();

    $.ajax({
        method: "POST",
        url: "../Handlers/FormDetails.ashx",
        dataType: "json",
        async: true,
        data: {
            Id: x
        },
        success: function (result) {
            switch (result.code) {
                case "OK":

                    $('#lblEditID').text(x);
                    $('#txtEditFormName').val(result.data.FormName);
                    $('#lblEditCreatedBy').text(result.data.CreatedBy);
                    $('#lblEditCreatedAt').text(result.data.CreatedAt);
                    $('#slbEditPublished').val(result.data.Published).change();                    
                    $('#lblEditLastEditedBy').text(result.data.LastEditedBy);
                    $('#lblEditLastEditDate').text(result.data.LastEditDate);
                    $('#cEditID').val(x);

                    console.log('-' + result.data.Published + '-');

                    $('#EditModal').modal('toggle');
                    break;
                case "NotFound":
                    alert("Record not found.");
                    break;
                case "Error":
                    alert("Handler Error" + result.data);
                    break;
                default:
                    alert("Unknown server issue" + result.code);
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert("Load User AJAX Error:" + thrownError);
        }
    });
};

function btnEditUpdate_Click() {
    var id = $('#cEditID').val();
    console.log('Update: ' + id);

    $.ajax({
        method: "POST",
        url: "../Handlers/UpdateForm.ashx",
        dataType: "json",
        async: true,
        data: {
            ID: id,
            FormName: $("#txtEditFormName").val(),
            Published: $("#slbEditPublished").val()
        },
        success: function (result) {
            switch (result.code) {
                case "OK":                                          
                    $('#EditModal').modal('hide'); //hide the popup window
                    alert("Form's been updated correctly.");
                    location.reload();
                    break;
                case "Not Valid":
                    alert("Server received invalid information.");
                    break;
                case "Exist":
                    alert("Name duplication! Please select another name?");
                    break;
                default:
                    alert("Unknown server issue at update. " + result.code);
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert("AJAX Save request error" + thrownError);
        }
    });
};

function ClearForm() //blank the add/edit popup form
{
    $("#newRequest input").each(function () {
        $(this).val('');
    });
    $("#slbUpdate").val('');
}


