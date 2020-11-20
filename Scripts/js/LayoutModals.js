var lastItemId = '';


function layoutClick(l) {
    console.log(l);
    $('#txtEditLayout').val(l);
    $('#oldLayoutID').val(l);

    var element = document.getElementById(l);

    if (element.getAttribute('data-visible') == 'true') {
        $('#slbVisibleLayout').val('YES');
    }
    else {
        $('#slbVisibleLayout').val('NO');
    }

    $('#LayoputsModal').modal('toggle');
};

function deleteLayout() {;
    var oldL = $('#oldLayoutID').val();

    //remove layout's children ids 
    removeAllChildren(oldL);

    //remove layout name from ID array
    var index = ranGuID.indexOf(oldL);
    if (index > -1) {
        ranGuID.splice(index, 1);
    }

    console.log(JSON.stringify(ranGuID));

    //remove layout
    var element = document.getElementById(oldL);
    element.outerHTML = "";
    delete element;

    

    $('#LayoputsModal').modal('toggle');
}

function updateLayout() {
    var newL = $('#txtEditLayout').val();
    var oldL = $('#oldLayoutID').val();

    var element = document.getElementById(oldL);

    //console.log(ranGuID);

    var imgVis = document.getElementById('img_vis_' + oldL);

    if ($('#slbVisibleLayout').val() == 'YES') {
        imgVis.setAttribute('src', '/Images/visible.png');
        element.setAttribute('data-visible', 'true');
    }
    else {
        imgVis.setAttribute('src', '/Images/invisible.png');
        element.setAttribute('data-visible', 'false');
    }

    if (newL != oldL) {

        if (ranGuID.indexOf(newL) == -1) {

            // update old item in id array
            var index = ranGuID.indexOf(oldL);
            if (index !== -1) { ranGuID[index] = newL; }

            // update layout id

            element.id = newL;

            // update img id and onclick value
            var imgBtn = document.getElementById('img_' + oldL);
            imgBtn.setAttribute('id', 'img_' + newL);
            imgBtn.setAttribute('onclick', 'layoutClick("' + newL + '")');

            var imgVis = document.getElementById('img_vis_' + oldL);
            imgVis.setAttribute('id', 'img_vis_' + newL);

            $('#LayoputsModal').modal('toggle');
        }
        else {
            alert('This ID is exist. Please enter another ID?');
        }
    }
    else {
        $('#LayoputsModal').modal('toggle');
    }
}

