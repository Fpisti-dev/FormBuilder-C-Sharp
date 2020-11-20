<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Pages.ascx.cs" Inherits="Modals_Pages" %>


<%--page setting modal--%>
<div class="modal fade" id="PagesModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title" id="myModalLabel">Page Details</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtEditPageID">ID</label>
                        </div>
                        <div class="col-sm-3">
                            <input id="txtEditPageID" name="txtEditPageID" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtEditPageTitle">Title</label>
                        </div>
                        <div class="col-sm-5">
                            <input id="txtEditPageTitle" name="txtEditPageTitle" type="text" class="form-control"/>
                        </div>                
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-2">
                            <label class="modal-label" for="slbVisiblePage">Visible</label>
                        </div>
                        <div class="col-sm-3">
                            <select id="slbVisiblePage" class="form-control">
                                <option value="YES">Yes</option>
                                <option value="NO">No</option>
                            </select>    
                        </div>
                        <div class="col-sm-7"></div>                
                    </div>
                    <br />

                    <input type="hidden" id="oldpageID" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeletePage" onclick="deletePage()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdatePage" onclick="updatePage()">Update</button>                
            </div>
        </div>
    </div>
</div>
