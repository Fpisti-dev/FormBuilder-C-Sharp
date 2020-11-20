<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HTML.ascx.cs" Inherits="Modals_HTML" %>


<%--Button setting modal--%>
<div class="modal fade" id="BTNModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Button Editor</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtBTNLabel">Label</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtBTNLabel" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtBTNName">ID</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtBTNName" name="txtBTNName" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>                    
                    </div>
                    <br>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="cbBTNVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbBTNVisible" name="cbBTNVisible" type="checkbox" />
                        </div>
                        <div class="col-sm-10"></div>                  
                    </div>
                    <div class="col-lg-12">
                        <div id="dBTNEditor"></div>                                 
                    </div>
                    <input type="hidden" id="oldBTNID" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteBTN" onclick="deleteBTN()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateBTN" onclick="updateBTN()">Update</button>    
            </div>
        </div>
    </div>
</div>


<%--Hidden field setting modal--%>
<div class="modal fade" id="HFModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Hidden field Editor</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtHFID">ID</label>
                        </div>
                        <div class="col-sm-3">
                            <input id="txtHFID" name="txtHFID" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="cbHFVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbHFVisible" name="cbHFVisible" type="checkbox" />
                        </div>
                        <div class="col-sm-6"></div>                  
                    </div>
                    <div class="col-lg-12">
                        <div id="dHFEditor"></div>                                 
                    </div>                
                     

                    <input type="hidden" id="oldHFID" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteHF" onclick="deleteHF()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateHF" onclick="updateHF()">Update</button>    
            </div>
        </div>
    </div>
</div>


<%--HTML setting modal--%>
<div class="modal fade" id="HTMLModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">HTML Editor</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtHTMLID">ID</label>
                        </div>
                        <div class="col-sm-3">
                            <input id="txtHTMLID" name="txtHTMLID" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="cbHTMLVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbHTMLVisible" name="cbHTMLVisible" type="checkbox" />
                        </div>
                        <div class="col-sm-6"></div>                  
                    </div>
                    <div class="col-lg-12">
                        <div id="dHTMLEditor"></div>                                 
                    </div>                
                     

                    <input type="hidden" id="oldHTMLID" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteHTML" onclick="deleteHTML()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateHTML" onclick="updateHTML()">Update</button>    
            </div>
        </div>
    </div>
</div>

<%--Label setting modal--%>
<div class="modal fade" id="LBLModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Label Editor</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtLBLID">ID</label>
                        </div>
                        <div class="col-sm-3">
                            <input id="txtLBLID" name="txtLBLID" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="cbLBLVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbLBLVisible" name="cbLBLVisible" type="checkbox" />
                        </div>
                        <div class="col-sm-6"></div>                  
                    </div>
                    <div class="col-lg-12">
                        <div id="dLBLEditor"></div>                                 
                    </div>                
                     

                    <input type="hidden" id="oldLBLID" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteLBL" onclick="deleteLBL()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateLBL" onclick="updateLBL()">Update</button>    
            </div>
        </div>
    </div>
</div>

<%--Spacer setting modal--%>
<div class="modal fade" id="SPCModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Spacer Editor</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtSPCID">ID</label>
                        </div>
                        <div class="col-sm-3">
                            <input id="txtSPCID" name="txtSPCID" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="cbSPCVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbSPCVisible" name="cbSPCVisible" type="checkbox" />
                        </div>
                        <div class="col-sm-6"></div>                  
                    </div>
                    <div class="col-lg-12">
                        <div id="dSPCEditor"></div>                                 
                    </div>                
                     

                    <input type="hidden" id="oldSPCID" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteSPC" onclick="deleteSPC()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateSPC" onclick="updateSPC()">Update</button>    
            </div>
        </div>
    </div>
</div>


<%--Table setting modal--%>
<div class="modal fade" id="TBLModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Table Editor</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtTBLID">ID</label>
                        </div>
                        <div class="col-sm-3">
                            <input id="txtTBLID" name="txtTBLID" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="cbTBLVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbTBLVisible" name="cbTBLVisible" type="checkbox" />
                        </div>
                        <div class="col-sm-6"></div>                  
                    </div>
                    <div class="col-lg-12">
                        <div id="dTBLEditor"></div>                                 
                    </div>                
                     

                    <input type="hidden" id="oldTBLID" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteTBL" onclick="deleteTBL()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateTBL" onclick="updateTBL()">Update</button>    
            </div>
        </div>
    </div>
</div>
