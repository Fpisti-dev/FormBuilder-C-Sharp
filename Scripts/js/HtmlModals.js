/*************************************
Button section
**************************************/
function openBTNModal() {

    var input = $('#' + lastItemId + ' button')[0];

    //Label
    console.log(input);
    $('#txtBTNLabel').val($('#' + input.id).html());

    //Name    
    openName('BTN', input);

    //Visibility
    openVisibility('BTN');

    $('#BTNModal').modal('toggle');
}

function deleteBTN() {
    deleteItem();
    $('#BTNModal').modal('toggle');
};

function updateBTN() {

    var input = $('#' + lastItemId + ' button')[0];
    var valid = true;

    //Update Label
    //updateLabel('BTN');

    //Update id if required
    if ($('#txtBTNName').val() != $('#oldBTNName').val()) {

        valid = updateName('BTN', input);
    }

    //Update Visibility
    updateVisible('BTN');


    $('#BTNModal').modal('toggle');
}


/*************************************
Hidden field section
**************************************/
function openHFModal() {
    $('#HFModal').modal('toggle');
}

function deleteHF() {
    deleteItem();
    $('#HFModal').modal('toggle');
};

function updateHF() {
    $('#HFModal').modal('toggle');
}

/*************************************
HTML section
**************************************/
function openHtmlModal() {
    var element = $('#' + lastItemId).children().eq(2);

    $('#txtHTMLID').val($(element)[0].id);
    $('#oldHTMLID').val($(element)[0].id);

    if ($('.Editor-container').length) {
        $('.Editor-container').remove();
    }

    $('#dHTMLEditor').Editor();
    $('.Editor-editor').append(element[0].innerHTML);
    $('#HTMLModal').modal('toggle');
};

function deleteHTML() {
    deleteItem();
    $('#HTMLModal').modal('toggle');
};

function updateHTML() {

    var newID = $('#txtHTMLID').val();
    var oldID = $('#oldHTMLID').val();
    var newHtml = $('.Editor-editor').html();

    console.log(newHtml);

    $('#' + oldID).empty().html(newHtml);

    
    if (newID != oldID) {


        var bUpdated = idChecker(newID, oldID);

        if (bUpdated) {

        }

        /*
        if (ranGuID.indexOf(newI) == -1) {

            // update old item in id array
            var index = ranGuID.indexOf(oldI);
            if (index !== -1) { ranGuID[index] = newI; }

            // update layout id
            var element = document.getElementById(oldI);
            element.id = newI;
        }
        else {
            alert('This ID is exist. Please enter another ID?');
        }*/
    }

    if ($('#cbHTMLVisible').prop('checked') == true) {
        updateVisibility('true');
    }
    else {
        updateVisibility('false');
    }


    $('#HTMLModal').modal('toggle');
};


/*************************************
Label section
**************************************/
function openLBLModal() {
    $('#LBLModal').modal('toggle');
}

function deleteLBL() {
    deleteItem();
    $('#LBLModal').modal('toggle');
};

function updateLBL() {
    $('#LBLModal').modal('toggle');
}


/*************************************
Spacer section
**************************************/
function openSPCModal() {
    $('#SPCModal').modal('toggle');
}

function deleteSPC() {
    deleteItem();
    $('#SPCModal').modal('toggle');
};

function updateSPC() {
    $('#SPCModal').modal('toggle');
}


/*************************************
Table section
**************************************/
function openTBLModal() {
    $('#TBLModal').modal('toggle');
}

function deleteTBL() {
    deleteItem();
    $('#TBLModal').modal('toggle');
};

function updateTBL() {
    $('#TBLModal').modal('toggle');
}

