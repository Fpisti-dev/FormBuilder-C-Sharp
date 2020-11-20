<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Inputs.ascx.cs" Inherits="Modals_Inputs" %>

<%--Autocomplete setting modal--%>
<div class="modal fade" id="ACModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Autocomplete Setting</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtACLabel">Label</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtACLabel" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtACName">Name</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtACName" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>                    
                    </div>
                    <br>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbACVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbACVisible" type="checkbox" />
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtACPlaceholder">Placeholder</label>
                        </div>
                        <div class="col-sm-3">
                            <input id="txtACPlaceholder" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-3"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbACRequried">Requried</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbACRequried" type="checkbox" />
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtACMessage">Error Message</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtACMessage" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtACStyle">Style</label>
                        </div>
                        <div class="col-sm-9">
                            <input id="txtACStyle" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>                    
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" >Source</label>
                        </div>
                        <div class="col-sm-5">
                            <label class="radio-inline">
                                <input id="rACList" type="radio" name="ACSourceRadio">List</label>
                            <label class="radio-inline">
                                <input id="rACDatabase" type="radio" name="ACSourceRadio">Database</label>
                        </div>
                        <div class="col-sm-6"></div>                        
                    </div>
                    <div class="input-group col-sm-12">
                        <div id="dACList">
                            <div class="col-sm-2">
                            <label class="modal-label" for="taACList">List separated by '|'</label>
                        </div>
                        <div class="col-sm-10">
                            <textarea rows="4" cols="50" id="taACList" class="form-control"></textarea>
                        </div>
                        </div>
                        <div id="dACDatabase">

                        </div>
                    </div>
                    <div id="dACJavaScript"></div>
                    <input type="hidden" id="oldACName" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteAC" onclick="deleteAC()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateAC" onclick="updateAC()">Update</button>    
            </div>
        </div>
    </div>
</div>


<%--Checkbox setting modal--%>
<div class="modal fade" id="CBModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Checkbox Setting</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtCBLabel">Label</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtCBLabel" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtCBName">Name</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtCBName" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>                    
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbCBVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbCBVisible" type="checkbox" />
                        </div>
                        <div class="col-sm-11"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbCBRequried">Requried</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbCBRequried" type="checkbox" />
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtCBMessage">Message</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtCBMessage" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtCBStyle">Style</label>
                        </div>
                        <div class="col-sm-5">
                            <input id="txtCBStyle" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-6"></div>                    
                    </div>                   

                    <input type="hidden" id="oldCBName" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteCB" onclick="deleteCB()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateCB" onclick="updateCB()">Update</button>    
            </div>
        </div>
    </div>
</div>


<%--Checkbox Group setting modal--%>
<div class="modal fade" id="CBGModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Checkbox Group Setting</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtCBGLabel">Label</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtCBGLabel" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtCBGName">Name</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtCBGName" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>                    
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbCBGVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbCBGVisible" type="checkbox" />
                        </div>
                        <div class="col-sm-11"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbCBGRequried">Requried</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbCBGRequried" type="checkbox" />
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtCBGMessage">Message</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtCBGMessage" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtCBGStyle">Style</label>
                        </div>
                        <div class="col-sm-5">
                            <input id="txtCBGStyle" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-6"></div>                    
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <input type="button" class="btn btn-warning btn-xs" onclick="btnCBGNewRow()" value="Add new checkbox" />
                        </div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12" id="dCBGTable"></div>                   

                    <input type="hidden" id="oldCBGName" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteCBG" onclick="deleteCBG()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateCBG" onclick="updateCBG()">Update</button>    
            </div>
        </div>
    </div>
</div>


<%--Date setting modal--%>
<div class="modal fade" id="DATEModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Date Setting</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtDATELabel">Label</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtDATELabel" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtDATEName">Name</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtDATEName" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>                    
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbDATEVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbDATEVisible" type="checkbox" />
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtDATEPlaceholder">Placeholder</label>
                        </div>
                        <div class="col-sm-3">
                            <input id="txtDATEPlaceholder" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-1">
                            <label class="modal-check-label">Readonly</label>
                        </div>
                        <div class="col-sm-2">
                            <label for="rDATEReadonlyNo">No</label> 
                            <input type="radio" name="rDATEReadonly" id="rDATEReadonlyNo" value="no" />
                            <label for="rNUMReadonlyYes">Yes</label> 
                            <input type="radio" name="rDATEReadonly" id="rDATEReadonlyYes" value="yes" />
                        </div> 
                    </div>
                    <br />
                    <div class="input-group col-sm-12">                        
                        <div class="col-sm-4"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtDATEFormat">Date format</label>
                        </div>
                        <div class="col-sm-3">
                            <input id="txtDATEFormat" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-3"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbDATERequried">Requried</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbDATERequried" type="checkbox" />
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtDATEMessage">Message</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtDATEMessage" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtDATEStyle">Style</label>
                        </div>
                        <div class="col-sm-5">
                            <input id="txtDATEStyle" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-6"></div>                    
                    </div>                   

                    <input type="hidden" id="oldDATEName" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteDATE" onclick="deleteDATE()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateDATE" onclick="updateDATE()">Update</button>    
            </div>
        </div>
    </div>
</div>


<%--File setting modal--%>
<div class="modal fade" id="FILEModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">File Setting</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtFILELabel">Label</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtFILELabel" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtFILEName">Name</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtFILEName" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>                    
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbFILEVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbFILEVisible" type="checkbox" />
                        </div>
                        <div class="col-sm-10"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbFILERequried">Requried</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbFILERequried" type="checkbox" />
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtFILEMessage">Message</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtFILEMessage" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtFILEStyle">Style</label>
                        </div>
                        <div class="col-sm-5">
                            <input id="txtFILEStyle" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-6"></div>                    
                    </div>
                    <br />
                    <div class="panel panel-default col-sm-12">
                        <table id="tFILETypes" class="table table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th class="modal-label">Type</th>
                                    <th class="modal-label" style="text-align: center;">All</th>
                                    <th class="modal-label" style="text-align: center;">Custom</th>
                                    <th class="modal-label">Extensions (separeted by '|', ex. gif|jpeg|png )</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <label class="modal-label">Application</label>
                                    </td>
                                    <td style="text-align: center;">
                                        <input id="cbFILEApplicationAll" type="checkbox" name="FILEApplication" />
                                    </td>
                                    <td style="text-align: center;">
                                        <input id="cbFILEApplicationCustom" type="checkbox" name="FILEApplication" />
                                    </td>
                                    <td>
                                        <input class="form-control" id="textFILEApplicationExtensions" type="text" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="modal-label">Audio</label>
                                    </td>
                                    <td style="text-align: center;">
                                        <input id="cbFILEAudioAll" type="checkbox" name="FILEAudio" />
                                    </td>
                                    <td style="text-align: center;">
                                        <input id="cbFILEAudioCustom" type="checkbox" name="FILEAudio" />
                                    </td>
                                    <td>
                                        <input class="form-control" id="textFILEAudioExtensions" type="text" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="modal-label">Image</label>
                                    </td>
                                    <td style="text-align: center;">
                                        <input id="cbFILEImageAll" type="checkbox" name="FILEImage" />
                                    </td>
                                    <td style="text-align: center;">
                                        <input id="cbFILEImageCustom" type="checkbox" name="FILEImage" />
                                    </td>
                                    <td>
                                        <input class="form-control" id="textFILEImageExtensions" type="text" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="modal-label">Text</label>
                                    </td>
                                    <td style="text-align: center;">
                                        <input id="cbFILETextAll" type="checkbox" name="FILEText" />
                                    </td>
                                    <td style="text-align: center;">
                                        <input id="cbFILETextCustom" type="checkbox" name="FILEText" />
                                    </td>
                                    <td>
                                        <input class="form-control" id="textFILETextExtensions" type="text" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="modal-label">Video</label>
                                    </td>
                                    <td style="text-align: center;">
                                        <input id="cbFILEVideoAll" type="checkbox" name="FILEVideo" />
                                    </td>
                                    <td style="text-align: center;">
                                        <input id="cbFILEVideoCustom" type="checkbox" name="FILEVideo" />
                                    </td>
                                    <td>
                                        <input class="form-control" id="textFILEVideoExtensions" type="text" />
                                    </td>
                                </tr>                                
                            </tbody>
                        </table>
                    </div>                   

                    <input type="hidden" id="oldFILEName" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteFILE" onclick="deleteFILE()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateFILE" onclick="updateFILE()">Update</button>    
            </div>
        </div>
    </div>
</div>

<%--Number setting modal--%>
<div class="modal fade" id="NUMModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Number Setting</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtNUMLabel">Label</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtNUMLabel" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtNUMName">Name</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtNUMName" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>                    
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbNUMVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbNUMVisible" type="checkbox" />
                        </div>
                        <div class="col-sm-1"></div>                        
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtNUMPlaceholder">Placeholder</label>
                        </div>
                        <div class="col-sm-3">
                            <input id="txtNUMPlaceholder" type="number" class="form-control"/>
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-1">
                            <label class="modal-check-label">Readonly</label>
                        </div>
                        <div class="col-sm-2">
                            <label for="rNUMReadonlyNo">No</label> 
                            <input type="radio" name="rNUMReadonly" id="rNUMReadonlyNo" value="no" />
                            <label for="rNUMReadonlyYes">Yes</label> 
                            <input type="radio" name="rNUMReadonly" id="rNUMReadonlyYes" value="yes" />
                        </div>                        
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtNUMMin">Min</label>
                        </div>
                        <div class="col-sm-2">
                            <input id="txtNUMMin" type="number" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtNUMMax">Max</label>
                        </div>
                        <div class="col-sm-2">
                            <input id="txtNUMMax" type="number" class="form-control"/>
                        </div>                         
                        <div class="col-sm-6"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                         <div class="col-sm-2">
                            <label class="modal-label" for="txtNUMDefault">Default value</label>
                        </div>
                        <div class="col-sm-2">
                            <input id="txtNUMDefault" type="number" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtNUMStep">Step</label>
                        </div>
                        <div class="col-sm-2">
                            <input id="txtNUMStep" type="number" class="form-control"/>
                        </div>
                        <div class="col-sm-5"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbNUMRequried">Requried</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbNUMRequried" type="checkbox" />
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtNUMMessage">Message</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtNUMMessage" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtNUMStyle">Style</label>
                        </div>
                        <div class="col-sm-5">
                            <input id="txtNUMStyle" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-6"></div>                    
                    </div>                   

                    <input type="hidden" id="oldNUMName" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteNUM" onclick="deleteNUM()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateNUM" onclick="updateNUM()">Update</button>    
            </div>
        </div>
    </div>
</div>


<%--Password setting modal--%>
<div class="modal fade" id="PSWModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Password Setting</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtPSWLabel">Label</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtPSWLabel" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtPSWName">Name</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtPSWName" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>                    
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbPSWVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbPSWVisible" type="checkbox" />
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtPSWPlaceholder">Placeholder</label>
                        </div>
                        <div class="col-sm-3">
                            <input id="txtPSWPlaceholder" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-1">
                            <label class="modal-check-label">Readonly</label>
                        </div>
                        <div class="col-sm-2">
                            <label for="rPSWReadonlyNo">No</label> 
                            <input type="radio" name="rPSWReadonly" id="rPSWReadonlyNo" value="no" />
                            <label for="rPSWReadonlyYes">Yes</label> 
                            <input type="radio" name="rPSWReadonly" id="rPSWReadonlyYes" value="yes" />
                        </div> 
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbPSWRequried">Requried</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbPSWRequried" type="checkbox" />
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtPSWMessage">Message</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtPSWMessage" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtPSWPattern">Pattern</label>
                        </div>
                        <div class="col-sm-5">
                            <input id="txtPSWPattern" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-6"></div>                    
                    </div> 
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtPSWStyle">Style</label>
                        </div>
                        <div class="col-sm-5">
                            <input id="txtPSWStyle" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-6"></div>                    
                    </div>                   

                    <input type="hidden" id="oldPSWName" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeletePSW" onclick="deletePSW()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdatePSW" onclick="updatePSW()">Update</button>    
            </div>
        </div>
    </div>
</div>

<%--Radio setting modal--%>
<div class="modal fade" id="RDOModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Radio Setting</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtRDOLabel">Label</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtRDOLabel" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtRDOName">Name</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtRDOName" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>                    
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbRDOVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbRDOVisible" type="checkbox" />
                        </div>                        
                        <div class="col-sm-10"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbRDORequried">Requried</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbRDORequried" type="checkbox" />
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtRDOMessage">Message</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtRDOMessage" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label">Selection</label>
                        </div>
                        <div class="col-sm-4">
                            <label for="rRDOSingle">Single</label> 
                            <input type="radio" name="rRDOSelection" id="rRDOSingle" value="single" />
                            <label for="rRDOMultiple">Multiple</label> 
                            <input type="radio" name="rRDOSelection" id="rRDOMultiple" value="multiple" />
                        </div>
                        <div class="col-sm-7"></div>
                    </div>
                    <br />     
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtRDOStyle">Style</label>
                        </div>
                        <div class="col-sm-5">
                            <input id="txtRDOStyle" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-6"></div>                    
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <input type="button" class="btn btn-warning btn-xs" onclick="btnRDONewRow()" value="Add new radio" />
                        </div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12" id="dRDOTable"></div>                      

                    <input type="hidden" id="oldRDOName" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteRDO" onclick="deleteRDO()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateRDO" onclick="updateRDO()">Update</button>    
            </div>
        </div>
    </div>
</div>

<%--Select setting modal--%>
<div class="modal fade" id="SLModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Select Setting</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtSLLabel">Label</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtSLLabel" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtSLName">Name</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtSLName" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>                    
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbSLVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbSLVisible" type="checkbox" />
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtSLPlaceholder">Placeholder</label>
                        </div>
                        <div class="col-sm-3">
                            <input id="txtSLPlaceholder" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-3" style="color:red; font-size:10px" >If you enter any placeholder that will the default option!</div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbSLRequried">Requried</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbSLRequried" type="checkbox" />
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtSLMessage">Message</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtSLMessage" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtSLStyle">Style</label>
                        </div>
                        <div class="col-sm-5">
                            <input id="txtSLStyle" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-6"></div>                    
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <input type="button" class="btn btn-warning btn-xs" onclick="btnSLNewRow()" value="Add new option" />
                        </div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12" id="dSLTable"></div>                       

                    <input type="hidden" id="oldSLName" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteSL" onclick="deleteSL()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateSL" onclick="updateSL()">Update</button>    
            </div>
        </div>
    </div>
</div>



<%--Text setting modal--%>
<div class="modal fade" id="TXTModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Text Setting</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtTXTLabel">Label</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtTXTLabel" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtTXTName">Name</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtTXTName" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>                    
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbTXTVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbTXTVisible" type="checkbox" />
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtTXTPlaceholder">Placeholder</label>
                        </div>
                        <div class="col-sm-3">
                            <input id="txtTXTPlaceholder" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-1">
                            <label class="modal-check-label">Readonly</label>
                        </div>
                        <div class="col-sm-2">
                            <label for="rTXTReadonlyNo">No</label> 
                            <input type="radio" name="rTXTReadonly" id="rTXTReadonlyNo" value="no" />
                            <label for="rTXTReadonlyYes">Yes</label> 
                            <input type="radio" name="rTXTReadonly" id="rTXTReadonlyYes" value="yes" />
                        </div> 
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbTXTRequried">Requried</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbTXTRequried" type="checkbox" />
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtTXTMessage">Message</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtTXTMessage" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtTXTStyle">Style</label>
                        </div>
                        <div class="col-sm-5">
                            <input id="txtTXTStyle" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-6"></div>                    
                    </div>                   

                    <input type="hidden" id="oldTXTName" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteTXT" onclick="deleteTXT()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateTXT" onclick="updateTXT()">Update</button>    
            </div>
        </div>
    </div>
</div>



<%--Textarea setting modal--%>
<div class="modal fade" id="TXAModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Textarea Setting</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtTXALabel">Label</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtTXALabel" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtTXAName">Name</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtTXAName" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>                    
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbTXAVisible">Visible</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbTXAVisible" type="checkbox" />
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtTXAPlaceholder">Placeholder</label>
                        </div>
                        <div class="col-sm-3">
                            <input id="txtTXAPlaceholder" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-1">
                            <label class="modal-check-label">Readonly</label>
                        </div>
                        <div class="col-sm-2">
                            <label for="rTXAReadonlyNo">No</label> 
                            <input type="radio" name="rTXAReadonly" id="rTXAReadonlyNo" value="no" />
                            <label for="rTXAReadonlyYes">Yes</label> 
                            <input type="radio" name="rTXAReadonly" id="rTXAReadonlyYes" value="yes" />
                        </div> 
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-check-label" for="cbTXARequried">Requried</label>
                        </div>
                        <div class="col-sm-1">
                            <input id="cbTXARequried" type="checkbox" />
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtTXAMessage">Message</label>
                        </div>
                        <div class="col-sm-4">
                            <input id="txtTXAMessage" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtTXARows">Rows</label>
                        </div>
                        <div class="col-sm-2">
                            <input id="txtTXARows" type="number" class="form-control"/>
                        </div>
                        <div class="col-sm-1"></div> 
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtTXACols">Cols</label>
                        </div>
                        <div class="col-sm-2">
                            <input id="txtTXACols" type="number" class="form-control"/>
                        </div>
                        <div class="col-sm-1"></div> 
                        <div class="col-sm-2">
                            <label class="modal-label" for="txtTXAMaxLength">Max length</label>
                        </div>
                        <div class="col-sm-2">
                            <input id="txtTXAMaxLength" type="number" class="form-control"/>
                        </div>              
                    </div>
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <label class="modal-label" for="txtTXAStyle">Style</label>
                        </div>
                        <div class="col-sm-5">
                            <input id="txtTXAStyle" type="text" class="form-control"/>
                        </div>
                        <div class="col-sm-6"></div>                    
                    </div>                   

                    <input type="hidden" id="oldTXAName" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="btnDeleteTXA" onclick="deleteTXA()">Delete</button>
                <button type="button" class="btn btn-primary" id="btnUpdateTXA" onclick="updateTXA()">Update</button>    
            </div>
        </div>
    </div>
</div>
