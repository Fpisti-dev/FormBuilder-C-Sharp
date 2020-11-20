function deleteItem() {

    if (confirm("Please confrim to delete?") == true) {
        $('#' + lastItemId).remove();
    }   
}

function updateVisibility(b) {

    var element = document.getElementById(lastItemId);
    var imgVis = document.getElementById('img_vis_' + lastItemId);

    if (b == 'true') {        
        imgVis.setAttribute('src', '/Images/visible-item.png');
        element.setAttribute('data-visible', 'true');
    }
    else {
        imgVis.setAttribute('src', '/Images/invisible-item.png');
        element.setAttribute('data-visible', 'false');
    }
}

function openLabel(preF) {

    var label = $('#' + lastItemId + ' label');
    $('#txt' + preF + 'Label').val($(label).text());
}

function openName(preF, input) {

    $('#txt' + preF + 'Name').val(input.id);
    $('#old' + preF + 'Name').val(input.id);
}

function openVisibility(preF) {

    var bVisible = ($('#' + lastItemId).attr('data-visible'));

    if (bVisible == 'true') {
        $('#cb' + preF + 'Visible').attr('checked', true);
    }
    else {
        $('#cb' + preF + 'Visible').attr('checked', false);
    }
}

function openPlaceholder(preF, input) {

    $('#txt' + preF + 'Placeholder').val(input.placeholder);
}

function openReadonly(preF, input) {

    if ($(input).prop('readonly')) {
        $('#r' + preF + 'ReadonlyNo').prop('checked', false);
        $('#r' + preF + 'ReadonlyYes').prop('checked', true);
    }
    else {
        $('#r' + preF + 'ReadonlyNo').prop('checked', true);
        $('#r' + preF + 'ReadonlyYes').prop('checked', false);
    }
}

function openRequired(preF, input) {    

    if ($(input).prop('required') == true) {
        $('#cb' + preF + 'Requried').prop('checked', true)
    }
    else {
        $('#cb' + preF + 'Requried').prop('checked', false)
    }
}

function openMessage(preF, input) {

    if ($(input).attr('oninvalid')) {
        var message = $(input).attr('oninvalid').split("'")[1];
        $('#txt' + preF + 'Message').val(message);
    }
    else {
        $('#txt' + preF + 'Message').val('');
    }
}

function openStyle(preF, input) {

    $('#txt' + preF + 'Style').val(input.className);
}

function updateLabel(preF) {

    var label = $('#' + lastItemId + ' label');
    $(label).text($('#txt' + preF + 'Label').val());
}

function updateName(preF, input) {

    var valid = true;

    //Check id hasn't been used
    var oldIndex = ranGuID.indexOf($('#old' + preF + 'Name').val());
    var newIndex = ranGuID.indexOf($('#txt' + preF + 'Name').val());

    if (newIndex > -1) {
        alert("Input's name already used, please select another name?");
        valid = false;
    }
    else {
        ranGuID[oldIndex] = $('#txt' + preF + 'Name').val();
        $(input).prop('id', $('#txt' + preF + 'Name').val());
        valid = true;
    }

    return (valid);
}

function updateVisible(preF) {

    if ($('#cb' + preF + 'Visible').prop('checked') == true) {
        updateVisibility('true');
    }
    else {
        updateVisibility('false');
    }
}

function updatePlaceholder(preF, input) {

    $(input).prop('placeholder', $('#txt' + preF + 'Placeholder').val());
}

function updateReadonly(preF, input) {

    if ($('#r' + preF + 'ReadonlyYes').prop('checked')) {
        $(input).prop('readonly', true);
    }
    else {
        $(input).removeProp('readonly');
    }
}

function updateRequired(preF, input) {

    if ($('#cb' + preF + 'Requried').prop('checked') == true) {
        $(input).prop('required', true);

        //Error message
        $(input).attr('oninvalid', "this.setCustomValidity('" + $('#txt' + preF + 'Message').val() + "')");
    }
    else {
        $(input).prop('required', false);

        //Error message
        $(input).attr('oninvalid', "this.setCustomValidity('')");
    }
}

function updateStyle(preF, input) {

    $(input).removeClass();
    $(input).addClass($('#txt' + preF + 'Style').val());
}


/*************************************
Autocomplete section
**************************************/
function openACModal() {

    var element = document.getElementById(lastItemId);
    var input = $('#' + lastItemId + ' input')[0];

    //Label
    openLabel('AC');
    
    //Name
    openName('AC', input);

    //Visibility
    openVisibility('AC');

    //Placeholder
    openPlaceholder('AC', input);

    //Required
    openRequired('AC', input);

    //Error message
    openMessage('AC', input);

    //Style
    openStyle('AC', input);

    //Source
    var source = $(input).attr('data-source');
    if (source == 'list') {
        $('#rACList').prop('checked', true);
        $('#rACDatabase').prop('checked', false);
        $('#dACList').show();
        $('#dACDatabase').hide();
    }
    else {
        $('#rACList').prop('checked', false);
        $('#rACDatabase').prop('checked', true);
        $('#dACList').hide();
        $('#dACDatabase').show();
    }

    //Change event listener for source radio
    $('input[type=radio][name=ACSourceRadio]').change(function () {
        if (this.id == 'rACList') {
            $('#dACList').show("slow");
            $('#dACDatabase').hide("slow");
        }
        else if (this.id == 'rACDatabase') {
            $('#dACList').hide("slow");
            $('#dACDatabase').show("slow");
        }
    });

    //List values
    if ($($(element).children().eq(3).children()[1]).length) { //Check element exists
        var scriptID = ($(element).children().eq(3).children()[1]).id;    
        var text = $('#' + scriptID).html();
        var start = text.indexOf('[');
        var end = text.indexOf(']');
        var list = text.substring(start + 1, end).replace(/"/g, '');
        list = list.replace(/,/g, '|');
        console.log(list);
        $('#taACList').val(list)
    }

    //var StoredProcedure = '';
    //var validation = '';    
    
    $('#ACModal').modal('toggle');
}

function deleteAC() {
    deleteItem();
    $('#ACModal').modal('toggle');
}

function updateAC() {

    var element = document.getElementById(lastItemId);
    var input = $('#' + lastItemId + ' input')[0];
    var valid = true;

    //Update Label
    updateLabel('AC');

    //Update id if required
    if ($('#txtACName').val() != $('#oldACName').val()) {
        
        valid = updateName('AC', input);
    }

    //Update Visible
    updateVisible('AC');
    
    //Update Placeholder
    updatePlaceholder('AC', input);

    //Update Required
    updateRequired('AC', input);

    //Update Style
    updateStyle('AC', input);

    //Update Source Type
    if ($('#rACList').prop('checked') == true) {
        $(input).attr('data-source', 'list');
    }
    else {
        $(input).attr('data-source', 'database');
    }

    //Update Source List
    if ($($(element).children().eq(3).children()[1]).length) { //Check element exists
        var scriptID = ($(element).children().eq(3).children()[1]).id;
        var array = $('#taACList').val().split('|');
        var text = "$(function() { var v" + input.id + " = [";

        array.forEach(function (item) {
            text += '"' + item + '",';
        });

        var text = text.slice(0, -1); //remove last coma

        text += ']; $( "#' + input.id + '").autocomplete({ source: v' + input.id + ' }); });';

        $('#' + scriptID).html(text);
    }

    //Source database

    if (valid) {
        $('#ACModal').modal('toggle');
    }
    else {
        alert('There is an error in them form!')
    }
}


/*************************************
Checkbox section
**************************************/
function openCBModal() {

    var input = $('#' + lastItemId + ' input')[0];

    //Label
    openLabel('CB');

    //Name
    openName('CB', input);

    //Visibility
    openVisibility('CB');

    //Required
    openRequired('CB', input);

    //Error message
    openMessage('CB', input);

    //Style
    openStyle('CB', input);

    $('#CBModal').modal('toggle');
}

function deleteCB() {
    deleteItem();
    $('#CBModal').modal('toggle');
}

function updateCB() {

    var input = $('#' + lastItemId + ' input')[0];
    var valid = true;

    //Update Label
    updateLabel('CB');

    //Update id if required
    if ($('#txtCBName').val() != $('#oldCBName').val()) {

        valid = updateName('CB', input);
    }

    //Update Visibility
    updateVisible('CB');

    //Update Required
    updateRequired('CB', input);

    //Update Style
    updateStyle('CB', input);    

    if (valid) {
        $('#CBModal').modal('toggle');
    }
    else {
        alert('There is an error in them form!')
    }
}


/*************************************
Checkbox Group section
**************************************/
function openCBGModal() {

    //Label
    var title = $('#' + lastItemId + ' legend');
    $('#txtCBGLabel').val($(title).text());
    
    //Name
    var fieldset = $('#' + lastItemId + ' fieldset')[0];
    openName('CBG', fieldset);

    //Visibility
    openVisibility('CBG');
    
    //Required (if one of checkbox is required all must have required
    var firstCB = $('#' + fieldset.id + ' input:first:checkbox');

    if ($(firstCB).prop('required') == true) {
        $('#cbCBGRequried').prop('checked', true)
    }
    else {
        $('#cbCBGRequried').prop('checked', false)
    }

    //Error message
    openMessage('CBG', fieldset);

    //Style all checbok has same classes
    $('#txtCBGStyle').val(firstCB[0].className);

    //Get checkboxes' properties and build a manager for them
    var str = "<table id='tCBGCheckboxes' class='table table-striped table-bordered' " + "BorderStyle='Solid' BorderWidth='2'><thead class='modal-label' ><tr><th></th><td>Label</th><th>Value</th><th>Tools</th></tr></thead><tbody>";

    var index = 0;

    $('#' + fieldset.id).find(':checkbox').each(function () {
        
        var label = $(this).parent().prev().children().eq(0)[0].innerHTML;
        str += addNewRow(index, label, $(this).attr('value'));
        index++;
    });

    str += "</tbody></table>";

    $('#dCBGTable').empty();

    $('#dCBGTable').append(str);

    $('#dCBGTable tbody').sortable();

    function addNewRow(index, label, value) {
        var row = "<tr id='" + index + "'><td align='center'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span></td>" +
            "<td><input type='text' class='form-control' id='txtCBGLabel_" + index + "' value='" + label + "' /></td>" +
            "<td><input type='text' class='form-control' id='txtCBGValue_" + index + "' value='" + value + "' required/></td>" +
            "<td align='center'><span role='button' class='glyphicon glyphicon-trash btn btn-danger btn-xs ' onclick='removeThisRow(\"" + index + "\")'></span></td></tr>";

        return row;
    }
    
    $('#CBGModal').modal('toggle');
}

function removeThisRow(x) {
    console.log(x)
    $('#' + x).remove();
}

function btnCBGNewRow() {

    var max = parseInt($('#tCBGCheckboxes > tbody  > tr').sort(function (a, b) { return +a.id < +b.id })[0].id);
    var newRowHtml = "<tr id='" + (max + 1) + "'>" + 
            "<td align='center'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span></td>" +
            "<td><input type='text' class='form-control' id='txtCBGLabel_" + (max + 1) + "' value='' /></td>" +
            "<td><input type='text' class='form-control' id='txtCBGValue_" + (max + 1) + "' value='' required/></td>" +
            "<td align='center'><span role='button' class='glyphicon glyphicon-trash btn btn-danger btn-xs ' onclick='removeThisRow(\"" + (max + 1) + "\")'></span></td></tr>";

    $('#tCBGCheckboxes tr:last').after(newRowHtml);
}

function deleteCBG() {
    deleteItem();
    $('#CBGModal').modal('toggle');
}

function updateCBG() {

    var fieldset = $('#' + lastItemId + ' fieldset')[0];
    var valid = true;

    //Check new checkbox table empty fields
    $('#tCBGCheckboxes input').each(function () {

        if ($(this).val().length <= 0) {
            if ($(this).attr('required')) {
                $(this).attr('placeholder', 'Value required');
                valid = false;
            }            
        }
    });

    if (valid) {

        //Update Label
        var title = $('#' + lastItemId + ' legend');
        $(title).text($('#txtCBGLabel').val());

        //Update id if required
        if ($('#txtCBGName').val() != $('#oldCBGName').val()) {

            //Check id hasn't been used
            valid = updateName('CBG', fieldset);
        }

        //Update Visibility
        updateVisible('CBG');

        //Remove IDs first
        removeAllChildren(fieldset.id);
        $('#' + fieldset.id).empty();

        var str = '<legend>' + $('#txtCBGLabel').val() + '</legend>';
        
        $('#tCBGCheckboxes > tbody  > tr').each(function (i) {

            var e = $(this);
            str += '<div class="col-sm-12"><div class="col-sm-6"><label class="control-label">' + $(e[0].childNodes[1]).children().val() + '</label></div><div class="col-sm-6"><input id="########" type="checkbox" name="name_' + $('#txtCBGName').val() + '" value="' + $(e[0].childNodes[2]).children().val() + '"';

            if ($('#cbCBGRequried').prop('checked') == true) {
                str += ' required';

                //Error message
                $(fieldset).attr('oninvalid', "this.setCustomValidity('" + $('#txtCBGMessage').val() + "')");
            }
            else {

                //Error message
                $(fieldset).removeAttr('oninvalid');
            }

            if ($('#txtCBGStyle').val().length) {
                str += ' class="' + $('#txtCBGStyle').val() + '" ';
            }
            
            str += '/></div></div>';
        });

        while (str.includes('########')) {
            str = str.replace('########', getGuID('cbg'));
        }

        //console.log(str);
        $('#' + fieldset.id).append(str);
       
        if (valid) {
            $('#CBGModal').modal('toggle');
        }
        else {
            alert('There is an error in them form!')
        }        
    }
    else {
        alert('Something missing!');
    }
}


/*************************************
Date section
**************************************/
function openDATEModal() {

    var input = $('#' + lastItemId + ' input')[0];

    //Label
    openLabel('DATE');

    //Name
    openName('DATE', input);

    //Visibility
    openVisibility('DATE');

    //Placeholder
    openPlaceholder('DATE', input);

    //Date format
    $('#txtDATEFormat').val($(input).attr('data-format'));

    //Readonly
    openReadonly('DATE', input);

    //Required
    openRequired('DATE', input);

    //Error message
    openMessage('DATE', input);

    //Style
    openStyle('DATE', input);

    $('#DATEModal').modal('toggle');
}

function deleteDATE() {
    deleteItem();
    $('#DATEModal').modal('toggle');
}

function updateDATE() {

    var input = $('#' + lastItemId + ' input')[0];
    var valid = true;

    //Update Label
    updateLabel('DATE');

    //Update id if required
    if ($('#txtDATEName').val() != $('#oldDATEName').val()) {

        valid = updateName('DATE', input);
    }

    //Update Visibility
    updateVisible('DATE');

    //Update Placeholder
    updatePlaceholder('DATE', input);

    //Readonly    
    updateReadonly('DATE', input);
    
    //Update Date Format
    $(input).attr('data-format', $('#txtDATEFormat').val());


    //Update Required
    updateRequired('DATE', input);

    //Update Style
    updateStyle('DATE', input);

    //Update Script
    var script = $('#' + lastItemId + ' script');
    script.html('$( function() { $("#' + $('#txtDATEName').val() + '").datepicker({ dateFormat: "' + $('#txtDATEFormat').val() + '" }); });');

    if (valid) {
        $('#DATEModal').modal('toggle');
    }
    else {
        alert('There is an error!');
    }    
}


/*************************************
File section
**************************************/
function openFILEModal() {

    var input = $('#' + lastItemId + ' input')[0];

    //Label
    openLabel('FILE');

    //Name
    openName('FILE', input);

    //Visibility
    openVisibility('FILE');

    //Required
    openRequired('FILE', input);

    //Error message
    openMessage('FILE', input);

    //Style
    openStyle('FILE', input);    

    //File types
    $('#tFILETypes input:text').each(function () { //Empty text boxes
        $(this).val('');
    });
    var sAccept = $(input).prop('accept');

    if (sAccept.length) {

        var aTypes = sAccept.split(',');

        aTypes.forEach(function (item) {

            if (item.includes('application')) {

                if (item.includes('*')) {
                    $('#cbFILEApplicationAll').prop('checked', true);
                    $('#cbFILEApplicationCustom').prop('checked', false);
                    $('#textFILEApplicationExtensions').val('');
                }
                else {
                    $('#cbFILEApplicationAll').prop('checked', false);
                    $('#cbFILEApplicationCustom').prop('checked', true);
                    $('#textFILEApplicationExtensions').val($('#textFILEApplicationExtensions').val() + item.split('/')[1] + '|');
                }
            }
            else if (item.includes('audio')) {

                if (item.includes('*')) {
                    $('#cbFILEAudioAll').prop('checked', true);
                    $('#cbFILEAudioCustom').prop('checked', false);
                    $('#textFILEAudioExtensions').val('');
                }
                else {
                    $('#cbFILEAudioAll').prop('checked', false);
                    $('#cbFILEAudioCustom').prop('checked', true);
                    $('#textFILEAudioExtensions').val($('#textFILEAudioExtensions').val() + item.split('/')[1] + '|');
                }
            }
            else if (item.includes('image')) {

                if (item.includes('*')) {
                    $('#cbFILEImageAll').prop('checked', true);
                    $('#cbFILEImageCustom').prop('checked', false);
                    $('#textFILEImageExtensions').val('');
                }
                else {
                    $('#cbFILEImageAll').prop('checked', false);
                    $('#cbFILEImageCustom').prop('checked', true);
                    $('#textFILEImageExtensions').val($('#textFILEImageExtensions').val() + item.split('/')[1] + '|');
                }
            }
            else if (item.includes('text')) {

                if (item.includes('*')) {
                    $('#cbFILETextAll').prop('checked', true);
                    $('#cbFILETextCustom').prop('checked', false);
                    $('#textFILETextExtensions').val('');
                }
                else {
                    $('#cbFILETextAll').prop('checked', false);
                    $('#cbFILETextCustom').prop('checked', true);
                    $('#textFILETextExtensions').val($('#textFILETextExtensions').val() + item.split('/')[1] + '|');
                }
            }
            else if (item.includes('video')) {

                if (item.includes('*')) {
                    $('#cbFILEVideoAll').prop('checked', true);
                    $('#cbFILEVideoCustom').prop('checked', false);
                    $('#textFILEVideoExtensions').val('');
                }
                else {
                    $('#cbFILEVideoAll').prop('checked', false);
                    $('#cbFILEVideoCustom').prop('checked', true);
                    $('#textFILEVideoExtensions').val($('#textFILEVideoExtensions').val() + item.split('/')[1] + '|');
                }
            }

        });

        //Remove all '|' end of text inputs
        $('#tFILETypes input:text').each(function () {

            var item = $(this).val();
            if (item.substr(item.length - 1) == '|') {
                $(this).val(item.substr(0, item.length - 1));
            }
        });

        //Only one should be checked from All or Customs per rows
        $('#tFILETypes input[type="checkbox"]').on('change', function () {
            $('input[name="' + this.name + '"]').not(this).prop('checked', false);
        });

        $('#FILEModal').modal('toggle');
    }
}

function deleteFILE() {
    deleteItem();
    $('#FILEModal').modal('toggle');
}

function updateFILE() {

    var input = $('#' + lastItemId + ' input')[0];
    var valid = true;

    //Update Label
    updateLabel('FILE');

    //Update id if required
    if ($('#txtFILEName').val() != $('#oldFILEName').val()) {

        valid = updateName('FILE', input);
    }

    //Update Visibility
    updateVisible('FILE');

    //Update Required
    updateRequired('FILE', input);

    //Update Style
    updateStyle('FILE', input);

    //Update Types
    var types = '';

    if ($('#cbFILEApplicationAll').prop('checked') == true) {
        types += 'application/*,';
    }
    else if ($('#cbFILEApplicationCustom').prop('checked') == true && ($('#textFILEApplicationExtensions').val()).length) {

        var aSubs = ($('#textFILEApplicationExtensions').val()).split('|');
        aSubs.forEach(function (item) {
            types += 'application/' + item + ','
        });
    }

    if ($('#cbFILEAudioAll').prop('checked') == true) {
        types += 'audio/*,';
    }
    else if ($('#cbFILEAudioCustom').prop('checked') == true && ($('#textFILEAudioExtensions').val()).length) {

        var aSubs = ($('#textFILEAudioExtensions').val()).split('|');
        aSubs.forEach(function (item) {
            types += 'audio/' + item + ','
        });
    }

    if ($('#cbFILEImageAll').prop('checked') == true) {
        types += 'image/*,';
    }
    else if ($('#cbFILEImageCustom').prop('checked') == true && ($('#textFILEImageExtensions').val()).length) {

        var aSubs = ($('#textFILEImageExtensions').val()).split('|');
        aSubs.forEach(function (item) {
            types += 'image/' + item + ','
        });
    }

    if ($('#cbFILETextAll').prop('checked') == true) {
        types += 'text/*,';
    }
    else if ($('#cbFILETextCustom').prop('checked') == true && ($('#textFILETextExtensions').val()).length) {

        var aSubs = ($('#textFILETextExtensions').val()).split('|');
        aSubs.forEach(function (item) {
            types += 'text/' + item + ','
        });
    }

    if ($('#cbFILEVideoAll').prop('checked') == true) {
        types += 'video/*,';
    }
    else if ($('#cbFILEVideoCustom').prop('checked') == true && ($('#textFILEVideoExtensions').val()).length) {

        var aSubs = ($('#textFILEVideoExtensions').val()).split('|');
        aSubs.forEach(function (item) {
            types += 'video/' + item + ','
        });
    }    

    //Remove ',' end of text 
    if (types.substr(types.length - 1) == ',') {
        types = types.substr(0, types.length - 1);
    }

    if (types.length) {
        $(input).prop('accept', types);
    }
    else {
        $(input).removeAttr('accept');
    }    


    if (valid) {
        $('#FILEModal').modal('toggle');
    }
    else {
        alert('There is an error!');
    }
}


/*************************************
Number section
**************************************/
function openNUMModal() {

    var input = $('#' + lastItemId + ' input')[0];

    //Label
    openLabel('NUM');

    //Name
    openName('NUM', input);

    //Visibility
    openVisibility('NUM');

    //Placeholder
    openPlaceholder('NUM', input);

    //Readonly
    openReadonly('NUM', input);

    //Min value
    if ($(input).attr('min')) {
        $('#txtNUMMin').val($(input).attr('min'));
    }
    else {
        $('#txtNUMMin').val('');
    }

    //Max value
    if ($(input).attr('max')) {
        $('#txtNUMMax').val($(input).attr('max'));
    }
    else {
        $('#txtNUMMax').val('');
    }

    //Default value
    if ($(input).attr('defaultvalue')) {
        $('#txtNUMDefault').val($(input).attr('defaultvalue'));
    }
    else {
        $('#txtNUMDefault').val('');
    }

    //Step
    if ($(input).attr('step')) {
        $('#txtNUMStep').val($(input).attr('step'));
    }
    else {
        $('#txtNUMStep').val('');
    }

    //Required
    openRequired('NUM', input);

    //Error message
    openMessage('NUM', input);

    //Style
    openStyle('NUM', input);

    $('#NUMModal').modal('toggle');
}

function deleteNUM() {
    deleteItem();
    $('#NUMModal').modal('toggle');
}

function updateNUM() {

    var input = $('#' + lastItemId + ' input')[0];
    var valid = true;

    //Update Label
    updateLabel('NUM');

    //Update id if required
    if ($('#txtNUMName').val() != $('#oldNUMName').val()) {

        valid = updateName('NUM', input);
    }

    //Update Visibility
    updateVisible('NUM');

    //Placeholder
    updatePlaceholder('NUM', input);

    //Update Readonly    
    updateReadonly('NUM', input);

    //Update Min Value
    if ($('#txtNUMMin').val().length) {
        $(input).attr('min', $('#txtNUMMin').val());
    }
    else {
        $(input).removeAttr('min');
    }

    //Update Max Value
    if ($('#txtNUMMax').val().length) {
        $(input).attr('max', $('#txtNUMMax').val());
    }
    else {
        $(input).removeAttr('max');
    }

    //Update Default Value
    if ($('#txtNUMDefault').val().length) {
        $(input).attr('defaultValue', $('#txtNUMDefault').val());
    }
    else {
        $(input).removeAttr('defaultValue');
    }

    //Update Step
    if ($('#txtNUMStep').val().length) {
        $(input).attr('step', $('#txtNUMStep').val());
    }
    else {
        $(input).removeAttr('step');
    }

    //Update Required
    updateRequired('NUM', input);

    //Update Style
    updateStyle('NUM', input);

    if (valid) {
        $('#NUMModal').modal('toggle');
    }
    else {
        alert('There is an error!');
    }
}

/*************************************
Password section
**************************************/
function openPSWModal() {

    var input = $('#' + lastItemId + ' input')[0];

    //Label
    openLabel('PSW');

    //Name    
    openName('PSW', input);

    //Visibility
    openVisibility('PSW');

    //Placeholder
    openPlaceholder('PSW', input);

    //Readonly
    openReadonly('PSW', input);

    //Pattern
    if ($(input).attr('pattern')) {
        $('#txtPSWPattern').val($(input).attr('pattern'));
    }
    else {
        $('#txtPSWPattern').val('');
    }
    

    //Required
    openRequired('PSW', input);

    //Error message
    openMessage('PSW', input);

    //Style
    openStyle('PSW', input);

    $('#PSWModal').modal('toggle');
}

function deletePSW() {
    deleteItem();
    $('#PSWModal').modal('toggle');
}

function updatePSW() {

    var input = $('#' + lastItemId + ' input')[0];
    var valid = true;

    //Update Label
    updateLabel('PSW');

    //Update id if required
    if ($('#txtPSWName').val() != $('#oldPSWName').val()) {

        valid = updateName('PSW', input);
    }

    //Update Visibility
    updateVisible('PSW');

    //Update Placeholder
    updatePlaceholder('PSW', input);

    //Update Readonly    
    updateReadonly('PSW', input);

    //Update Pattern
    if ($('#txtPSWPattern').val().length) {
        $(input).attr('pattern', $('#txtPSWPattern').val());
    }
    else {
        $(input).removeAttr('pattern');
    }

    //Update Required
    updateRequired('PSW', input);

    //Update Style
    updateStyle('PSW', input);

    if (valid) {
        $('#PSWModal').modal('toggle');
    }
    else {
        alert('There is an error!');
    }
}

/*************************************
Radio section
**************************************/
function openRDOModal() {

    //Label
    var title = $('#' + lastItemId + ' legend');
    $('#txtRDOLabel').val($(title).text());

    //Name
    var fieldset = $('#' + lastItemId + ' fieldset')[0];
    openName('RDO', fieldset);

    //Visibility
    openVisibility('RDO');

    //Required (if one of checkbox is required all must have required
    var firstRDO = $('#' + fieldset.id + ' input:first:radio');

    if ($(firstRDO).prop('required') == true) {
        $('#cbRDORequried').prop('checked', true)
    }
    else {
        $('#cbRDORequried').prop('checked', false)
    }

    //Error message
    openMessage('RDO', fieldset);

    //Style all checbok has same classes
    $('#txtRDOStyle').val(firstRDO[0].className);

    //Selection
    if ($(fieldset).attr('data-selection') == 'single') {
        $('#rRDOSingle').attr('checked', true);
    }
    else {
        $('#rRDOMultiple').attr('checked', true);
    }
    

    //Get radios' properties and build a manager for them
    var str = "<table id='tRDORadios' class='table table-striped table-bordered' " + "BorderStyle='Solid' BorderWidth='2'><thead class='modal-label' ><tr><th></th><td>Label</th><th>Value</th><th>Tools</th></tr></thead><tbody>";

    var index = 0;

    $('#' + fieldset.id).find(':radio').each(function () {

        var label = $(this).parent().prev().children().eq(0)[0].innerHTML;
        str += addNewRow(index, label, $(this).attr('value'));
        index++;
    });

    str += "</tbody></table>";

    $('#dRDOTable').empty();

    $('#dRDOTable').append(str);

    $('#dRDOTable tbody').sortable();

    function addNewRow(index, label, value) {
        var row = "<tr id='" + (index + 100) + "'><td align='center'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span></td>" +
            "<td><input type='text' class='form-control' id='txtRDOLabel_" + (index + 100) + "' value='" + label + "' /></td>" +
            "<td><input type='text' class='form-control' id='txtRDOValue_" + (index + 100) + "' value='" + value + "' required/></td>" +
            "<td align='center'><span role='button' class='glyphicon glyphicon-trash btn btn-danger btn-xs ' onclick='removeThisRow(\"" + (index + 100) + "\")'></span></td></tr>";

        return row;
    }

    $('#RDOModal').modal('toggle');
}

function btnRDONewRow() {

    var max = parseInt($('#tRDORadios > tbody  > tr').sort(function (a, b) { return +a.id < +b.id })[0].id);
    var newRowHtml = "<tr id='" + (max + 1) + "'>" +
            "<td align='center'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span></td>" +
            "<td><input type='text' class='form-control' id='txtRDOLabel_" + (max + 1) + "' value='' /></td>" +
            "<td><input type='text' class='form-control' id='txtRDOValue_" + (max + 1) + "' value='' required/></td>" +
            "<td align='center'><span role='button' class='glyphicon glyphicon-trash btn btn-danger btn-xs ' onclick='removeThisRow(\"" + (max + 1) + "\")'></span></td></tr>";

    $('#tRDORadios tr:last').after(newRowHtml);
}

function deleteRDO() {
    deleteItem();
    $('#RDOModal').modal('toggle');
}

function updateRDO() {

    var fieldset = $('#' + lastItemId + ' fieldset')[0];
    var valid = true;

    //Check new radio table empty fields
    $('#tRDORadios input').each(function () {

        if ($(this).val().length <= 0) {
            if ($(this).attr('required')) {
                $(this).attr('placeholder', 'Value required');
                valid = false;
            }
        }
    });

    if (valid) {

        //Update Label
        var title = $('#' + lastItemId + ' legend');
        $(title).text($('#txtRDOLabel').val());

        //Update id if required
        if ($('#txtRDOName').val() != $('#oldRDOName').val()) {

            //Check id hasn't been used
            valid = updateName('RDO', fieldset);
        }

        //Update Visibility
        updateVisible('RDO');

        //Selection
        var single = true;
        if ($('#rRDOSingle').prop('checked') == true) {
            $(fieldset).attr('data-selection', 'single');
        }
        else {
            $(fieldset).attr('data-selection', 'multiple');
            single = false;
        }

        //Remove IDs first
        removeAllChildren(fieldset.id);
        $('#' + fieldset.id).empty();

        var str = '<legend>' + $('#txtRDOLabel').val() + '</legend>';

        $('#tRDORadios > tbody  > tr').each(function (i) {

            var e = $(this);
            str += '<div class="col-sm-12"><div class="col-sm-6"><label class="control-label">' + $(e[0].childNodes[1]).children().val() + '</label></div><div class="col-sm-6"><input id="########" type="radio"';
            
            if (single) {
                str += ' name="name_' + $('#txtRDOName').val();
            }
            else {
                str += ' name="name_' + $('#txtRDOName').val() + i;
            }

            str += '" value="' + $(e[0].childNodes[2]).children().val() + '"';

            if ($('#cbRDORequried').prop('checked') == true) {
                str += ' required';

                //Error message
                $(fieldset).attr('oninvalid', "this.setCustomValidity('" + $('#txtRDOMessage').val() + "')");
            }
            else {

                //Error message
                $(fieldset).removeAttr('oninvalid');
            }

            if ($('#txtRDOStyle').val().length) {
                str += ' class="' + $('#txtRDOStyle').val() + '" ';
            }

            str += '/></div></div>';
        });

        while (str.includes('########')) {
            str = str.replace('########', getGuID('rdo'));
        }

        //console.log(str);
        $('#' + fieldset.id).append(str);

        if (valid) {
            $('#RDOModal').modal('toggle');
        }
        else {
            alert('There is an error in them form!')
        }
    }
    else {
        alert('Something missing!');
    }   
}

/*************************************
Select section
**************************************/
function openSLModal() {

    var input = $('#' + lastItemId + ' select')[0];

    //Label
    openLabel('SL');

    //Name    
    openName('SL', input);

    //Visibility
    openVisibility('SL');

    //Placeholder
    if ($('#' + input.id).attr('data-default-type') == 'placeholder') {
        $('#txtSLPlaceholder').val($('#' + input.id).attr('data-default-text'));
    }
    else {
        $('#txtSLPlaceholder').val('');
    }    
        
    //Readonly
    openReadonly('SL', input);

    //Required
    openRequired('SL', input);

    //Error message
    openMessage('SL', input);

    //Style
    openStyle('SL', input);

    //Get radios' properties and build a manager for them
    var str = "<table id='tSLSelect' class='table table-striped table-bordered' " + "BorderStyle='Solid' BorderWidth='2'><thead class='modal-label' ><tr><th></th><td>Label</th><th>Value</th><th>Default</th><th>Tools</th></tr></thead><tbody>";

    var index = 0;

    $('#' + input.id + ' option').each(function () {

        if ($(this).val().length) {
            str += addNewRow(index, $(this).text(), $(this).val());
            index++;
        }        
    });

    str += "</tbody></table>";

    $('#dSLTable').empty();

    $('#dSLTable').append(str);

    $('#dSLTable tbody').sortable();

    function addNewRow(index, label, value) {
        var row = "<tr id='" + (index + 200) + "'><td align='center'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span></td>" +
            "<td><input type='text' class='form-control' id='txtSLLabel_" + (index + 200) + "' value='" + label + "' /></td>" +
            "<td><input type='text' class='form-control' id='txtSLValue_" + (index + 200) + "' value='" + value + "' required/></td>" +
            "<td align='center'><input type='radio' name='name_RD_" + input.id + "' id='rSLDefault_" + (index + 200) + "' value='" + label + "' /></td>" +
            "<td align='center'><span role='button' class='glyphicon glyphicon-trash btn btn-danger btn-xs ' onclick='removeThisRow(\"" + (index + 200) + "\")'></span></td></tr>";

        return row;
    }

    //If default is an option
    if ($('#' + input.id).attr('data-default-type') == 'option') {
        var radio = $('#tSLSelect :radio[value="' + $('#' + input.id).attr('data-default-text') + '"]')[0];
        $(radio).attr('checked', true);
    }

    $('#SLModal').modal('toggle');
}

function btnSLNewRow() {

    var input = $('#' + lastItemId + ' select')[0];

    var max = parseInt($('#tSLSelect > tbody  > tr').sort(function (a, b) { return +a.id < +b.id })[0].id);
    var newRowHtml = "<tr id='" + (max + 1) + "'>" +
            "<td align='center'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span></td>" +
            "<td><input type='text' class='form-control' id='txtSLLabel_" + (max + 1) + "' value='' /></td>" +
            "<td><input type='text' class='form-control' id='txtSLValue_" + (max + 1) + "' value='' required/></td>" +
            "<td align='center'><input type='radio' name='name_RD_" + input.id + "' id='rSLDefault_" + (max + 1) + "' value='" + (max + 1) + "' /></td>" +
            "<td align='center'><span role='button' class='glyphicon glyphicon-trash btn btn-danger btn-xs ' onclick='removeThisRow(\"" + (max + 1) + "\")'></span></td></tr>";

    $('#tSLSelect tr:last').after(newRowHtml);
}

function deleteSL() {
    deleteItem();
    $('#SLModal').modal('toggle');
}

function updateSL() {

    var input = $('#' + lastItemId + ' select')[0];
    var valid = true;

    //Update Label
    updateLabel('SL');

    //Update id if required
    if ($('#txtSLName').val() != $('#oldSLName').val()) {

        valid = updateName('SL', input);
    }

    //Update Visibility
    updateVisible('SL');    

    //Update Required
    updateRequired('SL', input);

    //Update Style
    updateStyle('SL', input);

    //Update Options

    //Remove all options
    $('#' + input.id).empty();

    //UpdatePlaceholder
    if ($('#txtSLPlaceholder').val().length) {
        $('#' + input.id).append($('<option>', { value: '', text: $('#txtSLPlaceholder').val() }));
        $('#' + input.id + ' option').attr('disabled', true);
        $('#' + input.id + ' option').attr('selected', true);

        $('#' + input.id).attr('data-default-type', 'placeholder'); 
        $('#' + input.id).attr('data-default-text', $('#txtSLPlaceholder').val());
    }
    else {
        $('#' + input.id).attr('data-default-type', 'option');
    }

    //Add options
    $('#tSLSelect > tbody  > tr').each(function (i) {

        var e = $(this);
        $('#' + input.id).append($('<option>', { value: $(e[0].childNodes[2]).children().val(), text: $(e[0].childNodes[1]).children().val() }));
    });


    //If placeholder empty set default option
    if ($('#' + input.id).attr('data-default-type') == 'option') {

        $('#' + input.id).attr('data-default-text', ''); //If default radio doesn't checked

        $('#tSLSelect > tbody  > tr').each(function (i) {

            var e = $(this);
            if ($(e[0].childNodes[3]).children().prop('checked')) {
                $('#' + input.id + ' option[value="' + $(e[0].childNodes[2]).children().val() + '"]').attr('selected', true);
                $('#' + input.id).attr('data-default-text', $(e[0].childNodes[1]).children().val());
            }
        });
    }    

    if (valid) {
        $('#SLModal').modal('toggle');
    }
    else {
        alert('There is an error!');
    }
    
}

/*************************************
Text section
**************************************/

function openTXTModal() {

    var input = $('#' + lastItemId + ' input')[0];

    //Label
    openLabel('TXT');

    //Name    
    openName('TXT', input);

    //Visibility
    openVisibility('TXT');

    //Placeholder
    openPlaceholder('TXT', input);

    //Readonly
    openReadonly('TXT', input);

    //Required
    openRequired('TXT', input);

    //Error message
    openMessage('TXT', input);

    //Style
    openStyle('TXT', input);

    $('#TXTModal').modal('toggle');
}

function deleteTXT() {
    deleteItem();
    $('#TXTModal').modal('toggle');
}

function updateTXT() {

    var input = $('#' + lastItemId + ' input')[0];
    var valid = true;

    //Update Label
    updateLabel('TXT');

    //Update id if required
    if ($('#txtTXTName').val() != $('#oldTXTName').val()) {

        valid = updateName('TXT', input);
    }

    //Update Visibility
    updateVisible('TXT');

    //Update Placeholder
    updatePlaceholder('TXT', input);

    //Update Readonly
    updateReadonly('TXT', input);

    //Update Required
    updateRequired('TXT', input);

    //Update Style
    updateStyle('TXT', input);

    if (valid) {
        $('#TXTModal').modal('toggle');
    }
    else {
        alert('There is an error!');
    }    
}


/*************************************
Textarea section
**************************************/

function openTXAModal() {

    var input = $('#' + lastItemId + ' textarea')[0];

    //Label
    openLabel('TXA');

    //Name    
    openName('TXA', input);

    //Visibility
    openVisibility('TXA');

    //Placeholder
    openPlaceholder('TXA', input);

    //Readonly
    openReadonly('TXA', input);

    //Required
    openRequired('TXA', input);

    //Error message
    openMessage('TXA', input);

    //Rows
    $('#txtTXARows').val($(input).attr('rows'));

    //Cols
    $('#txtTXACols').val($(input).attr('cols'));

    //Max length
    $('#txtTXAMaxLength').val($(input).attr('maxlength'));

    //Style
    openStyle('TXA', input);

    $('#TXAModal').modal('toggle');
}

function deleteTXA() {
    deleteItem();
    $('#TXAModal').modal('toggle');
}

function updateTXA() {

    var input = $('#' + lastItemId + ' textarea')[0];
    var valid = true;

    //Update  Label
    updateLabel('TXA');

    //Update id if required
    if ($('#txtTXAName').val() != $('#oldTXAName').val()) {

        valid = updateName('TXA', input);
    }

    //Update Visibility
    updateVisible('TXA');

    //Update Placeholder
    updatePlaceholder('TXA', input);

    //Update Readonly
    updateReadonly('TXA', input);

    //Update Required
    updateRequired('TXA', input);

    //Update Rows
    $(input).attr('rows', $('#txtTXARows').val());

    //Update Cols
    $(input).attr('cols', $('#txtTXACols').val());

    //Update Max length
    $(input).attr('maxlength', $('#txtTXAMaxLength').val());

    //Update Style
    updateStyle('TXA', input);

    if (valid) {
        $('#TXAModal').modal('toggle');
    }
    else {
        alert('There is an error!');
    }    
}