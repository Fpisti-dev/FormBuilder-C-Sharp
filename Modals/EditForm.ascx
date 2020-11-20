<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditForm.ascx.cs" Inherits="Modals_EditForm" %>


<!-- first edit popup window -->
<div class="modal fade" id="EditModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title" id="myEditModalLabel_1">Edit Form</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <label class="control-label col-sm-5 modal-label" for="lblEditID">ID</label>
                        <div class="input-group col-sm-7">
                            <label id="lblEditID"></label>
                        </div>                
                    </div>
                    <div class="input-group col-sm-12">
                        <label class="control-label col-sm-5 modal-label" for="txtEditFormName">Name: </label>
                        <div class="input-group col-sm-7">
                            <input id="txtEditFormName" name="txtEditFormName" type="text" class="form-control"/>
                        </div>                
                    </div>
                    <div class="input-group col-sm-12">
                        <label class="control-label col-sm-5 modal-label" for="slbEditPublished">Published</label>
                        <div class="input-group col-sm-7">
                            <select id="slbEditPublished" class="form-control" style="margin-top: 0.5em;">
                                <option value="Y">YES</option>
                                <option value="N">NO</option>
                            </select>
                        </div>
                    </div> 
                    <br />                   
                    <div class="input-group col-sm-12">
                        <label class="control-label col-sm-5 modal-label" for="lblEditCreatedBy">Creator</label>
                        <div class="input-group col-sm-7">
                            <label id="lblEditCreatedBy"></label>
                        </div>                
                    </div>
                    <div class="input-group col-sm-12">
                        <label class="control-label col-sm-5 modal-label" for="lblEditCreatedAt">Creation date</label>
                        <div class="input-group col-sm-7">
                            <label id="lblEditCreatedAt"></label>
                        </div>                
                    </div>                    
                    <div class="input-group col-sm-12">
                        <label class="control-label col-sm-5 modal-label" for="lblEditLastEditedBy">Last editor</label>
                        <div class="input-group col-sm-7">
                            <label id="lblEditLastEditedBy"></label>
                        </div>                
                    </div>
                    <div class="input-group col-sm-12">
                        <label class="control-label col-sm-5 modal-label" for="lblEditLastEditDate">Last edit date</label>
                        <div class="input-group col-sm-7">
                            <label id="lblEditLastEditDate"></label>
                        </div>                
                    </div>
                    
                    <input type="hidden" id="cEditID" value="" />
            </fieldset>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" id="btnEditUpdateForm" onclick="btnEditUpdate_Click()">Update</button>
        </div>
        </div>
    </div>
</div>
<!-- end popup window -->