<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Extras.ascx.cs" Inherits="Modals_Extras" %>

<%--Styling modal--%>
<div class="modal fade" id="StylingModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Styling</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="col-lg-12">
                        <textarea rows="50" cols="50" id="taStyling"></textarea>                               
                    </div>
                    <input type="hidden" id="hfStyling" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="btnStyling" onclick="updateStyling()">Update</button>    
            </div>
        </div>
    </div>
</div>

<%--Scripting modal--%>
<div class="modal fade" id="ScriptingModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Scripting</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="col-lg-12">
                        <textarea rows="50" cols="50" id="taScripting"></textarea>                              
                    </div>
                    <input type="hidden" id="hfScripting" value="" /> 
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="btnScripting" onclick="updateScripting()">Update</button>    
            </div>
        </div>
    </div>
</div>

<%--Resources modal--%>
<div class="modal fade" id="ResourcesModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Resources</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <input type="button" class="btn btn-warning btn-xs" onclick="btnResourcesStyleNewRow()" value="Add new style" />
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div id="dResourcesStyle"></div>                                 
                    </div>
                    <input type="hidden" id="hfResourcesStyle" value="" />
                    <br />
                    <div class="input-group col-sm-12">
                        <div class="col-sm-1">
                            <input type="button" class="btn btn-warning btn-xs" onclick="btnResourcesScriptNewRow()" value="Add new script" />
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div id="dResourcesScript"></div>                                 
                    </div>
                    <input type="hidden" id="hfResourcesScript" value="" />  
                </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="btnResources" onclick="updateResources()">Update</button>    
            </div>
        </div>
    </div>
</div>


<%--Sources modal--%>
<div class="modal fade" id="SourcesModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">                
                <h4 class="modal-title">Sources</h4>
            </div>
            <div class="modal-body">
                <fieldset>
                    <div class="panel panel-default col-sm-12" style="padding: 10px; margin: 10px">
                        <div id="Tabs" role="tabpanel">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li  class="active">
                                    <a href="#PageSource" aria-controls="PageSource" role="tab" data-toggle="tab">Pages source</a>
                                </li>
                                <li>
                                    <a href="#DesignerSource" aria-controls="DesignerSource" role="tab" data-toggle="tab">Designer Source</a>
                                </li>                           
                            </ul>


                            <!--Tabs-->
                            <div class="tab-content" style="min-height: 550px; padding-top: 20px">
                            
                                <%--Pages source--%>
                                <div role="tabpanel" class="tab-pane active" runat="server" id="PageSource">
                                    <div class="col-sm-12">                                    
                                        <textarea rows="50" cols="50" id="taPagesSource"></textarea>
                                    </div>
                                </div>

                                <%--Designer source--%>
                                <div role="tabpanel" class="tab-pane"  runat="server" id="DesignerSource">
                                    <div class="col-sm-12">                
                                        <textarea rows="50" cols="50" id="taDesignerSource"></textarea>        
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div>                    
                </fieldset>              
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="btnSources" onclick="updateSources()">Update</button>    
            </div>
        </div>
    </div>
</div>

