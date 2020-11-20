<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Editor.aspx.cs" Inherits="Editor" validaterequest="False" %>

<%@ Register src="~/Modals/Pages.ascx" TagName="PageControl" TagPrefix="pc" %>
<%@ Register src="~/Modals/Layouts.ascx" TagName="LayoutControl" TagPrefix="lc" %>
<%@ Register src="~/Modals/Inputs.ascx" TagName="InputControl" TagPrefix="ic" %>
<%@ Register src="~/Modals/HTML.ascx" TagName="HTMLControl" TagPrefix="hc" %>
<%@ Register src="~/Modals/Extras.ascx" TagName="ExtrasControl" TagPrefix="ec" %>



<asp:Content ContentPlaceHolderID="Content" runat="server">

    <pc:PageControl ID="mPageControl" runat="server" />
    <lc:LayoutControl ID="mLayoutControl" runat="server" />
    <ic:InputControl ID="mInputsControl" runat="server" />
    <hc:HTMLControl ID="mHTMLControl" runat="server" />
    <ec:ExtrasControl ID="mExtrasControl" runat="server" />

    <div id="dEditor" class="col-sm-12">
        <div class="col-sm-2">
            <div id="dPages" class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Pages</h3>
                    </div>
                    <div class="panel-body">
                        <button type="button" class="btn btn-xs btn-success pull-right" id="btnNewPage"  onclick="newPage()">New</button><br /><br />
                        <ul id="uPages" class="list-group">
                            <li id="link_page_first" data-type="first-page" class="list-group-item" style="text-align: center;" onclick="pageClick('page_first')">First page<span role="button" class="glyphicon glyphicon-pencil btn btn-primary btn-xs pull-right" onclick="pageDetails('page_first')"></span><span><img  id="img_vis_page_first" src="/Images/visible-page.png" style="float: left; margin-top: -0.5em; margin-left: -0.5em" /></span>
                            </li>
                            <%--<li class="list-group-item ui-sortable">2<span role="button" class="glyphicon glyphicon-trash btn btn-danger btn-xs pull-right"></span><span role="button" class="glyphicon glyphicon-pencil btn btn-primary btn-xs pull-right"></span>
                            </li>--%>                            
                            <li id="link_page_last" data-type="last-page" class="list-group-item" style="text-align: center;" onclick="pageClick('page_last')">Last page<span role="button" class="glyphicon glyphicon-pencil btn btn-primary btn-xs pull-right" onclick="pageDetails('page_last')"></span><span><img  id="img_vis_page_last" src="/Images/visible-page.png" style="float: left; margin-top: -0.5em; margin-left: -0.5em;" /></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="dExtras" class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Extras</h3>
                    </div>
                    <div class="panel-body">                        
                        <ul id="uExtras" class="list-group">
                            <li id="link_styling" data-type="stylig" class="list-group-item" style="text-align: center; cursor: pointer;" onclick="stylingClick()">Styling</li>
                            <li id="link_scripting" data-type="scripting" class="list-group-item" style="text-align: center; cursor: pointer;" onclick="scriptingClick()">Scripting</li>                           
                            <li id="link_resources" data-type="resources" class="list-group-item" style="text-align: center; cursor: pointer;" onclick="resourcesClick()">Resources</li>  
                            <li id="link_Source" data-type="source" class="list-group-item" style="text-align: center; cursor: pointer;" onclick="sourceClick()">Source</li>  
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div id="dDesigner" class="col-sm-8">
            <div class="panel-group">
                 <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Designer</h3>
                    </div>
                    <div class="panel-body">
                        <h4 id="pageTitle">First page</h4>
                        <div id="droppable" class="designer">
                            <div id="page_first" data-title="First page"></div>
                            <div id="page_last" data-title="Last page"></div>
                        </div>
                    </div>
                </div>
            </div>        
        </div>
        <div id="dTools" class="col-sm-2">
            <div class="panel-group">
                 <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Tools</h3>
                    </div>
                    <div class="panel-body">
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#dLayouts">Layouts</a>
                                    </h4>
                                </div>
                                <div id="dLayouts" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="area draggable-layout" title="Drag to add">
							                <div class="col-sm-12 layouts">
								                <div class="col-sm-12 layout">
                                                    <div  class="drop box"></div>
								                </div>
								            </div>
							            </div>
                                        <div class="area draggable-layout"  title="Drag to add">
							                <div class="col-sm-12 layouts">
									            <div class="col-sm-6 layout">
                                                    <div class="drop box">                                                   
                                                    </div>
									            </div>
                                                <div class="col-sm-6 layout">
                                                    <div class="drop box">
                                                    </div>
                                                </div>
							                </div>
						                </div>
                                        <div class="area draggable-layout" title="Drag to add">
							                <div class="col-sm-12 layouts">
								                <div class="col-sm-9 layout">
                                                    <div  class="drop box"></div>
								                </div>
                                                <div class="col-sm-3 layout">
                                                    <div  class="drop box"></div>
                                                </div>
                                            </div>
								        </div>
                                        <div class="area draggable-layout" title="Drag to add">
									        <div class="col-sm-12 layouts">
										        <div class="col-sm-3 layout">
                                                    <div class="drop box"></div>
										        </div>
										        <div class="col-sm-9 layout">
                                                    <div class="drop box"></div>
										        </div>
									        </div>
								        </div>
								        <div class="area draggable-layout" title="Drag to add">
									        <div class="col-sm-12 layouts">
										        <div class="col-sm-4 layout">
                                                    <div class="drop box"></div>
										        </div>
										        <div class="col-sm-4 layout">
                                                    <div class="drop box"></div>
										        </div>
										        <div class="col-sm-4 layout">
                                                    <div class="drop box"></div>
										        </div>
									        </div>
								        </div>
								        <div class="area draggable-layout" title="Drag to add">
                                            <div class="col-sm-12 layouts">
										        <div class="col-sm-6 layout">
                                                    <div class="drop box"></div>
										        </div>
										        <div class="col-sm-3 layout">
                                                    <div class="drop box"></div>
										        </div>
										        <div class="col-sm-3 layout">
                                                    <div class="drop box"></div>
										        </div>
									        </div>
								        </div>
								        <div class="area draggable-layout" title="Drag to add">
									        <div class="col-sm-12 layouts">
										        <div class="col-sm-3 layout">
                                                    <div class="drop box"></div>
										        </div>
										        <div class="col-sm-3 layout">
                                                    <div class="drop box"></div>
										        </div>
										        <div class="col-sm-6 layout">
                                                    <div class="drop box"></div>
										        </div>
									        </div>
								        </div>
								        <div class="area draggable-layout" title="Drag to add">
									        <div class="col-sm-12 layouts">
										        <div class="col-sm-3 layout">
                                                    <div class="drop box"></div>
										        </div>
										        <div class="col-sm-3 layout">
                                                    <div class="drop box"></div>
										        </div>
										        <div class="col-sm-3 layout">
                                                    <div class="drop box"></div>
										        </div>
										        <div class="col-sm-3 layout">
                                                    <div class="drop box"></div>
										        </div>
									        </div>
								        </div>								
                                    </div>
                                </div>
                            </div>
                    <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#dInputs">Inputs</a>
                        </h4>
                    </div>
                    <div id="dInputs" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-group">
                                <li data-type="autocomplete" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/autocomplete.gif" style="display: inline;" />
                                    </span>Autocomplete
                                </li>
							    <li data-type="checkbox" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/checkbox.gif" style="display: inline;" />
                                    </span>Checkbox
							    </li>
                                <li data-type="checkboxgroup" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/checkbox_group.gif"" style="display: inline;" />
                                    </span>Checkbox group
                                </li>
								<li data-type="date" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/date.gif" style="display: inline;"/>
                                    </span>Date
							    </li>									
							    <li data-type="file" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/file.gif" style="display: inline;" />
                                    </span>File
							    </li>
							    <li data-type="number" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/number.gif" style="display: inline;" />
                                    </span>Number
							    </li>
                                <li data-type="password" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/password.gif" style="display: inline;" />
                                    </span>Password
							    </li>										
							    <li data-type="radio" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/radio.gif"" style="display: inline;" />
                                    </span>Radio
							    </li>                                
							    <li data-type="select" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/select.gif"" style="display: inline;" />
                                    </span>Select
							    </li>									
							    <li data-type="text" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/text.gif" style="display: inline;" />
                                    </span>Text
							    </li>
							    <li data-type="textarea" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/textarea.gif" style="display: inline;" />
                                    </span>Textarea
							    </li>									
						    </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#dHtml">HTML</a>
                        </h4>
                    </div>
                    <div id="dHtml" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-group">
                                <li data-type="button" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/button.gif" style="display: inline;" />
                                    </span>Button
                                </li>
							    <li data-type="hidden" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/hidden.gif" style="display: inline;" />
                                    </span>Hidden field
							    </li>
                                <li data-type="html" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/html.gif" style="display: inline;" />
                                    </span>HTML
                                </li>
                                <li data-type="label" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/label.gif" style="display: inline;" />
                                    </span>Label
                                </li>
							    <li data-type="spacer" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/spacer.gif" style="display: inline;"/>
                                    </span>Spacer
							    </li>									
							    <li data-type="table" title="Click or drag to add" class="draggable-item list-group-item">
                                    <span>
                                        <img src="/Images/table.gif" style="display: inline;" />
                                    </span>Table
							    </li>														
							</ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                </div>
            </div>
        </div> 
    </div>
    
    <%--Form-builder--%>
    <%--<form action="" id="form-builder-pages">
        <ul id="tabs">
            <li><a href="#page-1">Page 1</a></li>
            <li id="add-page-tab"><a href="#new-page">+ Page</a></li>
        </ul>
        <div id="page-1" class="fb-editor"></div>
        <div id="new-page"></div>
  
    </form>
    
    <div class="save-all-wrap"><button id="save-all" type="button">Save All</button></div>--%>

    <script src="Scripts/js/Editor.js"></script>    
    <script src="Scripts/js/InputModals.js"></script>
    <script src="Scripts/js/HtmlModals.js"></script>

</asp:Content>
