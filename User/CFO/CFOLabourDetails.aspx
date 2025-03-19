﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="CFOLabourDetails.aspx.cs" Inherits="MeghalayaUIP.User.CFO.CFOLabourDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../assets/admin/js/form-validation.js" type="text/javascript"></script>
    <script type="text/javascript">
        //let originalValue = "";
        function handleKeyUp(input) {
            if (input.value.trim() === "") {
                input.style.border = "2px solid red";
            }
            else {
                input.style.border = "1px solid #767575b5";
            }
        }
        function validateDropdown(dropdown) {

            if (dropdown.value === "0") {
                dropdown.style.border = "2px solid red";
                dropdown.focus();
            } else {
                dropdown.style.border = "1px solid #767575b5";
            }
        }


        function validateRadioButtonList(radioGroupContainer) {
            // Find all radio buttons inside the container
            const radioButtons = radioGroupContainer.querySelectorAll('input[type="radio"]');

            // Check if any radio button is selected
            const isSelected = Array.from(radioButtons).some(radio => radio.checked);

            if (!isSelected) {
                // If none are selected, apply red border
                radioGroupContainer.style.border = "2px solid red";
                radioGroupContainer.querySelector('input[type="radio"]').focus(); // Set focus to the first radio button
            } else {
                // Reset the border if an option is selected
                var id = radioGroupContainer.id;
                document.getElementById(id).style.border = "1px solid #767575b5";
                return false;
            }
        }
    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="../Dashboard/Dashboarddrill.aspx">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="CFOUserDashboard.aspx">Pre-Operational</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Labour Details</li>
                </ol>
            </nav>
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Labour Details</h4>
                                </div>
                                <div class="card-body" id="divText" runat="server">
                                    <div class="col-md-12 ">
                                        <div id="success" runat="server" visible="false" class="alert alert-success alert-dismissible fade show" align="Center">
                                            <strong>Success!</strong><asp:Label ID="lblmsg" runat="server"></asp:Label>
                                            <asp:Label ID="Label1" runat="server"></asp:Label>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                        </div>
                                    </div>
                                    <div class="col-md-12 ">
                                        <div id="Failure" runat="server" visible="false" class="alert alert-danger alert-dismissible fade show" align="Center">
                                            <strong>Warning!</strong>
                                            <asp:Label ID="lblmsg0" runat="server"></asp:Label>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                    </div>
                                    <asp:HiddenField ID="hdnUserID" runat="server" />
                                    <div class="row">
                                        <div runat="server" id="RegManuBoiler" visible="false">
                                            <%-- Registration of Manufacturers / Repairers/Erectors of Boilers--%>
                                            <div class="col-md-12 d-flex">
                                                <label class="col-lg-12 col-form-label fw-bold">Vendor Technical:</label>
                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-lg-8 col-form-label">Whether the firm has ever been approved by any Boilers’ Directorate / Inspectorate?*</label>
                                                        <div class="col-lg-4">
                                                            <asp:RadioButtonList ID="RBLAPPROVED" onchange="validateRadioButtonList(this)" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="RBLAPPROVED_SelectedIndexChanged">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-lg-8 col-form-label">Classification applied for*</label>
                                                        <div class="col-lg-4">
                                                            <asp:DropDownList ID="ddlApplied" onchange="validateDropdown(this)" runat="server" class="form-control">
                                                                <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                                <asp:ListItem Value="1" Text="Special Class (For any Boiler Pressure)"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="Class I (For Boiler Pressure upto 125 kg/cm2)"></asp:ListItem>
                                                                <asp:ListItem Value="3" Text="Class II (For Boiler Pressure upto 40 kg/cm2)"></asp:ListItem>
                                                                <asp:ListItem Value="4" Text="Class III (For Boiler Pressure upto 17.5 kg/cm2)"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Year of Establishment *</label>
                                                        <div class="col-lg-4 d-flex">
                                                            <asp:TextBox ID="txtESTYear" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" TabIndex="1" MaxLength="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label>Is any type of jobs executed by the firm earlier, with special reference to their maximum working pressure, temperature and the materials involved, with documentary evidence?*</label>
                                                        <div class="col-lg-4">
                                                            <asp:RadioButtonList ID="rblmaximum" runat="server" onchange="validateRadioButtonList(this)" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblmaximum_SelectedIndexChanged">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>

                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-lg-8 col-form-label">Has your request for recognition as a repairer under Indian Boiler Regulation, 1950 been rejected by any authority*</label>
                                                        <div class="col-lg-4">
                                                            <asp:RadioButtonList ID="rblregulation" runat="server" RepeatDirection="Horizontal" onchange="validateRadioButtonList(this)" OnSelectedIndexChanged="rblregulation_SelectedIndexChanged">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-lg-8 col-form-label">Whether having rectifier / generator, grinder, general tools and tackles, dye penetrant kit, expander and measuring instruments or any other tools and tackles under regulation 392 (5) (i)?*</label>
                                                        <div class="col-lg-4">
                                                            <asp:RadioButtonList ID="rblgenerator" runat="server" RepeatDirection="Horizontal" onchange="validateRadioButtonList(this)" OnSelectedIndexChanged="rblgenerator_SelectedIndexChanged">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-lg-8 col-form-label">Detailed list of technical personnel with designation, educational qualifications and relevant experience (attach copies of documents) who are permanently employed with the firm ?*</label>
                                                        <div class="col-lg-4">
                                                            <asp:RadioButtonList ID="rbldesignation" runat="server" RepeatDirection="Horizontal" onchange="validateRadioButtonList(this)" OnSelectedIndexChanged="rbldesignation_SelectedIndexChanged">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-lg-8 col-form-label">How many working sites can be handled by the firm simultaneously? *</label>
                                                        <div class="col-lg-4 d-flex">
                                                            <asp:TextBox ID="txtSite" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="7" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-lg-8 col-form-label">Whether the firm is prepared to execute the job strictly in 81 conformity with the regulations and maintain a high standard of work ? *</label>
                                                        <div class="col-lg-4">
                                                            <asp:RadioButtonList ID="rblstrictly" runat="server" RepeatDirection="Horizontal" onchange="validateRadioButtonList(this)" OnSelectedIndexChanged="rblstrictly_SelectedIndexChanged">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-lg-8 col-form-label">Whether the firm is prepared to accept full responsibility for the work done and is prepared to clarify any controversial issue, if required?*</label>
                                                        <div class="col-lg-4">
                                                            <asp:RadioButtonList ID="rblfirm" runat="server" RepeatDirection="Horizontal" onchange="validateRadioButtonList(this)" OnSelectedIndexChanged="rblfirm_SelectedIndexChanged">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-lg-8 col-form-label">Whether the firm is in a position to supply materials to required specification with proper test certificates if asked for ?*</label>
                                                        <div class="col-lg-4">
                                                            <asp:RadioButtonList ID="rblmaterial" runat="server" RepeatDirection="Horizontal" onchange="validateRadioButtonList(this)" OnSelectedIndexChanged="rblmaterial_SelectedIndexChanged">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-lg-8 col-form-label">Whether the firm has an internal quality control system of their own ??  *</label>
                                                        <div class="col-lg-4">
                                                            <asp:RadioButtonList ID="rblinternalcontrol" runat="server" onchange="validateRadioButtonList(this)" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblinternalcontrol_SelectedIndexChanged">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-lg-8 col-form-label">Upload document for List of welders employed with copies of current certificate issued by a Competent Authority under the Indian Boiler Regulations, 1950? *</label>
                                                        <div class="col-lg-4">
                                                            <asp:RadioButtonList ID="rbldocument" runat="server" onchange="validateRadioButtonList(this)" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbldocument_SelectedIndexChanged">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4" id="Approved" runat="server" visible="false">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Provide Details *</label>
                                                        <div class="col-lg-4 d-flex">
                                                            <asp:TextBox ID="txtProvide" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div runat="server" id="RegBoiler" visible="false">
                                            <%--Registration of Boiler--%>
                                            <div class="col-md-12 d-flex">
                                                <label class="col-lg-12 col-form-label fw-bold">Boiler Technical Details:</label>
                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Name of the Manufacturer *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtname1" runat="server" class="form-control" onkeypress="return Names(this)" TabIndex="1" MaxLength="200" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Year of manufacture  *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtfather" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" TabIndex="1" MaxLength="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Place of manufacture  *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtage" runat="server" class="form-control" onkeypress="return validateNames(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Boiler Maker's Number  *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtBoilerNumber" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" TabIndex="1" MaxLength="10" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Intended Working Pressure  *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtIntendedPressure" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Fuel use  *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:DropDownList ID="ddlManufacture" onchange="validateDropdown(this)" runat="server" class="form-control">
                                                                <asp:ListItem Text="--Select--" Value="0" />
                                                                <asp:ListItem Text="Husk" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Furnace Oil" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Hi-speed Diesel" Value="3"></asp:ListItem>
                                                                 <asp:ListItem Text="Coal" Value="4"></asp:ListItem>
                                                                 <asp:ListItem Text="Waste Gases" Value="5"></asp:ListItem>
                                                                 <asp:ListItem Text="Others" Value="6"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Super Heater Rating(kg/cm²/lbs)</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtSuperRating" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" MaxLength="8" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Economiser Rating</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtEconomise" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" MaxLength="8" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Maximum Continuous Evaporation (Tonnes/Hour)   *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtTonnes" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" MaxLength="8" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Re-Heater Rating</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtHeaterRating" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" MaxLength="8" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Working Season *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:DropDownList ID="ddlWkgSeason" onchange="validateDropdown(this)" runat="server" class="form-control">
                                                                <asp:ListItem Text="--Select--" Value="0" />
                                                                <asp:ListItem Text="Quartely" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Half Yearly" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Yearly" Value="3"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Working Pressure (In Kg/cm-sq or PSI) *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtPressure" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" MaxLength="8" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Name of the owner *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtOwner" runat="server" class="form-control" onkeypress="return Names(this)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Type of Boiler *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:DropDownList ID="ddlTypeBoiler" onchange="validateDropdown(this)" runat="server" class="form-control">
                                                                <asp:ListItem Text="--Select--" Value="0" />
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Description of Boiler  *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtDESCBoiler" runat="server" class="form-control" onkeypress="return validateNames(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">BoilerRating  *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtBoilerRating" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="8" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">In case of Boiler ownership being transfer *</label>
                                                        <div class="col-lg-4">
                                                            <asp:RadioButtonList ID="rblBoilerTrans" runat="server" onchange="validateRadioButtonList(this)" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rblBoilerTrans_SelectedIndexChanged">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4" id="txtBoiler" runat="server" visible="false">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Remarks (Transfers etc.) *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtRemark" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <%--  <div class="col-md-12 d-flex">
                                            <label class="col-lg-12 col-form-label fw-bold">Boiler Technical Details:</label>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Name of the Manufacturer *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtNameManu" runat="server" class="form-control" onkeypress="return validateNames(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Year of manufacture  *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtYearManu" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="4" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Place of manufacture  *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtPlaceManu" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>--%>

                                        <div runat="server" id="Migrant1979" visible="false">
                                            <%--and License for Contractors under the Interstate Migrant Workmen Act 1979 block also visible--%>
                                            <%--License for Contractors under the Contract Labour Act 1970--%>
                                            <div class="col-md-12 d-flex">
                                                <label class="col-lg-12 col-form-label fw-bold">Particulars of Contract Labour:</label>
                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <label class="col-lg-12 col-form-label fw-bold">Name & Address of Agent or Manager of Contractor at the worksite:</label>
                                            </div>


                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Name of agent or manager</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtNameAgent" runat="server" class="form-control" onkeypress="return Names(this)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Address of the agent or manager *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtAddress" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-8">
                                                    <div class="form-group row">
                                                        <label class="col-lg-9 col-form-label">Name,Nature and location of work in which contract labour is employed / is to be employed in the establishment   *</label>
                                                        <div class="col-lg-3 d-flex">
                                                            <asp:TextBox ID="txtlocation" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">No of days of contract labour *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtdayslabour" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="6" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Estimated date of commencement *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <%--   <asp:TextBox ID="txtEStdate" runat="server" class="date form-control" type="text"></asp:TextBox>
                                                <i class="fi fi-rr-calendar-lines"></i>--%>

                                                            <asp:TextBox runat="server" ID="txtEStdate" class="form-control" onkeypress="validateNumberAndHyphen(event);" MaxLength="10" onblur="validateDateFormat(this)" TabIndex="1" />
                                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MM-yyyy" TargetControlID="txtEStdate"></cc1:CalendarExtender>
                                                            <i class="fi fi-rr-calendar-lines"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Ending Date    *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <%--  <asp:TextBox ID="txtEndDate" runat="server" class="date form-control" type="text"></asp:TextBox>
                                                <i class="fi fi-rr-calendar-lines"></i>--%>

                                                            <asp:TextBox runat="server" ID="txtEndDate" class="form-control" onkeypress="validateNumberAndHyphen(event);" MaxLength="10" onblur="validateDateFormat(this)" TabIndex="1" />
                                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd-MM-yyyy" TargetControlID="txtEndDate"></cc1:CalendarExtender>
                                                            <i class="fi fi-rr-calendar-lines"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-8">
                                                    <div class="form-group row">
                                                        <label class="col-lg-9 col-form-label">Maximum number of contract labour proposed to be employed *</label>
                                                        <div class="col-lg-3 d-flex">
                                                            <asp:TextBox ID="txtMaximumnumber" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="6" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div runat="server" id="MigrantWorkmen" visible="false">
                                            <%--License for Contractors under the Interstate Migrant Workmen Act 1979--%>
                                            <div class="col-md-12 d-flex">
                                                <label class="col-lg-12 col-form-label fw-bold">Other Details</label>
                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-8">
                                                    <div class="form-group row">
                                                        <label class="col-lg-8 col-form-label">Whether the contractor is convicted of any offence within the proceeding five years*</label>
                                                        <div class="col-lg-2">
                                                            <asp:RadioButtonList ID="rblConvicated" runat="server" onchange="validateRadioButtonList(this)" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rblConvicated_SelectedIndexChanged">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4" id="txtcontractor" runat="server" visible="false">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Details *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtDetails" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-8">
                                                    <div class="form-group row">
                                                        <label class="col-lg-8 col-form-label">Whether there was any order against the contractor revoking or suspending license or forfeiting Security Deposit in respect of an earlier contract. * *</label>
                                                        <div class="col-lg-2">
                                                            <asp:RadioButtonList ID="rblrevoking" runat="server" onchange="validateRadioButtonList(this)" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rblrevoking_SelectedIndexChanged">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4" id="suspend" runat="server" visible="false">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Order Date  *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <%--  <asp:TextBox ID="txtOrderDate" runat="server" class="date form-control" type="text"></asp:TextBox>
                                                        <i class="fi fi-rr-calendar-lines"></i>--%>

                                                            <asp:TextBox runat="server" ID="txtOrderDate" class="form-control" onkeypress="validateNumberAndHyphen(event);" TabIndex="1" />
                                                            <%--  <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Format="dd-MM-yyyy" TargetControlID="txtOrderDate"></cc1:CalendarExtender>
                                                        <i class="fi fi-rr-calendar-lines"></i>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-8">
                                                    <div class="form-group row">
                                                        <label class="col-lg-8 col-form-label">Whether the contractor has work in any other establishment within the past five years *</label>
                                                        <div class="col-lg-2">
                                                            <asp:RadioButtonList ID="rblcontractor" runat="server" onchange="validateRadioButtonList(this)" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rblcontractor_SelectedIndexChanged">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4" id="fiveyear" runat="server" visible="false">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Principal's Employers Details    *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtprinciple" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 d-flex" id="nature" runat="server" visible="false">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Establishment's Details </label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtEstablishment" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Nature of work  *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtNature" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>

                                        <div runat="server" id="RegShopEst" visible="false">
                                            <%-- Registration of Shops and Establishment - FORM - A--%>

                                            <div class="col-md-12 d-flex">
                                                <label class="col-lg-12 col-form-label fw-bold">Establishments Details</label>
                                            </div>

                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Name of the Manager /Agent/other person acting in the general management</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtAgent" runat="server" class="form-control" onkeypress="return Names(this)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Address of the Manager/Agent</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtfathername" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Category of Establishmnet *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:DropDownList ID="ddlCategory" onchange="validateDropdown(this)" runat="server" class="form-control">
                                                                <asp:ListItem Text="--Select--" Value="0" />
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Nature of Business *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtNaturebusiness" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Do you have your family members employed in the establishment and residing with and wholly dependent upon you?  </label>
                                                        <div class="col-lg-6" style="align-items: flex-start;">
                                                            <asp:RadioButtonList ID="rblresinding" runat="server" onchange="validateRadioButtonList(this)" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblresinding_SelectedIndexChanged">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Do you have employees working in the establishment? *</label>
                                                        <div class="col-lg-6" style="align-items: flex-start;">
                                                            <asp:RadioButtonList ID="rblestemployee" runat="server" onchange="validateRadioButtonList(this)" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblestemployee_SelectedIndexChanged">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <label class="col-lg-12 col-form-label fw-bold">Details of Employees working in the establishment</label>
                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Name *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtName" runat="server" class="form-control" onkeypress="return Names(this)" TabIndex="1" MaxLength="200" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Gender  </label>
                                                        <div class="col-lg-6">
                                                            <asp:RadioButtonList ID="rblGender" runat="server" onchange="validateRadioButtonList(this)" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblGender_SelectedIndexChanged">
                                                                <asp:ListItem Text="Male" Value="1" />
                                                                <asp:ListItem Text="Female" Value="2" />
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Age *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtages" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="2" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Community *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtCommunity" runat="server" class="form-control" onkeypress="return validateNames(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Full Present Address *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtFulladdress" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Permanent Address [With District & State]  </label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtPermanent" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="200" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Half Day Leave *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtHalfDay" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" MaxLength="5" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Full Day Leave *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtFullDay" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" MaxLength="5" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">Total Number of Employees: *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtTotalEMP" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="10" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 d-flex justify-content-center">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label"></label>
                                                        <div class="col-lg-4 d-flex">
                                                            <asp:Button ID="Addbtn" Text="Add Details" class="btn btn-green btn-rounded" runat="server" OnClick="Addbtn_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="col-md-12 d-flex justify-content-center">
                                                <asp:GridView ID="GVCFOLabour" runat="server" AutoGenerateColumns="False" BorderColor="#003399"
                                                    BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CssClass="GRD" ForeColor="#333333"
                                                    GridLines="None"
                                                    Width="100%" EnableModelValidation="True" Visible="false" OnRowDeleting="GVCFOLabour_RowDeleting">
                                                    <RowStyle BackColor="#ffffff" />
                                                    <Columns>
                                                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />
                                                        <asp:BoundField HeaderText="Name" DataField="CFOLD_NAME" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />
                                                        <asp:BoundField HeaderText="Gender" DataField="CFOLD_GENDER" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />
                                                        <asp:BoundField HeaderText="Age" DataField="CFOLD_AGE" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />
                                                        <asp:BoundField HeaderText="Community" DataField="CFOLD_COMMUNITY" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />
                                                        <asp:BoundField HeaderText="Full Present Address" DataField="CFOLD_FULLADDRESS" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />
                                                        <asp:BoundField HeaderText="Permanent Address [With District & State]" DataField="CFOLD_ADDRESS" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />
                                                        <asp:BoundField HeaderText="Half Day Leave" DataField="CFOLD_HALFDAY" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />
                                                        <asp:BoundField HeaderText="Full Day Leave" DataField="CFOLD_FULLDAY" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />


                                                    </Columns>
                                                    <HeaderStyle BackColor="#013161" Font-Bold="True" ForeColor="White" />
                                                    <AlternatingRowStyle BackColor="White" />
                                                </asp:GridView>
                                            </div>
                                        </div>

                                        <h4 class="card-title ml-3">Upload Below Documents</h4>

                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">1.Form VIII - License issued for recruiting workers from the state of recruitment *</label>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:FileUpload ID="fupLICIssued" runat="server" />
                                                    </div>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:Button Text="Upload" runat="server" ID="btnLICIssued" OnClick="btnLICIssued_Click" class="btn btn-rounded btn-dark mb-4" Width="150px" />
                                                    </div>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:HyperLink ID="hypLICIssued" runat="server" Target="_blank"></asp:HyperLink>
                                                    </div>
                                                    <div class="col-lg-1 d-flex">
                                                        <asp:Label ID="lblLICIssued" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">2. Form X affixed with epic and photograph of all the workmen (single file of all workmen) *</label>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:FileUpload ID="fupFormX" runat="server" />
                                                    </div>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:Button Text="Upload" runat="server" ID="btnFormX" OnClick="btnFormX_Click" class="btn btn-rounded btn-dark mb-4" Width="150px" />
                                                    </div>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:HyperLink ID="hypFormX" runat="server" Target="_blank"></asp:HyperLink>
                                                    </div>
                                                    <div class="col-lg-1 d-flex">
                                                        <asp:Label ID="lblFormX" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">3.Proof of Residence and Criminal antecedents issued by District Magistrates/Additional District Magistrates and Superintendent of Police of the home State of each worker listed in form X  *</label>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:FileUpload ID="fupCriminal" runat="server" />
                                                    </div>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:Button Text="Upload" runat="server" ID="btnCriminal" OnClick="btnCriminal_Click" class="btn btn-rounded btn-dark mb-4" Width="150px" />
                                                    </div>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:HyperLink ID="hypCriminal" runat="server" Target="_blank"></asp:HyperLink>
                                                    </div>
                                                    <asp:Label ID="lblCriminal" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">4.Certificate from Principal Employer  *</label>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:FileUpload ID="fupPrincipalEMP" runat="server" />
                                                    </div>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:Button Text="Upload" runat="server" ID="btnPrincipalEMP" OnClick="btnPrincipalEMP_Click" class="btn btn-rounded btn-dark mb-4" Width="150px" />
                                                    </div>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:HyperLink ID="hypPrincipalEMP" runat="server" Target="_blank"></asp:HyperLink>
                                                    </div>
                                                    <asp:Label ID="lblPrincipalEMP" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">5.Trading / business license granted by the respective District Council (only for non-tribals)  *</label>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:FileUpload ID="fupBusinessLic" runat="server" />
                                                    </div>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:Button Text="Upload" runat="server" ID="btnBusinessLic" OnClick="btnBusinessLic_Click" class="btn btn-rounded btn-dark mb-4" Width="150px" />
                                                    </div>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:HyperLink ID="hypBusinessLic" runat="server" Target="_blank"></asp:HyperLink>
                                                    </div>
                                                    <asp:Label ID="lblBusinessLic" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">6.Registration of establishment of the principal employer  *</label>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:FileUpload ID="fupEST" runat="server" />
                                                    </div>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:Button Text="Upload" runat="server" ID="btnEST" OnClick="btnEST_Click" class="btn btn-rounded btn-dark mb-4" Width="150px" />
                                                    </div>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:HyperLink ID="hypEST" runat="server" Target="_blank"></asp:HyperLink>
                                                    </div>
                                                    <asp:Label ID="lblEST" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">7.Form-V – Certificate from Principal Employer  *</label>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:FileUpload ID="fupForm5" runat="server" />
                                                    </div>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:Button Text="Upload" runat="server" ID="btnForm5" OnClick="btnForm5_Click" class="btn btn-rounded btn-dark mb-4" Width="150px" />
                                                    </div>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:HyperLink ID="hypForm5" runat="server" Target="_blank"></asp:HyperLink>
                                                    </div>
                                                    <asp:Label ID="lblForm5" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">8.Trading Licence from ADC/Municipality  *</label>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:FileUpload ID="fupADC" runat="server" />
                                                    </div>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:Button Text="Upload" runat="server" ID="btnADC" OnClick="btnADC_Click" class="btn btn-rounded btn-dark mb-4" Width="150px" />
                                                    </div>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:HyperLink ID="hypADC" runat="server" Target="_blank"></asp:HyperLink>
                                                    </div>
                                                    <asp:Label ID="lblADC" runat="server" />
                                                </div>
                                            </div>
                                        </div>


                                        <div class="col-md-12 text-right mt-2 mb-2">
                                            <asp:Button ID="btnPrevious" runat="server" Text="Previous" OnClick="btnPrevious_Click" class="btn btn-rounded btn-info btn-lg" Width="150px" />
                                            <asp:Button ID="savebtn" runat="server" OnClick="savebtn_Click" Text="Save" class="btn btn-rounded btn-save btn-lg" Width="150px" />
                                            <asp:Button ID="btnNext" Text="Next" runat="server" OnClick="btnNext_Click" class="btn btn-rounded btn-info btn-lg" Width="150px" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:UpdateProgress ID="UpdateProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div class="update">
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnLICIssued" />
            <asp:PostBackTrigger ControlID="btnFormX" />
            <asp:PostBackTrigger ControlID="btnCriminal" />
            <asp:PostBackTrigger ControlID="btnPrincipalEMP" />
            <asp:PostBackTrigger ControlID="btnBusinessLic" />
            <asp:PostBackTrigger ControlID="btnEST" />
            <asp:PostBackTrigger ControlID="btnForm5" />
            <asp:PostBackTrigger ControlID="btnADC" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
