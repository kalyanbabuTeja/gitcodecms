﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Dept/dept.Master" AutoEventWireup="true" CodeBehind="RENApplDeptdrill.aspx.cs" Inherits="MeghalayaUIP.Dept.Renewal.RENApplDeptdrill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../assets/admin/css/deptdashbaords.css" rel="stylesheet" />
    <link href="../../assets/admin/css/deptdashboard3.css" rel="stylesheet" />
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="../Dashboard/DeptDashBoard.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page">Renewal</li>
        </ol>
    </nav>
    <div class="page-wrapper cfeappldeptdrill">
        <div class="content container-fluid">
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
            <div class="card-header d-flex  justify-content-between">
                <h4 class="card-title mt-1" style="font-size: 18px !important;"><b>Renewal Applications with Time Lines</b></h4>
                <div class="col-md-1">
                    <asp:LinkButton ID="lbtnBack" runat="server" Text="Back" OnClick="lbtnBack_Click" CssClass="btn btn-sm btn-dark"><i class="fi fi-br-angle-double-small-left" style="position: absolute;margin-left: 32px;margin-top: 3px;"></i> Back&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:LinkButton>
                </div>
            </div>
            <div class="col-md-12 d-flex row mb-3">

                <div class="col-md-2">Applications Status</div>
                <div class="col-md-2 d-flex">
                    <spna class="dots">:&nbsp;&nbsp;</spna>
                    <asp:DropDownList ID="ddlStatus" runat="server" class="form-control" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                        <asp:ListItem Value="ScrutinyCompleted" Text="Pre-Scrutiny-Completed"></asp:ListItem>
                        <asp:ListItem Value="ScrutinyPending" Text="Pre-Scrutiny-Pending"></asp:ListItem>
                        <asp:ListItem Value="ScrutinyRejected" Text="Pre-Scrutiny-Rejected"></asp:ListItem>
                        <asp:ListItem Value="ApprovalIssued" Text="Approval Issued"></asp:ListItem>
                        <asp:ListItem Value="ApprovalPending" Text="Approval Pending"></asp:ListItem>
                        <asp:ListItem Value="ApprovalRejected" Text="Approval Rejected"></asp:ListItem>
                        <asp:ListItem Value="OfflinePending" Text="Offline Approval Pending"></asp:ListItem>
                        <asp:ListItem Value="OfflineApproved" Text="Offline Approval Issued"></asp:ListItem>
                    </asp:DropDownList>

                </div>
                <div class="col-md-8">&nbsp;</div>
            </div>
            <%--*************************************--%>
            <div class="card" id="Prescrutinycompleted" runat="server" visible="false">
                <div class="card-header">
                    <h3>Pre-Scrutiny-Completed</h3>
                </div>
                <section id="dashboardcount3" class="mt-3 mb-3">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=PRESCRUTINYCOMPLETED">
                                    <div class="card 1">
                                        <div class="card-headr">
                                            <div class="text">Total</div>
                                            <div class="iocn"><i class="fi fi-tr-memo-circle-check"></i></div>
                                            <div class="count">
                                                <asp:Label ID="lblPRESCRUTINYCOMPLETED" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=PRESCRUTINYCOMPLETEDWITHIN">
                                    <div class="card 2">
                                        <div class="card-headr">
                                            <div class="text">Within Time Limits</div>
                                            <div class="iocn"><i class="fi fi-tr-file-download"></i></div>
                                            <div class="count">
                                                <asp:Label ID="LBLPRESCRUTINYCOMPLETEDWITHIN" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=PRESCRUTINYCOMPLETEDBEYOND">
                                    <div class="card 4">
                                        <div class="card-headr">
                                            <div class="text">Beyondin Time Limits</div>
                                            <div class="iocn"><i class="fi fi-tr-file-upload"></i></div>
                                            <div class="count">
                                                <asp:Label ID="LBLPRESCRUTINYCOMPLETEDBEYOND" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <%--*************************************--%>
            <div class="card" id="PrescrutinyPending" runat="server" visible="false">
                <div class="card-header">
                    <h3>Pre-Scrutiny-Pending</h3>
                </div>
                <section id="dashboardcount3" class="mt-3 mb-3">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=PRESCRUTINYPENDING">
                                    <div class="card 1">
                                        <div class="card-headr">
                                            <div class="text">Total</div>
                                            <div class="iocn"><i class="fi fi-tr-memo-circle-check"></i></div>
                                            <div class="count">
                                                <asp:Label ID="LBLPRESCRUTINYPENDING" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=PRESCRUTINYPENDINGWITHIN">
                                    <div class="card 2">
                                        <div class="card-headr">
                                            <div class="text">Within Time Limits</div>
                                            <div class="iocn"><i class="fi fi-tr-file-download"></i></div>
                                            <div class="count">
                                                <asp:Label ID="LBLPRESCRUTINYPENDINGWITHIN" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=PRESCRUTINYPENDINGBEYOND">
                                    <div class="card 4">
                                        <div class="card-headr">
                                            <div class="text">Beyondin Time Limits</div>
                                            <div class="iocn"><i class="fi fi-tr-file-upload"></i></div>
                                            <div class="count">
                                                <asp:Label ID="LBLPRESCRUTINYPENDINGBEYOND" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <div class="card 3">
                                    <div class="card-headr">
                                        <div class="text">Today Last Day</div>
                                        <div class="iocn"><i class="fi fi-tr-file-circle-info"></i></div>
                                        <div class="count">
                                            <asp:Label ID="Label3" runat="server"></asp:Label>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <div class="card" id="PreScrutinyRejected" runat="server" visible="false">
                <div class="card-header">
                    <h3>Pre-Scrutiny-Rejected</h3>
                </div>
                <section id="dashboardcount3" class="mt-3 mb-3">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=PREREJECTED">
                                    <div class="card 1">
                                        <div class="card-headr">
                                            <div class="text">Total</div>
                                            <div class="iocn"><i class="fi fi-tr-memo-circle-check"></i></div>
                                            <div class="count">
                                                <asp:Label ID="lblPREREJECTED" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=PREREJECTEDWITHIN">
                                    <div class="card 2">
                                        <div class="card-headr">
                                            <div class="text">Within Time Limits</div>
                                            <div class="iocn"><i class="fi fi-tr-file-download"></i></div>
                                            <div class="count">
                                                <asp:Label ID="LBLPREREJECTEDWITHIN" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=PREREJECTEDBEYOND">
                                    <div class="card 4">
                                        <div class="card-headr">
                                            <div class="text">Beyondin Time Limits</div>
                                            <div class="iocn"><i class="fi fi-tr-file-upload"></i></div>
                                            <div class="count">
                                                <asp:Label ID="LBLPREREJECTEDBEYOND" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <%--*************************************--%>
            <div class="card" id="Approvalunderprocess" runat="server" visible="false">
                <div class="card-header">
                    <h3>Approval Under Process</h3>
                </div>
                <section id="dashboardcount3" class="mt-3 mb-3">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=APPROVALPENDING">
                                    <div class="card 1">
                                        <div class="card-headr">
                                            <div class="text">Total</div>
                                            <div class="iocn"><i class="fi fi-tr-memo-circle-check"></i></div>
                                            <div class="count">
                                                <asp:Label ID="LBLAPPROVALPENDING" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=APPROVALPENDINGWITHIN">
                                    <div class="card 2">
                                        <div class="card-headr">
                                            <div class="text">Within Time Limits</div>
                                            <div class="iocn"><i class="fi fi-tr-file-download"></i></div>
                                            <div class="count">
                                                <asp:Label ID="LBLAPPROVALPENDINGWITHIN" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=APPROVALPENDINGBEYOND">
                                    <div class="card 4">
                                        <div class="card-headr">
                                            <div class="text">Beyondin Time Limits</div>
                                            <div class="iocn"><i class="fi fi-tr-file-upload"></i></div>
                                            <div class="count">
                                                <asp:Label ID="LBLAPPROVALPENDINGBEYOND" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <div class="card 3">
                                    <div class="card-headr">
                                        <div class="text">Today Last Day</div>
                                        <div class="iocn"><i class="fi fi-tr-file-exclamation"></i></div>
                                        <div class="count">
                                            <asp:Label ID="Label7" runat="server"></asp:Label>
                                        </div>
                                    </div>

                                </div>
                            </div>




                        </div>
                    </div>
                </section>
            </div>
            <%--*************************************--%>
            <div class="card" id="ApprovalIssued" runat="server" visible="false">
                <div class="card-header">
                    <h3>Approval Issued</h3>
                </div>
                <section id="dashboardcount3" class="mt-3 mb-3">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=TOTALAPPROVALISSUED">
                                    <div class="card 1">
                                        <div class="card-headr">
                                            <div class="text">Total</div>
                                            <div class="iocn"><i class="fi fi-tr-memo-circle-check"></i></div>
                                            <div class="count">
                                                <asp:Label ID="LBLTOTALAPPROVALISSUED" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=APPROVALISSUEDWITHIN">
                                    <div class="card 2">
                                        <div class="card-headr">
                                            <div class="text">Within Time Limits</div>
                                            <div class="iocn"><i class="fi fi-tr-file-download"></i></div>
                                            <div class="count">
                                                <asp:Label ID="LBLAPPROVALISSUEDWITHIN" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=APPROVALISSUEDBEYOND">
                                    <div class="card 4">
                                        <div class="card-headr">
                                            <div class="text">Beyondin Time Limits</div>
                                            <div class="iocn"><i class="fi fi-tr-file-upload"></i></div>
                                            <div class="count">
                                                <asp:Label ID="LBLAPPROVALISSUEDBEYOND" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>

                        </div>
                    </div>
                </section>
            </div>

            <div class="card" id="ApprovalRejected" runat="server" visible="false">
                <div class="card-header">
                    <h3>Approval Rejected</h3>
                </div>
                <section id="dashboardcount3" class="mt-3 mb-3">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=REJECTED">
                                    <div class="card 1">
                                        <div class="card-headr">
                                            <div class="text">Total</div>
                                            <div class="iocn"><i class="fi fi-tr-memo-circle-check"></i></div>
                                            <div class="count">
                                                <asp:Label ID="lblREJECTED" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=REJECTEDWITHIN">
                                    <div class="card 2">
                                        <div class="card-headr">
                                            <div class="text">Within Time Limits</div>
                                            <div class="iocn"><i class="fi fi-tr-file-download"></i></div>
                                            <div class="count">
                                                <asp:Label ID="lblREJECTEDWITHIN" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=REJECTEDBEYOND">
                                    <div class="card 4">
                                        <div class="card-headr">
                                            <div class="text">Beyondin Time Limits</div>
                                            <div class="iocn"><i class="fi fi-tr-file-upload"></i></div>
                                            <div class="count">
                                                <asp:Label ID="lblREJECTEDBEYOND" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>

                        </div>
                    </div>
                </section>
            </div>
            <div class="card" id="OfflineApprovalPending" runat="server" visible="false">
                <div class="card-header">
                    <h3>Offiline Approvals Pending</h3>
                </div>
                <section id="dashboardcount4" class="mt-3 mb-3">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=OFFLINEPENDING">
                                    <div class="card 1">
                                        <div class="card-headr">
                                            <div class="text">Total</div>
                                            <div class="iocn"><i class="fi fi-tr-memo-circle-check"></i></div>
                                            <div class="count">
                                                <asp:Label ID="lblOFFLINEPENDING" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=OFFLINEPENDINGWITHIN">
                                    <div class="card 2">
                                        <div class="card-headr">
                                            <div class="text">Within Time Limits</div>
                                            <div class="iocn"><i class="fi fi-tr-file-download"></i></div>
                                            <div class="count">
                                                <asp:Label ID="lblOFFLINEPENDINGWITHIN" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=OFFLINEPENDINGBEYOND">
                                    <div class="card 4">
                                        <div class="card-headr">
                                            <div class="text">Beyond in Time Limits</div>
                                            <div class="iocn"><i class="fi fi-tr-file-upload"></i></div>
                                            <div class="count">
                                                <asp:Label ID="lblOFFLINEPENDINGBEYOND" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>

                        </div>
                    </div>
                </section>
            </div>
            <div class="card" id="OfflineApproved" runat="server" visible="false">
                <div class="card-header">
                    <h3>Offiline Issued Approvals</h3>
                </div>
                <section id="dashboardcount4" class="mt-3 mb-3">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=OFFLINEAPPROVED">
                                    <div class="card 1">
                                        <div class="card-headr">
                                            <div class="text">Total</div>
                                            <div class="iocn"><i class="fi fi-tr-memo-circle-check"></i></div>
                                            <div class="count">
                                                <asp:Label ID="lblTOTALOFFLINEAPPROVED" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=OFFLINEAPPROVEDWITHIN">
                                    <div class="card 2">
                                        <div class="card-headr">
                                            <div class="text">Within Time Limits</div>
                                            <div class="iocn"><i class="fi fi-tr-file-download"></i></div>
                                            <div class="count">
                                                <asp:Label ID="lblOFFLINEWITHINAPPROVED" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="RENApplDeptView.aspx?status=OFFLINEAPPROVEDBEYOND">
                                    <div class="card 4">
                                        <div class="card-headr">
                                            <div class="text">Beyond in Time Limits</div>
                                            <div class="iocn"><i class="fi fi-tr-file-upload"></i></div>
                                            <div class="count">
                                                <asp:Label ID="lblOFFLINEBEYONDAPPROVED" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>

                        </div>
                    </div>
                </section>
            </div>


        </div>
    </div>
</asp:Content>
