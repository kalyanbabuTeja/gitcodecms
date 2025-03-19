﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="CFEIndustryDetails.aspx.cs" Inherits="MeghalayaUIP.User.CFE.CFEIndustryDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../assets/admin/js/form-validation.js" type="text/javascript"></script>
    <script type="text/javascript">
    function handleKeyUp(input) {
        if (input.value.trim() === "") {
            input.style.border = "2px solid red";
        } else {
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
                    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="#">Pre Establishment</a></li>

                    <li class="breadcrumb-item active" aria-current="page">Industry Details</li>
                </ol>
            </nav>
            <div class="page-wrapper" id="divText" runat="server">
                <div class="content container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Details of Authorised Representative and Unit Location </h3>
                                </div>
                                <div class="card-body">
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
                                    <asp:HiddenField ID="hdnPreRegUID" runat="server" />

                                    <div class="row">
                                        <div runat="server" visible="false">
                                            <div class="col-md-12 d-flex">
                                                <h4 class="card-title ml-3">Organization Details: </h4>
                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">1. Name of Firm<span class="star">*</span></label>
                                                        <div class="col-lg-6">
                                                            <asp:TextBox ID="txtIndustryName" runat="server" class="form-control" onkeypress="return validateNames(event)" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">
                                                            2. Type of
														Firm <span class="star">*</span></label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:DropDownList ID="ddlCompanyType" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">3. Firm Proposal <span class="star">*</span></label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:DropDownList ID="rblproposal" runat="server" TabIndex="1" class="form-control" Enabled="false" onchange="validateDropdown(this)">
                                                                <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                                <asp:ListItem Value="New" Text="New"></asp:ListItem>
                                                                <asp:ListItem Value="Existing" Text="Existing"></asp:ListItem>
                                                                <asp:ListItem Value="Expansion" Text="Expansion"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--   <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">3. Company Proposal *<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:RadioButtonList ID="rblproposal" runat="server" RepeatDirection="Horizontal">
                                                            <asp:ListItem Value="New" Text="New"></asp:ListItem>
                                                            <asp:ListItem Value="Expansion" Text="Expansion"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                            </div>--%>
                                            </div>
                                            <div class="col-md-12  d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">
                                                            4. Registration Category <span class="star">*</span></label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:DropDownList ID="ddlRegType" runat="server" class="form-control" OnSelectedIndexChanged="ddlRegType_SelectedIndexChanged" onchange="validateDropdown(this)" AutoPostBack="true">
                                                                <asp:ListItem Text="Select Category" Value="0" />
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label" id="lblregntype" runat="server"></label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox runat="server" ID="txtUdyamorIEMNo" Enabled="false" TabIndex="1" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="30" onkeyup="handleKeyUp(this)" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">
                                                            6. Registration Date <span class="star">*</span></label>
                                                        <div class="col-lg-6 d-flex">
                                                            <%--<asp:TextBox ID="txtRegDate" runat="server" class="form-control" onkeypress="datefunction(date_input)"></asp:TextBox>--%>

                                                            <%-- <asp:TextBox ID="txtRegDate" runat="server" TabIndex="1" ValidationGroup="group" class="date form-control"></asp:TextBox>
                                                            <i class="fi fi-rr-calendar-lines"></i>--%>
                                                            <asp:TextBox runat="server" ID="txtRegDate" class="form-control" onkeypress="validateNumberAndHyphen(event);" MaxLength="10" onblur="validateDateFormat(this)" TabIndex="1" onkeyup="handleKeyUp(this)" />
                                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MM-yyyy" TargetControlID="txtRegDate"></cc1:CalendarExtender>
                                                            <i class="fi fi-rr-calendar-lines"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12  d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">7. Type of Factory*<span class="star">*</span></label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:DropDownList ID="ddlFactories" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                                <asp:ListItem Text="--Select--" Value="0" />
                                                                <asp:ListItem Text="Hazardous" Value="Hazardous"></asp:ListItem>
                                                                <asp:ListItem Text="Non Hazardous" Value="Non Hazardous"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <h4 class="card-title ml-3">Authorised Representative Details: </h4>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">
                                                        1. Name
                                                    <span class="star">*</span></label>
                                                    <div class="col-lg-6">
                                                        <asp:TextBox ID="txtPromoterName" runat="server" class="form-control" onkeypress="return validateNames(event)" MaxLength="50" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">
                                                        2.
														S/o.D/o.W/o<span class="star">*</span></label>
                                                    <div class="col-lg-6">
                                                        <asp:TextBox ID="txtSoWoDo" runat="server" class="form-control" onkeypress="return validateNames(event)" MaxLength="50" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">3. Email<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" onblur="validateEmail(event)" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">4. Mobile No<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtMobileno" runat="server" class="form-control" onkeypress="return PhoneNumberOnly(event)" MaxLength="10" onblur="validateIndianMobileNumber(this);" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">
                                                        5. Alternative Mobile
														No <span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtAltMobile" runat="server" class="form-control" onkeypress="return PhoneNumberOnly(event)" MaxLength="10" onblur="validateIndianMobileNumber(this);" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">
                                                        6. Landline Tel No
                                                    </label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtLandlineno" runat="server" class="form-control" onkeypress="validateNumberAndHyphen();" MaxLength="8" TabIndex="1" onkeyup="handleKeyUp(this)" ></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">7. Door No<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtDoorNo" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="30" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">8. Locality<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtLocality" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" TabIndex="1" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">9. District<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:DropDownList ID="ddlDistric" runat="server" class="form-control" OnSelectedIndexChanged="ddlDistric_SelectedIndexChanged" onchange="validateDropdown(this)" AutoPostBack="true">
                                                            <asp:ListItem Text="Select Distric" Value="0" />
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>

                                        <div class="col-md-12 d-flex">

                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">10. Mandal<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:DropDownList ID="ddlMandal" runat="server" class="form-control" OnSelectedIndexChanged="ddlMandal_SelectedIndexChanged" onchange="validateDropdown(this)" AutoPostBack="true">
                                                            <asp:ListItem Text="Select Mandal" Value="0" />
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">11. Village/Town<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:DropDownList ID="ddlVillage" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                            <asp:ListItem Text="Select Village" Value="0" />
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">12. Pincode<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtpincode" runat="server" class="form-control" onkeypress="return validatePincode(event)" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12  d-flex">

                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">
                                                        13. Women
														Entrepreneur<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:RadioButtonList ID="rblWomen" runat="server" RepeatDirection="Horizontal" onchange="validateRadioButtonList(this)">
                                                            <asp:ListItem Text="Yes" Value="Y" />
                                                            <asp:ListItem Text="No" Value="N" />
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">
                                                        14. Differently
														Abled<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:RadioButtonList ID="rblAbled" runat="server" RepeatDirection="Horizontal" onchange="validateRadioButtonList(this)">
                                                            <asp:ListItem Text="Yes" Value="Y" />
                                                            <asp:ListItem Text="No" Value="N" />
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12  d-flex">
                                        </div>

                                        <h4 class="card-title ml-3">Unit Location Details: </h4>

                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">1. Proposed Area for Development(in Sq. mts)<span class="star">*</span></label>
                                                    <div class="col-lg-6">
                                                        <asp:TextBox ID="txtDevelopmentArea" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" MaxLength="8" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">2. Type of Approach Road<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:DropDownList ID="ddlApproachRoad" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                            <asp:ListItem Text="--Select--" Value="0" />
                                                            <asp:ListItem Text="BLACK TOP" Value="BLACK TOP" />
                                                            <asp:ListItem Text="CC" Value="CC" />
                                                            <asp:ListItem Text="GRAVEL" Value="GRAVEL" />
                                                            <asp:ListItem Text="WBM" Value="WBM" />
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">3. Existing Width of Approach Road(in feet)<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtExstngWidth" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" MaxLength="7" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">4. Affected in Road Widening<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex radio">
                                                        <asp:RadioButtonList ID="rblAffectedroad" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rblAffectedroad_SelectedIndexChanged">
                                                            <asp:ListItem Text="Yes" Value="Y" />
                                                            <asp:ListItem Text="No" Value="N" />
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4" runat="server" id="divAffectArea" visible="false">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">5. 	Extend of affected area in sq.mts<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtAffectedArea" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" MaxLength="20" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <h4 class="card-title ml-3">Other Details: </h4>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">1. Architect Name <span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtArchitectName" runat="server" class="form-control" onkeypress="return validateNames(event)" MaxLength="50" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">2. Architect License No.<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">

                                                        <asp:TextBox ID="txtArchitectLicNo" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="50" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">3. Architect Mobile No.<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtArchitectMobileno" runat="server" class="form-control" onkeypress="return PhoneNumberOnly(event)" MaxLength="10" onblur="validateIndianMobileNumber(this);" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">4.Structural Engineer Name<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtStrEngnrName" runat="server" class="form-control" onkeypress="return Names()" MaxLength="50" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">5.	Structural License No.<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtStrLicNo" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="50" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">6.	Structural Mobile No<span class="star">*</span></label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtStrEngnrMobileno" runat="server" class="form-control" onkeypress="return PhoneNumberOnly(event)" MaxLength="10" onblur="validateIndianMobileNumber(this);" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <h4 class="card-title ml-3">Employment Details: </h4>
                                        <div class="col-md-3">
                                            <div class="form-group row">
                                                <label class="col-lg-6">(Total Employee:</label>
                                                <div>
                                                    <asp:Label ID="lbltotalEmp" runat="server" CssClass="font-weight-600"> </asp:Label>)
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">1. Direct Male<span class="star">*</span></label>
                                                    <div class="col-lg-6">
                                                        <asp:TextBox ID="txtMale" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="5" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">2.Direct Female<span class="star">*</span></label>
                                                    <div class="col-lg-6">
                                                        <asp:TextBox ID="txtFemale" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="5" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">3. Direct Other Employee<span class="star">*</span></label>
                                                    <div class="col-lg-6">
                                                        <asp:TextBox ID="txtDirectOthers" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="5" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">4. Indirect Male<span class="star">*</span></label>
                                                    <div class="col-lg-6">
                                                        <asp:TextBox ID="txtIndirectMale" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="5" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">5. Indirect Female<span class="star">*</span></label>
                                                    <div class="col-lg-6">
                                                        <asp:TextBox ID="txtIndirectFemale" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="5" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">6. Indirect Other Employee<span class="star">*</span></label>
                                                    <div class="col-lg-6">
                                                        <asp:TextBox ID="txtInDirectOthers" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="5" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <h4 id="hdngRdCtng" visible="false" runat="server" class="card-title ml-3">Road Cutting Details</h4>
                                        <div class="col-md-12 d-flex" id="divRDctng" runat="server" visible="false">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">1. Length of road to be cut: (in mtrs) <span class="star">*</span></label>
                                                    <div class="col-lg-6">
                                                        <asp:TextBox ID="txtRdCutlenght" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" MaxLength="9" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">2. Number of locations <span class="star">*</span></label>
                                                    <div class="col-lg-6">
                                                        <asp:TextBox ID="txtRdCutLocations" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="3" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 text-right mb-2">
                                    <asp:Button Text="Previous" runat="server" ID="btnPrevious" OnClick="btnPrevious_Click" class="btn btn-rounded btn-info btn-lg" Width="150px" />
                                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" class="btn btn-rounded btn-success btn-lg" Width="150px" />
                                    <asp:Button ID="btnNext" Text="Next" runat="server" OnClick="btnNext_Click" class="btn btn-rounded btn-info btn-lg" Width="150px" />

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
    </asp:UpdatePanel>
</asp:Content>
