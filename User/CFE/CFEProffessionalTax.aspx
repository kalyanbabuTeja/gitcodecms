﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="CFEProffessionalTax.aspx.cs" Inherits="MeghalayaUIP.User.CFE.CFEProffessionalTax" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    <script src="../../assets/admin/js/form-validation.js" type="text/javascript"></script>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div class="page-wrapper" id="divText" runat="server">
                <div class="content container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Proffessional Tax Details</h4>
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
                                    <div class="row">
                                        <div class="col-md-12 d-flex">
                                            <label class="col-lg-12 col-form-label fw-bold"><span style="font-weight: 900;">Application Type</span></label>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-11">
                                                <div class="form-group row">
                                                    <label class="col-lg-2 col-form-label">Apply As *</label>
                                                    <div class="col-lg-8">
                                                        <asp:RadioButtonList ID="rblApply" runat="server" RepeatDirection="Horizontal" onchange="validateRadioButtonList(this)">
                                                            <asp:ListItem Text="Individual" Value="1" />
                                                            <asp:ListItem Text="Firm" Value="2" />
                                                            <asp:ListItem Text="Company" Value="3"></asp:ListItem>
                                                            <asp:ListItem Text="Corporation" Value="4"></asp:ListItem>
                                                            <asp:ListItem Text="Society" Value="5"></asp:ListItem>
                                                            <asp:ListItem Text="Club" Value="6"></asp:ListItem>
                                                            <asp:ListItem Text="Association" Value="7"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12 d-flex">
                                            <label class="col-lg-12 col-form-label fw-bold"><span style="font-weight: 900;">Establishment Details</span></label>
                                        </div>
                                        <div class="col-md-12 d-flex" id="EstblishDetails" runat="server" visible="false">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Name of Establishment *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtEstDet" runat="server" class="form-control" onkeypress="return Names()" TabIndex="1" MaxLength="200" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Address of Establishment *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtadd" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="300" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">District of Establishment *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:DropDownList runat="server" ID="ddlDistric" class="form-control" onchange="validateDropdown(this)">
                                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex" id="EstabishComment" runat="server" visible="false">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Pin Code of Establishment *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtPincode" runat="server" class="form-control" onkeypress="return validatePincode(event)" MaxLength="6" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Total number of Employees working in Establishment</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtEmployeeESt" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="6" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Date of commencement *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <%--   <asp:TextBox ID="txtDate" runat="server" class="date form-control"></asp:TextBox>
                                                        <i class="fi fi-rr-calendar-lines"></i>--%>
                                                        <asp:TextBox runat="server" ID="txtDate" class="form-control" TabIndex="1" onkeypress="validateNumberAndHyphen();" onblur="validateDateFormat(this)" MaxLength="10" onkeyup="handleKeyUp(this)" />
                                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MM-yyyy" TargetControlID="txtDate"></cc1:CalendarExtender>
                                                        <i class="fi fi-rr-calendar-lines"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-8" runat="server" visible="false">
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label">Constitution of Establishment *</label>
                                                    <div class="col-lg-8">
                                                        <asp:RadioButtonList ID="rblConstitution" runat="server" RepeatDirection="Horizontal"  onchange="validateRadioButtonList(this)">
                                                            <asp:ListItem Text="Proprietor" Value="1" />
                                                            <asp:ListItem Text="Partnership" Value="2" />
                                                            <asp:ListItem Text="Company" Value="3"></asp:ListItem>
                                                            <asp:ListItem Text="Association of Persons" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Description of Goods and Services supplied by the Establishment *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtGoodssupplie" runat="server" class="form-control" TextMode="MultiLine" MaxLength="200" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Additional Place of Business *</label>
                                                    <div class="col-lg-6">
                                                        <asp:RadioButtonList ID="rblAdditional" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rblAdditional_SelectedIndexChanged">
                                                            <asp:ListItem Text="Yes" Value="Y" />
                                                            <asp:ListItem Text="No" Value="N" />
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <label class="col-lg-12 col-form-label fw-bold"><span style="font-weight: 900;">Additional Business Details</label>
                                        </div>
                                        <div class="col-md-12 d-flex" id="Business" runat="server" visible="false">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Place of Business* </label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtBusiness" runat="server" class="form-control" onkeypress="return Names()" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Address* </label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtAddress" runat="server" class="form-control" onkeypress="return validateNameAndNumbers(event)" MaxLength="200" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">District *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:DropDownList runat="server" ID="ddldist" class="form-control" onchange="validateDropdown(this)">
                                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-12 d-flex" id="Div1" runat="server" visible="false">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Total working employees *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtEMP" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="7" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Button ID="btnAdd" Text="Add Details" OnClick="btnAdd_Click" class="btn btn-rounded btn-green" runat="server" Width="110px" />
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex"></div>
                                        <div class="col-md-12 d-flex justify-content-center">
                                            <asp:GridView ID="GVState" runat="server" AutoGenerateColumns="False" BorderColor="#003399"
                                                BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CssClass="GRD" ForeColor="#333333"
                                                GridLines="None"
                                                Width="100%" EnableModelValidation="True" Visible="false" OnRowDeleting="GVState_RowDeleting">
                                                <RowStyle BackColor="#ffffff" />
                                                <Columns>
                                                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />
                                                    <asp:BoundField HeaderText="Place of Business" DataField="CFEPB_PLACEOFBUSINESS" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />
                                                    <asp:BoundField HeaderText="Address" DataField="CFEPB_ADDRESS" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />
                                                    <asp:BoundField HeaderText="District" DataField="CFEPB_DISTRIC" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />
                                                    <asp:BoundField HeaderText="Total working employees" DataField="CFEPB_TOTALWORKINGEMP" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />

                                                </Columns>
                                                <HeaderStyle BackColor="#013161" Font-Bold="True" ForeColor="White" />
                                                <AlternatingRowStyle BackColor="White" />
                                            </asp:GridView>
                                        </div>

                                        <div class="col-md-12 d-flex">
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <label class="col-lg-12 col-form-label fw-bold"><span style="font-weight: 900;">Applicant's Designation</span></label>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-lg-2 col-form-label">Please Select Designation  *</label>
                                                    <div class="col-lg-6">
                                                        <asp:RadioButtonList ID="rblDesignation" runat="server" RepeatDirection="Horizontal"  onchange="validateRadioButtonList(this)">
                                                            <asp:ListItem Text="Proprietor" Value="1" />
                                                            <asp:ListItem Text="Partner" Value="2" />
                                                            <asp:ListItem Text=" Principal Officer" Value="3"></asp:ListItem>
                                                            <asp:ListItem Text="Agent" Value="4"></asp:ListItem>
                                                            <asp:ListItem Text="Manager" Value="5"></asp:ListItem>
                                                            <asp:ListItem Text="Director" Value="6"></asp:ListItem>
                                                            <asp:ListItem Text="Secretary" Value="7"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Do you have registration under any other act? *</label>
                                                    <div class="col-lg-6">
                                                        <asp:RadioButtonList ID="rblother" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rblother_SelectedIndexChanged">
                                                            <asp:ListItem Text="Yes" Value="Y" />
                                                            <asp:ListItem Text="No" Value="N" />
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4" id="RegistrationType" runat="server" visible="false">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Registration Type *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:DropDownList runat="server" ID="ddlRegType" class="form-control" onchange="validateDropdown(this)">
                                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4" id="RegNo" runat="server" visible="false">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Regisration No*</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="TXTRegNo" runat="server" class="form-control" onkeypress="return validateNumbersOnly(event)" MaxLength="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                        </div>
                                        <div class="col-md-12 text-right mt-2 mb-2">

                                            <asp:Button Text="Previous" runat="server" ID="btnPrevious" OnClick="btnPrevious_Click" class="btn btn-rounded btn-info btn-lg" Width="150px" />
                                            <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" class="btn btn-rounded btn-save btn-lg" Width="150px" />
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
    </asp:UpdatePanel>
</asp:Content>
