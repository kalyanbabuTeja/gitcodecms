﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="CFEFireDetails.aspx.cs" Inherits="MeghalayaUIP.User.CFE.CFEFireDetails" %>

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
    </script>
    <script src="../../assets/admin/js/form-validation.js" type="text/javascript"></script>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="../Dashboard/Dashboarddrill.aspx">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="CFEUserDashboard.aspx">Pre Establishment</a></li>

                    <li class="breadcrumb-item active" aria-current="page">Fire Details</li>
                </ol>
            </nav>
            <div class="page-wrapper" id="divText" runat="server">

                <div class="content container-fluid">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Fire Details</h3>
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

                                        <%--<h5 class="card-title ml-4">Location and address of the proposed building*</h5>--%>
                                        <%--          <div class="col-md-12 d-flex">
                                    <label class="col-lg-12 col-form-label fw-bold"></label>


                                </div>--%>
                                        <div id="Location" runat="server" visible="false">
                                            <h4 class="card-title ml-3">Location and address of the proposed building</h4>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">1. District*</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:DropDownList ID="ddldistric" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddldistric_SelectedIndexChanged">
                                                                <asp:ListItem Text="--Select--" Value="0" />
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">2. Mandal*</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:DropDownList ID="ddlmandal" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlmandal_SelectedIndexChanged">
                                                                <asp:ListItem Text="--Select--" Value="0" />
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">3. Village*</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:DropDownList ID="ddlvillage" runat="server" class="form-control">
                                                                <asp:ListItem Text="--Select--" Value="0" />
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 d-flex">
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">4. Locality *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtLocality" runat="server" class="form-control" onkeypress="return Address(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">5. Nearest Landmark *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtlandmark" runat="server" class="form-control" onkeypress="return Address(event)" MaxLength="100" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group row">
                                                        <label class="col-lg-6 col-form-label">6. Pincode *</label>
                                                        <div class="col-lg-6 d-flex">
                                                            <asp:TextBox ID="txtpincode" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="6" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <h4 class="card-title ml-3">Other Details</h4>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">1. Height of the building (in mtrs.) *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtheight" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" MaxLength="7" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">2. Height of each floor (in mtrs.)*(min 2.9 mtrs) </label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtheightfloor" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" MaxLength="7" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">3. Plot Area (in Sq m) *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtplot" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" MaxLength="7" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">4. Proposed build up area (in Sq m) *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtbuildup" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" MaxLength="7" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">5. Proposed Drive way (Breadth with units in meters)  *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtdriveway" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" TabIndex="1" MaxLength="7" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">6. Existing or proposed Approach Road (Breadth with units in meters)*</label>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:TextBox ID="txtBreadth" runat="server" class="form-control" onkeypress="return validateNumberAndDot(event)" MaxLength="7" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">7. Category of Building for which Fire Clearance is applied *</label>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:DropDownList ID="ddlbuilding" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                            <asp:ListItem Text="--Select--" Value="0" />
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">8. Fee Amount in Rs (Note: This is an aprrox. value. The amount may change tentatively)</label>
                                                    <div class="col-lg-2 d-flex">
                                                        <asp:TextBox ID="txtAmount" runat="server" class="form-control" onkeypress="return validateAmount(event)" MaxLength="9" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <label class="col-lg-12 col-form-label fw-bold"><span style="font-weight: 900;"></span></label>

                                        </div>
                                        <h4 class="card-title ml-3">Other Details</h4>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">1 (a).                                                                          East *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtEast" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="200" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">1   (b). Distance from proposed Building (in meters)    *</label>
                                                    <div class="col-lg-4 d-flex">
                                                        <asp:TextBox ID="txtdistance" runat="server" class="form-control" onkeypress="return NumberOnly()" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">2  (a). West  *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtWest" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="200" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">2   (b). Distance from proposed Building (in meters)    *</label>
                                                    <div class="col-lg-4 d-flex">
                                                        <asp:TextBox ID="txtbuilding" runat="server" class="form-control" onkeypress="return NumberOnly()" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">3  (a). North  *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtnorth" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="200" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">3  (b). Distance from proposed Building (in meters)    *</label>
                                                    <div class="col-lg-4 d-flex">
                                                        <asp:TextBox ID="txtproposedbuid" runat="server" class="form-control" onkeypress="return NumberOnly()" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">4  (a). South   *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtsouth" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="200" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">4 (b).  Distance from proposed Building (in meters)     *</label>
                                                    <div class="col-lg-4 d-flex">
                                                        <asp:TextBox ID="txtdistancebuild" runat="server" class="form-control" onkeypress="return NumberOnly()" TabIndex="1" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-8">
                                                <div class="form-group row">
                                                    <label class="col-lg-6 col-form-label">Distance from the nearest Fire Station (in meters)    *</label>
                                                    <div class="col-lg-6 d-flex">
                                                        <asp:TextBox ID="txtstation" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="7" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <h4 class="card-title ml-3">Upload Document</h4>

                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label">1.Blueprint of Building i.e. Building Plan as per NBC  *</label>
                                                    <div class="col-lg-3 d-flex">
                                                        <asp:FileUpload ID="fupBuildingplan" runat="server" />
                                                    </div>
                                                    <div class="col-lg-1 d-flex">
                                                        <asp:Button Text="Upload" runat="server" ID="btnbuildingplan" OnClick="btnbuildingplan_Click" class="btn btn-rounded btn-dark mb-4" Width="150px" />
                                                    </div>
                                                    <div class="col-lg-3 d-flex">
                                                        <asp:HyperLink ID="hypbuildingplan" runat="server" Target="_blank"></asp:HyperLink>
                                                    </div>
                                                    <asp:Label ID="lblbuildingplan" runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12 d-flex">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label">2.Fire Lay out Plan  *</label>
                                                    <div class="col-lg-3 d-flex">
                                                        <asp:FileUpload ID="fupfireplan" runat="server" />
                                                    </div>
                                                    <div class="col-lg-1 d-flex">
                                                        <asp:Button Text="Upload" runat="server" ID="btnfireplan" OnClick="btnfireplan_Click" class="btn btn-rounded btn-dark mb-4" Width="150px" />
                                                    </div>
                                                    <div class="col-lg-3 d-flex">
                                                        <asp:HyperLink ID="hypfireplan" runat="server" Target="_blank"></asp:HyperLink>
                                                    </div>
                                                    <asp:Label ID="lblfireplan" runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12 text-right mt-3 mb-3">

                                            <asp:Button ID="btnPrevious" runat="server" Text="Previous" OnClick="btnPrevious_Click" class="btn btn-rounded btn-info btn-lg" Width="150px" />
                                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" class="btn btn-rounded btn-save btn-lg" Width="150px" />
                                            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" class="btn btn-rounded btn-info btn-lg" Width="150px" />

                                        </div>
                                        <%-- <div class="col-md-12 d-flex mt-2">
                                    <div class="col-md-6">
                                        <asp:Button Text="Previous" runat="server" ID="btnPreviuos1" class="btn  btn-info btn-lg" />
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" class="btn btn-rounded btn-info btn-lg" padding-right="10px" BackColor="Green" />
                                        <asp:Button ID="btnNext" Text="Next" runat="server" class="btn  btn-info btn-lg" />

                                    </div>
                                </div>--%>
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
            <asp:PostBackTrigger ControlID="btnbuildingplan" />
            <asp:PostBackTrigger ControlID="btnfireplan" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
