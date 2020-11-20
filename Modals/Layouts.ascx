<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Layouts.ascx.cs" Inherits="Modals_Layouts" %>

<%--layout setting modal--%>
<div class="modal fade" id="LayoputsModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog"  style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title" id="myModalLabel">Layout Details</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <label class="control-label col-sm-3" for="txtEditLayout">ID</label>
                        <div class="input-group col-sm-9">
                            <input id="txtEditLayout" name="txtEditLayout" type="text" class="form-control"/>
                        </div>               
                    </div>
                    <div class="input-group col-sm-12" style="margin-top: 0.5em">
                        <label class="control-label col-sm-3" for="slbVisibleLayout">Visible</label>
                        <div class="input-group col-sm-9">
                            <select id="slbVisibleLayout" class="form-control">
                                <option value="YES">Yes</option>
                                <option value="NO">No</option>
                            </select>    
                        </div>                
                    </div>

                    <input type="hidden" id="oldLayoutID" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteLayout" onclick="deleteLayout()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateLayout" onclick="updateLayout()">Update</button>                
            </div>
        </div>
    </div>
</div>

<script src="../Scripts/js/LayoutModals.js"></script>