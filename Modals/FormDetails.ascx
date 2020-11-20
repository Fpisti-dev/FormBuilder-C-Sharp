<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FormDetails.ascx.cs" Inherits="Modals_FormDetails" %>


<!-- details popup window -->
<div class="modal fade" id="DetailsModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title" id="myDetailsModalLabel_1">Details</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <label class="control-label col-sm-5 modal-label" for="lblID">ID</label>
                        <div class="input-group col-sm-7">
                            <label id="lblID"></label>
                        </div>                
                    </div>
                    <div class="input-group col-sm-12">
                        <label class="control-label col-sm-5 modal-label" for="lblFormName">Form name</label>
                        <div class="input-group col-sm-7">
                            <label id="lblFormName"></label>
                        </div>                
                    </div>
                    <div class="input-group col-sm-12">
                        <label class="control-label col-sm-5 modal-label" for="lblCreatedBy">Creator</label>
                        <div class="input-group col-sm-7">
                            <label id="lblCreatedBy"></label>
                        </div>                
                    </div>
                    <div class="input-group col-sm-12">
                        <label class="control-label col-sm-5 modal-label" for="lblCreatedAt">Creation date</label>
                        <div class="input-group col-sm-7">
                            <label id="lblCreatedAt"></label>
                        </div>                
                    </div>
                    <div class="input-group col-sm-12">
                        <label class="control-label col-sm-5 modal-label" for="lblPublished">Published</label>
                        <div class="input-group col-sm-7">
                            <label id="lblPublished"></label>
                        </div>                
                    </div>
                    <div class="input-group col-sm-12">
                        <label class="control-label col-sm-5 modal-label" for="lblLastEditedBy">Last editor</label>
                        <div class="input-group col-sm-7">
                            <label id="lblLastEditedBy"></label>
                        </div>                
                    </div>
                    <div class="input-group col-sm-12">
                        <label class="control-label col-sm-5 modal-label" for="lblLastEditDate">Last edit date</label>
                        <div class="input-group col-sm-7">
                            <label id="lblLastEditDate"></label>
                        </div>                
                    </div>
                    
                    <input type="hidden" id="cDetailsID" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                
            </div>
        </div>
    </div>
</div>
<!-- end popup window --> 