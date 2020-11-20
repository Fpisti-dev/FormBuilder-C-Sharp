<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewForm.ascx.cs" Inherits="Modals_NewForm" %>


<!-- new form popup window -->
<div class="modal fade" id="newFormModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title" id="myModalLabel">Create New Form</h4>
            </div>
            <div class="modal-body">
                <fieldset>  
                    <div class="input-group col-sm-12">
                        <label class="control-label col-sm-3" for="txtName">Name</label>
                        <div class="input-group col-sm-9">
                            <input id="txtName" name="txtName" type="text" class="form-control"/>
                        </div>                
                    </div>                        
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="btnSaveForm">Save</button>
            </div>
        </div>
    </div>
</div>
<!-- end popup window -->
