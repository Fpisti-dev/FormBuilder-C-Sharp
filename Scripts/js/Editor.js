var ranGuID = [];
var activePage = 'page_first';
var actualPage = '';
var pageNum = 1;

var intro = '<div id="@#######" data-visible="true" class="items col-sm-12 ui-sortable"><div><span><img id="img_vis_@#######" src="/Images/visible-item.png" style="float: left; padding: 2px;"></span></div><br />'

// first div closed when added options image
var defaultTags = {
    autocomplete: intro + '<div class="col-sm-4"><label class="control-label">Label</label></div><div class="col-sm-8"><input id="########" class="form-control" type="text" placeholder="autocomplete" data-source="list"/><script  id="########">var x = "";</script></div>',
    checkbox: intro + '<div class="col-sm-4"><label class="control-label">Label</label></div><div class="col-sm-8"><input id="########" type="checkbox" name="checkbox" value="True">',
    checkboxgroup: intro + '<fieldset id="########" class="btn-group"><legend>Title</legend><div class="col-sm-12"><div class="col-sm-6"><label class="control-label">Label 1</label></div><div class="col-sm-6"><input id="########" type="checkbox" name="checkbox1" value="One" /></div></div><div class="col-sm-12"><div class="col-sm-6"><label class="control-label">Label 2</label></div><div class="col-sm-6"><input id="########" type="checkbox" name="checkbox1" value="Two" /></div></div><div class="col-sm-12"><div class="col-sm-6"><label class="control-label">Label 3</label></div><div class="col-sm-6"><input id="########" type="checkbox" name="checkbox1" value="Three" /></div></div></fieldset>',
    date: intro + '<div class="col-sm-4"><label class="control-label">Label</label></div><div class="col-sm-8"><div class="input-group date" data-provide="datepicker"><input id="########" type="text" class="form-control" data-format="dd/mm/yy" placeholder="dd/mm/yyyy" ></div><script>$( function() { $( "#datepicker" ).datepicker(); } );</script>',
    file: intro + '<div class="col-sm-4"><label class="control-label">Label</label></div><div class="col-sm-8"><input class="form-control" id="########" type="file"></div>',
    password: intro + '<div class="col-sm-4"><label class="control-label">Label</label></div><div class="col-sm-8"><input id="########" class="form-control" type="password" placeholder="password"/></div>',
    number: intro + '<div class="col-sm-4"><label class="control-label">Label</label></div><div class="col-sm-8"><input id="########" class="form-control" type="number" placeholder="25"/></div>',
    radio: intro + '<fieldset id="########" class="btn-group" data-selection="single" ><legend>Title</legend><div class="col-sm-12"><div class="col-sm-6"><label class="control-label">Yes</label></div><div class="col-sm-6"><input id="########" type="radio" name="radios" value="yes"></div></div><div class="col-sm-12"><div class="col-sm-6"><label class="control-label">No</label></div><div class="col-sm-6"><input id="########" type="radio" name="radios" value="no"></div></div></fieldset>',
    select: intro + '<div class="col-sm-4"><label>Label</label></div><div class="col-sm-8"><select class="form-control" id="########" data-default-type="placeholder" data-default-text="Select something..." ><option value="" disabled selected>Select something...</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option></select></div>',
    text: intro + '<div class="col-sm-4"><label class="control-label">Label</label></div><div class="col-sm-8"><input id="########" class="form-control" type="text" placeholder="text"/></div>',
    textarea: intro + '<div class="col-sm-4"><label class="control-label">Label</label></div><div class="col-sm-8"><textarea id="########" class="form-control" rows="4"></textarea></div>',

    button: intro + '<button id="########" type="button" class="btn btn-primary">Button</button>',
    hidden: intro + '<label class="control-label">Hidden</label><input id="########" type="hidden" name="hidden" value="value">',
    html: intro + '<div id="########"><h3>HTML</h3></div>',
    label: intro + '<label id="########" class="control-label">Label</label>',
    spacer: intro + '<spacer id="########" type="block" width="20" height="5"></spacer>',
    table: intro + '<table id="########" style="width:100%"><tr><th>Firstname</th><th>Lastname</th><th>Age</th></tr><tr><td>Jill</td><td>Smith</td><td>50</td></tr><tr><td>Eve</td><td>Jackson</td><td>94</td></tr><tr><td>John</td><td>Doe</td><td>80</td></tr></table>'
};

var preFixes = {
    autocomplete: 'ac',
    checkbox: 'cb',
    checkboxgroup: 'cbg',
    date: 'date',
    file: 'file',
    password: 'psw',
    number: 'num',
    radio: 'rdo',
    select: 'sl',
    text: 'txt',
    textarea: 'txa',
    button: 'btn',
    hidden: 'hf',
    html: 'html',
    label: 'lbl',
    spacer: 'spc',
    table: 'tbl'
};

function itemOption(i, t) {
    //console.log(i);
    //console.log(t);

    lastItemId = i;

    //get item visibility and set to checkbox before open it
    var element = document.getElementById(i);

    if (element.getAttribute('data-visible') == 'true') {
        $('#cb' + preFixes[t].toUpperCase() + 'Visible').prop('checked', true);
    }
    else {
        $('#cb' + t.toUpperCase() + 'Visible').prop('checked', false);
    }

    switch (t) {
        case 'autocomplete':
            openACModal();
            break;
        case 'checkbox':
            openCBModal();
            break;
        case 'checkboxgroup':
            openCBGModal();
            break;
        case 'date':
            openDATEModal();
            break;
        case 'file':
            openFILEModal();
            break;
        case 'password':
            openPSWModal();
            break;
        case 'number':
            openNUMModal();
            break;
        case 'radio':
            openRDOModal();
            break;
        case 'radiogroup':
            openRDGModal();
            break;
        case 'select':
            openSLModal();
            break;
        case 'text':
            openTXTModal();
            break;
        case 'textarea':
            openTXAModal();
            break;
        case 'button':
            openBTNModal();
            break;
        case 'hidden':
            openHFModal();
            break;
        case 'html':
            openHtmlModal();
            break;
        case 'label':
            openLBLModal();
            break;
        case 'spacer':
            openSPCModal();
            break;
        case 'table':
            openTBLModal();
    }
}

var droppableOptions = {
    accept: '.draggable-item',
    classes: {
        "ui-droppable-hover": "ui-state-hover",
        "ui-droppable-active": "ui-state-default"
    },
    drop: function (event, ui) {
        //console.log(event);
        //console.log(ui);
        //console.log(this);
        var newItem = $(ui.draggable).clone();
        var data = newItem[0].attributes[0];
        var dataType = data.value;
        var itemID = getGuID('item');

        var response = defaultTags[dataType];

        while (response.includes('@#######')) {
            response = response.replace('@#######', itemID);
        }

        response += '<br /> <span> <img id="img_' + itemID + '" title="Click to configure item" onclick=itemOption("' + itemID + '","' + dataType + '") src="/Images/item-opt.png" style="float: right; padding: 2px;"> </span> </div>';

        while (response.includes('########')) {
            response = response.replace('########', getGuID(preFixes[dataType]));
        }

        $(this).append(response);

        $('#' + itemID).sortable({ placeholder: "ui-state-highlight", cursor: "move" });
    }
}


var eStyling = CodeMirror.fromTextArea(document.getElementById("taStyling"), {
    theme: 'default',
    lineWrapping: false,
    mode: 'css',
    autoRefresh: true,
    lineNumbers: true,
    viewportMargin: Infinity,
    autofocus: true
});

var eScripting = CodeMirror.fromTextArea(document.getElementById("taScripting"), {
    theme: 'default',
    lineWrapping: false,
    mode: 'javascript',
    autoRefresh: true,
    lineNumbers: true,
    viewportMargin: Infinity,
    autofocus: true
});
var ePagesSource = CodeMirror.fromTextArea(document.getElementById("taPagesSource"), {
    theme: 'default',
    lineWrapping: false,
    mode: 'htmlmixed',
    autoRefresh: true,
    lineNumbers: true,
    viewportMargin: Infinity,
    autofocus: true
});

var eDesignerSource = CodeMirror.fromTextArea(document.getElementById("taDesignerSource"), {
    theme: 'default',
    lineWrapping: false,
    mode: 'htmlmixed',
    smartIndent: false,
    autoRefresh: true,
    lineNumbers: true,
    viewportMargin: Infinity,
    autofocus: true
});

function makeNewDroppableLayout(ui) {

    var newBox = $(ui.draggable).clone();
    //newBox.removeClass('draggable-layout ui-draggable ui-draggable-handle ui-sortable-handle');
    //newBox.addClass('sortable');
    var id = getGuID('layout');
    newBox[0].setAttribute('id', id);
    newBox.removeClass('draggable-layout ui-draggable ui-draggable-handle');
    newBox[0].setAttribute('title', '');
    newBox[0].setAttribute('data-visible', 'true');
    var visibleIMG = '<span> <img  id="img_vis_' + id + '" src="/Images/visible.png" style="float: left; padding: 2px;"> </span> </div> <br />';
    newBox.prepend(visibleIMG);

    var optionIMG = '<br /> <span><img  id="img_' + id + '" title="Click to configure layout" onclick=layoutClick("' + id + '") src="/Images/layout-opt.png" style="float: right; padding: 2px;"> </span> </div>';
    newBox.append(optionIMG);

    $('#' + activePage).append(newBox);

    var dropBox = $('.drop', newBox);
    console.log(dropBox);

    dropBox.addClass('droppable-for-items');
    dropBox.droppable(droppableOptions);
    dropBox.sortable({ placeholder: "ui-state-highlight box", cursor: "move" });
}

function getGuID(prefix) {

    var guid = prefix + '_' + guidGenerator();

    while (ranGuID.indexOf(guid) != -1) {
        guid = prefix + '_' + guidGenerator();
    }

    //console.log(guid);
    ranGuID.push(guid);
    return guid
}

function guidGenerator() {
    var S4 = function () {
        return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
    };
    return (S4() + S4());
}

function idChecker(newID, oldID) {

    var bUpdated = false;

    if (ranGuID.indexOf(newID) == -1) {

        //Update old item id array
        var index = ranGuID.indexOf(oldID);
        if (index !== -1) { ranGuID[index] = newID; }

        //Update id
        $('#' + oldID).attr('id', newID);
        bUpdated = true;

    }
    else {
        alert('This ID is exist. Please enter another ID?');
    }

    return bUpdated;
}

$(document).ready(function () {


    $('#page_last').hide(); //todo hide all pages except fisrt!

    //first and last page id not editable, but have to add to id array
    ranGuID.push('page_first');
    ranGuID.push('page_last');
   
    $('.draggable-layout').draggable({
        cursor: 'move',
        helper: 'clone',
        start: function (event, ui) {
            $(ui.helper).css('width', "150%");
        },
        stop: function (event, ui) {
            $(ui.helper).css('width', "100%");
        }
    });

    $(".draggable-item").draggable({
        cursor: "move",
        helper: "clone"
    });     

    SetDroppablePages();
    SetSortable();

    var fID = $.urlParam('fID'); //without spaces
    var id = decodeURIComponent($.urlParam('fID')) //with spaces

    LoadFormByName(id);   

});

function stylingClick() {

    eStyling.setValue(($('#hfStyling').val()));

    $('#StylingModal').modal('toggle');
}

function scriptingClick() {

    eScripting.setValue(($('#hfScripting').val()));

    $('#ScriptingModal').modal('toggle');
}

function resourcesClick() {
    var aStyles = $('#hfResourcesStyle').val().split('|');
    var aScripts = $('#hfResourcesScript').val().split('|');

    //Get Styles table
    var str = "<table id='tResourcesStyle' class='table table-striped table-bordered' " + "BorderStyle='Solid' BorderWidth='2'><thead class='modal-label' ><tr><th></th><td>Style</th><th>Tools</th></tr></thead><tbody>";  

    $.each(aStyles, function (i, e) {

        str += addNewStyleRow(i, e);
    });

    str += "</tbody></table>";

    $('#dResourcesStyle').empty();

    $('#dResourcesStyle').append(str);

    $('#tResourcesStyle tbody').sortable();

    function addNewStyleRow(index, value) {
        var row = "<tr id='" + index + "'><td align='center'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span></td>" + 
            "<td><input type='text' class='form-control' id='txtResourcesStyle_" + index + "' value='" + value + "' /></td>" +
            "<td align='center'><span role='button' class='glyphicon glyphicon-trash btn btn-danger btn-xs ' onclick='removeThisRow(\"" + index + "\")'></span></td></tr>";

        return row;
    }

    //Get Scripts table
    var str = "<table id='tResourcesScript' class='table table-striped table-bordered' " + "BorderStyle='Solid' BorderWidth='2'><thead class='modal-label' ><tr><th></th><td>Script</th><th>Tools</th></tr></thead><tbody>";

    $.each(aScripts, function (i, e) {

        str += addNewScriptRow(i + 100, e);
    });

    str += "</tbody></table>";

    $('#dResourcesScript').empty();

    $('#dResourcesScript').append(str);

    $('#tResourcesScript tbody').sortable();

    function addNewScriptRow(index, value) {
        var row = "<tr id='" + index + "'><td align='center'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span></td>" +
            "<td><input type='text' class='form-control' id='txtResourcesScript_" + index + "' value='" + value + "' /></td>" +
            "<td align='center'><span role='button' class='glyphicon glyphicon-trash btn btn-danger btn-xs ' onclick='removeThisRow(\"" + index + "\")'></span></td></tr>";

        return row;
    }

    $('#ResourcesModal').modal('toggle');
}

function btnResourcesStyleNewRow() {
    var max = 0;

    try{
        max = parseInt($('#tResourcesStyle > tbody  > tr').sort(function (a, b) { return +a.id < +b.id })[0].id);
    }
    catch(err){

    }
    
    var newRowHtml = "<tr id='" + (max + 1) + "'>" +
            "<td align='center'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span></td>" +
            "<td><input type='text' class='form-control' id='txtResourcesStyle_" + (max + 1) + "' value='' /></td>" +
            "<td align='center'><span role='button' class='glyphicon glyphicon-trash btn btn-danger btn-xs ' onclick='removeThisRow(\"" + (max + 1) + "\")'></span></td></tr>";

    $('#tResourcesStyle tbody').append(newRowHtml);
}

function btnResourcesScriptNewRow() {
    var max = 100;

    try {
        max = parseInt($('#tResourcesScript > tbody  > tr').sort(function (a, b) { return +a.id < +b.id })[0].id);
    }
    catch (err) {

    }

    var newRowHtml = "<tr id='" + (max + 1) + "'>" +
            "<td align='center'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span></td>" +
            "<td><input type='text' class='form-control' id='txtResourcesStyle_" + (max + 1) + "' value='' /></td>" +
            "<td align='center'><span role='button' class='glyphicon glyphicon-trash btn btn-danger btn-xs ' onclick='removeThisRow(\"" + (max + 1) + "\")'></span></td></tr>";

    $('#tResourcesScript tbody').append(newRowHtml);
}

function sourceClick() {    

    //Pages div
    var str = $('#dPages').html();

    ePagesSource.setValue(str);
    CodeMirror.commands["selectAll"](ePagesSource);
    ePagesSource.autoFormatRange(ePagesSource.getCursor(true), ePagesSource.getCursor(false));
    ePagesSource.setCursor(0);

    //Designer div
    var str2 = $('#dDesigner').html();

    eDesignerSource.setValue(str2);

    CodeMirror.commands["selectAll"](eDesignerSource);
    eDesignerSource.autoFormatRange(eDesignerSource.getCursor(true), eDesignerSource.getCursor(false));
    eDesignerSource.setCursor(0);

    $('#SourcesModal').modal('toggle');
}

function updateStyling() {
    $('#hfStyling').val(eStyling.getValue());
    $('#StylingModal').modal('toggle');
}

function updateScripting() {
    $('#hfScripting').val(eScripting.getValue());
    $('#ScriptingModal').modal('toggle');
}


function updateResources() {

    var sStyles = '';

    //Get inputs from table
    $('#tResourcesStyle input').each(function () {
        if ($($(this)[0]).val().length > 0) {
            sStyles += $(this).val() + '|';
        }
    });

    sStyles = sStyles.substring(0, sStyles.length - 1); //remove last |

    $('#hfResourcesStyle').val(sStyles);

    var sScripts = '';

    //Get inputs from table
    $('#tResourcesScript input').each(function () {
        if ($($(this)[0]).val().length > 0) {
            sScripts += $(this).val() + '|';
        }
    });

    sScripts = sScripts.substring(0, sScripts.length - 1); //remove last |

    $('#hfResourcesScript').val(sScripts);

    $('#ResourcesModal').modal('toggle');
}

function updateSources() {

    var sPages = ePagesSource.getValue();
    //console.log(sPages);
    $('#dPages').empty().append(sPages);

    var sDesigner = eDesignerSource.getValue();
    //console.log(sDesigner);
    $('#dDesigner').empty().append(sDesigner);

    $('#SourcesModal').modal('toggle');
}

function newPage() {
    //var pn = ($('#uPages li').length) - 1;
    ranGuID.push('page_' + pageNum);

    console.log('New page number: ' + pageNum);

    //"last_page" link id 
    $('#page_link_last').before('<li id="link_page_' + pageNum + '" class="list-group-item ui-sortable" style="text-align: center;" data-div="page_'
        + pageNum + '" onclick="pageClick(\'page_' + pageNum + '\')">Page ' + pageNum
        + '<span role="button" class="glyphicon glyphicon-pencil btn btn-primary btn-xs pull-right" onclick="pageDetails(\'page_'
        + pageNum + '\')"></span><span><img  id="img_vis_page_' + pageNum
        + '" src="/Images/visible-page.png" style="float: left; margin-top: -0.5em; margin-left: -0.5em" /></span></li>');

    //"page_last" div id
    $('#page_last').before('<div id="page_' + pageNum + '" data-title="Page ' + pageNum + '"></div>');

    pageNum++;

};

function pageDetails(p) {

    actualPage = p;
    $('#txtEditPageID').val(p);

    //first and last page id readonly
    if (p == 'page_first' || p == 'page_last') {
        $('#txtEditPageID').attr('readonly', true);
        //$('#txtEditPageTitle').attr('readonly', true);
        $('#btnDeletePage').hide();
    }
    else {
        $('#txtEditPageID').attr('readonly', false);
        $('#btnDeletePage').show();
    }
    
    $('#txtEditPageTitle').val($('#link_' + actualPage).text());

    //Get Visibility
    var bVisible = ($('#' + actualPage).attr('data-visible'));

    if (bVisible == 'true') {
        $('#slbVisiblePage').val('YES');
    }
    else {
        $('#slbVisiblePage').val('NO');
    }

    $('#PagesModal').modal('toggle');
};

function pageClick(p) {

    if (activePage != p)
    {
        var title = $('#' + p).attr('data-title');
        $('#pageTitle').text(title);
        $('#' + activePage).hide();
        activePage = p;
        $('#' + activePage).show();
    }    
};

function deletePage() {
    console.log('Delete: ' + actualPage);

    //delete children ids
    removeAllChildren(actualPage);

    //delete link
    $('#link_' + actualPage).remove();    

    //delete page
    $('#' + actualPage).remove();

    //remove name from ID array
    var index = ranGuID.indexOf(actualPage);
    if (index > -1) {
        ranGuID.splice(index, 1);
    }

    //go to first page
    var title = $('#page_first').attr('data-title');
    $('#pageTitle').text(title);
    $('#page_first').show();
    actualPage = 'page_first';

    $('#PagesModal').modal('toggle');
};

function updatePage() {

    //Update ID
    console.log('Update: link_' + actualPage);
    var oldID = actualPage;
    var newID = $('#txtEditPageID').val();

    if (newID != oldID) {

        //Page id changed
        if (idChecker(newID, oldID)) {

            //Change page link id and onclick
            $('#link_' + oldID).attr('id', 'link_' + newID);
            $('#link_' + newID).attr('onclick', 'pageClick(\'' + newID + '\')');
        }
    }

    //Update page name
    var str = '<span role="button" class="glyphicon glyphicon-pencil btn btn-primary btn-xs pull-right" onclick="pageDetails(\'' + newID + '\')"></span><span><img  id="img_vis_' + newID + '" src="/Images/visible-page.png" style="float: left; margin-top: -0.5em; margin-left: -0.5em" /></span>';

    //Change title in page link
    $('#link_' + newID).html($('#txtEditPageTitle').val() + str);

    //Change title in div data
    $('#' + newID).attr('data-title', $('#txtEditPageTitle').val());

    //Change title in designer header
    $('#pageTitle').text($('#txtEditPageTitle').val());

    //Update visibility
    var page = document.getElementById(newID);
    var imgVis = document.getElementById('img_vis_' + newID);
    var link = document.getElementById('link_' + newID);

    if ($('#slbVisiblePage').val() == 'YES') {
        imgVis.setAttribute('src', '/Images/visible-page.png');
        page.setAttribute('data-visible', 'true');
        link.setAttribute('data-visible', 'true');
    }
    else {
        imgVis.setAttribute('src', '/Images/invisible-page.png');
        page.setAttribute('data-visible', 'false');
        link.setAttribute('data-visible', 'false');
    }

    $('#PagesModal').modal('toggle');
};


function removeAllChildren(r) {

    //get all id
    var arr = $.map($('#' + r + ' [id]'), function (n, i) {
        return n.id;
    });

    //console.log(JSON.stringify(arr));

    arr.forEach(function (id) {
        //remove all children
        var index = ranGuID.indexOf(id);
        if (index > -1) {
            ranGuID.splice(index, 1);
        }
    });
};

function btnLoadForm_Click() {
    console.log('load');
    var fID = $.urlParam('fID'); //without spaces
    var id = decodeURIComponent($.urlParam('fID')) //with spaces

    LoadFormByName(id);
};

function LoadFormByName(sFormName) {

    $.ajax({
        method: "POST",
        url: "../Handlers/LoadFormByName.ashx",
        dataType: "json",
        async: true,
        data: {
            FormName: sFormName
        },
        success: function (result) {
            switch (result.code) {
                case "OK":

                    if (result.data.Pages) {
                        //empty pages and designer and add results
                        $('#dPages').empty().html(result.data.Pages);
                        $('#dDesigner').empty().html(result.data.Designer);

                        //hide all pages
                        $('#uPages li').each(function () {
                            var pageID = (this.id).replace('link_', '');
                            $('#' + pageID).hide();
                        });

                        //set first page to activ and shows it
                        activePage = 'page_first';
                        $('#' + activePage).show();
                        $('#pageTitle').text($('#' + activePage).attr('data-title'));


                        //get highest page id number
                        pageNum = 0;
                        $('#dPages li').each(function () {
                            var id = this.id.split('_');
                            if (parseInt(id[2]) > pageNum) {
                                pageNum = (parseInt(id[2]) + 1);
                            }
                        });   


                        console.log('Loaded page number: ' + pageNum);

                        //set sortable elements
                        SetSortable();

                        //set droppable elements
                        SetDroppablePages();
                        SetDroppableLayouts();

                        //get all ID and add to array
                        $('#dPages [id]').each(function () { //Get elements that have an id=
                            ranGuID.push($(this).attr("id")); //add id to array
                        });

                        $('#dDesigner [id]').each(function () { //Get elements that have an id=
                            ranGuID.push($(this).attr("id")); //add id to array
                        });

                        $('#hfStyling').val(result.data.Styling);
                        $('#hfScripting').val(result.data.Scripting);
                        $('#hfResourcesStyle').val(result.data.ResourcesStyle);
                        $('#hfResourcesScript').val(result.data.ResourcesScript);
                    }
                    else {
                        alert("This form hasn't saved yet!");
                    }
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
    });
};

function btnSubmitForm_Click() {
    //do nothing
};

function SetSortable() {

    //restore pages
    $('#uPages').sortable({
        classes: {
            "ui-sortable": "highlight"
        },
        cursor: "move",
        items: "> .ui-sortable",
        placeholder: "ui-state-highlight box",
        stop: function (event, ui) {
            var div = $('#' + ui.item[0].id).attr('data-div');
            var i = ui.item.index(); //li new index
            var oi = $('#' + div).index(); //div original index
            if (oi > i) { //move up
                $('#' + div).insertBefore($('#droppable').children().eq(i));
            }
            else { //move down
                $('#' + div).insertAfter($('#droppable').children().eq(i));
            }
        }
    });

    //take layouts to sortable in pages
    $('#droppable').sortable({
        classes: {
            "ui-sortable": "highlight"
        },
        cursor: "move",
        items: ".area",
        placeholder: "ui-state-highlight box"
    });

    //take items to sortable in layouts
    $('.droppable-for-items').sortable({
        classes: {
            "ui-sortable": "highlight"
        },
        cursor: "move",
        items: ".items",
        placeholder: "ui-state-highlight box"
    });
};

function  SetDroppablePages() {

    //set pages droppable for layouts
    $("#droppable").droppable({
        accept: '.draggable-layout',
        classes: {
            "ui-droppable-hover": "ui-state-hover",
            "ui-droppable-active": "ui-state-default"
        },
        drop: function (event, ui) {
            console.log(ui);
            makeNewDroppableLayout(ui);
        }
    });   
};

function SetDroppableLayouts() {

    //set layouts droppable for items
    $('.droppable-for-items').droppable(droppableOptions);       
}

function btnSaveForm_Click() {
    console.log('save');
    var fID = $.urlParam('fID'); //without spaces
    var id = decodeURIComponent($.urlParam('fID')) //with spaces

    var pageHTML = $('#dPages').html();
    pageHTML = pageHTML.replace(/\n|\r/g, ""); //remove line breaks
    pageHTML = pageHTML.replace(/\s+/g, " "); //remove white spaces
    //pageHTML = JSON.stringify(pageHTML);
    //console.log(pageHTML);

    var designerHTML = $('#dDesigner').html();
    designerHTML = designerHTML.replace(/\n|\r/g, ""); //remove line breaks
    designerHTML = designerHTML.replace(/\s+/g, " "); //remove white spaces
    //designerHTML = JSON.stringify(designerHTML);
    //console.log(designerHTML);

    var sStyling = $('#hfStyling').val();
    var sScripting = $('#hfScripting').val();
    var sResourcesStyle = $('#hfResourcesStyle').val();
    var sResourcesScript = $('#hfResourcesScript').val();

    $.ajax({
        method: "POST",
        url: "../Handlers/SaveFormByName.ashx",
        dataType: "json",
        async: true,
        data: {
            FormName: id,
            Pages: pageHTML,
            Designer: designerHTML,
            Styling: sStyling,
            Scripting: sScripting,
            ResourcesStyle: sResourcesStyle,
            ResourcesScript: sResourcesScript
        },
        success: function (result) {
            switch (result.code) {
                case "OK":
                    alert("Successfully saved to database!");                    
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
    });
};

function btnPreviewForm_Click() {
    console.log('preview');
    var fID = $.urlParam('fID'); //without spaces
    var id = decodeURIComponent($.urlParam('fID')); //with spaces
    window.open('/Preview.aspx?fID=' + fID, '_blank');
};

function btnLaunchForm_Click() {
    console.log('launch');
    var fID = $.urlParam('fID'); //without spaces
    var id = decodeURIComponent($.urlParam('fID')); //with spaces
    window.open('/Form.aspx?fID=' + fID, '_blank');
};

function btnExitForm_Click() {
    console.log('exit');
    window.location.replace("/Home.aspx");
};

function btnSubmit_Click() {
    //do nothing in editor
};

$.urlParam = function (name) {
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results == null) {
        return null;
    }
    else {
        return results[1] || 0;
    }
}




