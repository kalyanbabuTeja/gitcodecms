﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Dept/dept.Master" AutoEventWireup="true" CodeBehind="GrievanceDeptdashboarddrill.aspx.cs" Inherits="MeghalayaUIP.Dept.Grievance.GrievanceDeptdashboarddrill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../assets/admin/css/deptdashbaords.css" rel="stylesheet" />
    <link href="../../assets/admin/css/deptdashboard3.css" rel="stylesheet" />
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="../Dashboard/DeptDashBoard.aspx">Dashboard</a></li>
            <%--<li class="breadcrumb-item"><a href="#">Pre Establishment</a></li>--%>
            <li class="breadcrumb-item">Grievance </li>
            <li class="breadcrumb-item active" aria-current="page">Status</li>
        </ol>
        <div class="page-wrapper cfeappldeptdrill">
            <div class="content container-fluid">
                <div class="card-header d-flex  justify-content-between">
                    <h4 class="card-title mt-1" style="font-size: 18px !important;"><b>Grievance Status</b></h4>
                    <div class="col-md-1">
                        <asp:LinkButton ID="lbtnBack" runat="server" Text="Back" OnClick="lbtnBack_Click" CssClass="btn btn-sm btn-dark"><i class="fi fi-br-angle-double-small-left" style="position: absolute;margin-left: 32px;margin-top: 3px;"></i> Back&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:LinkButton>
                    </div>
                </div>
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
                <div class="col-md-12 row mb-3">

                    <asp:HiddenField ID="hdnUserID" runat="server" />
                    <div class="col-md-2">Select Status to View</div>
                    <div class="col-md-2 d-flex">
                        <spna class="dots">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</spna>
                        <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" class="form-control" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Total" Value="Total"></asp:ListItem>
                            <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                            <asp:ListItem Text="Redressed" Value="Redressed"></asp:ListItem>
                            <asp:ListItem Text="Rejected" Value="Rejected"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">&nbsp;</div>
                </div>
                <%--<div class="card" >
                <div class="card-header">
                    <h3>Grievance - Total Applications</h3>
                </div>
                <section id="dashboardcount3"  class="mt-3 mb-3">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <a href="CFEApplDeptView.aspx">
                                    <div class="card 2">
                                        <div class="card-headr">
                                            <div class="text">Pending With in 7 Days</div>
                                            <div class="iocn"><i class="fi fi-tr-memo-circle-check"></i></div>
                                            <div class="count"><asp:Label ID="lblPendingWithin" runat="server"></asp:Label></div>
                                        </div>

                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <div class="card 4">
                                    <div class="card-headr">
                                        <div class="text">Pending Beyond 7 Days</div>
                                        <div class="iocn"><i class="fi fi-tr-file-download"></i></div>
                                        <div class="count"><asp:Label ID="lblPendingBeyond" runat="server"></asp:Label></div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <div class="card 2">
                                    <div class="card-headr">
                                        <div class="text">Redressed With in 7 Days</div>
                                        <div class="iocn"><i class="fi fi-tr-file-upload"></i></div>
                                        <div class="count"><asp:Label ID="lblRedressedWithin" runat="server"></asp:Label></div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                <div class="card 4">
                                    <div class="card-headr">
                                        <div class="text">Redressed Beyond 7 Days</div>
                                        <div class="iocn"><i class="fi fi-tr-file-upload"></i></div>
                                        <div class="count"><asp:Label ID="lblRedressedBeyond" runat="server"></asp:Label></div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4 mt-5">
                                <div class="card 2">
                                    <div class="card-headr">
                                        <div class="text">Rejected With in 7 Days</div>
                                        <div class="iocn"><i class="fi fi-tr-file-upload"></i></div>
                                        <div class="count"><asp:Label ID="lblRejectedWithin" runat="server"></asp:Label></div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4 mt-5">
                                <div class="card 4">
                                    <div class="card-headr">
                                        <div class="text">Rejected Beyond 7 Days</div>
                                        <div class="iocn"><i class="fi fi-tr-file-upload"></i></div>
                                        <div class="count"><asp:Label ID="lblRejectedBeyond" runat="server"></asp:Label></div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>--%>
                <%--*************************************--%>
                <div class="card" id="divPending" runat="server">
                    <div class="card-header">
                        <h3>Grievance - Pending Applications</h3>
                    </div>
                    <section id="dashboardcount3" class="mt-3 mb-3">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                    <a href="GrievanceDeptView.aspx?status=Pending" id="anchrPendingTotal" runat="server">
                                        <div class="card 1">
                                            <div class="card-headr">
                                                <div class="text">Pending Total</div>
                                                <div class="iocn"><i class="fi fi-tr-memo-circle-check"></i></div>
                                                <div class="count">
                                                    <asp:Label ID="lblPendingTotal" runat="server"></asp:Label>
                                                </div>
                                            </div>

                                        </div>
                                    </a>
                                </div>
                                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                    <a href="GrievanceDeptView.aspx?status=Pending" id="anchrPendingWithin" runat="server">
                                        <div class="card 2">
                                            <div class="card-headr">
                                                <div class="text">Pending With in 7 Days</div>
                                                <div class="iocn"><i class="fi fi-tr-memo-circle-check"></i></div>
                                                <div class="count">
                                                    <asp:Label ID="lblPendingWithin" runat="server"></asp:Label>
                                                </div>
                                            </div>

                                        </div>
                                    </a>
                                </div>
                                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                    <a href="GrievanceDeptView.aspx?status=Pending" id="anchrPendingBeyond" runat="server">
                                        <div class="card 4">
                                            <div class="card-headr">
                                                <div class="text">Pending Beyond 7 Days</div>
                                                <div class="iocn"><i class="fi fi-tr-file-download"></i></div>
                                                <div class="count">
                                                    <asp:Label ID="lblPendingBeyond" runat="server"></asp:Label>
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
                <div class="card" id="divRedressed" runat="server">
                    <div class="card-header">
                        <h3>Grievance - Redressed Applications</h3>
                    </div>
                    <section id="dashboardcount3" class="mt-3 mb-3">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                    <a href="GrievanceDeptView.aspx?status=Redressed" id="anchrRedressedTotal" runat="server">
                                        <div class="card 1">
                                            <div class="card-headr">
                                                <div class="text">Redressed Total</div>
                                                <div class="iocn"><i class="fi fi-tr-memo-circle-check"></i></div>
                                                <div class="count">
                                                    <asp:Label ID="lblRedressedTotal" runat="server"></asp:Label>
                                                </div>
                                            </div>

                                        </div>
                                    </a>
                                </div>
                                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                    <a href="GrievanceDeptView.aspx?status=Redressed" id="anchrRedressedWithin" runat="server">
                                        <div class="card 2">
                                            <div class="card-headr">
                                                <div class="text">Redressed With in 7 Days</div>
                                                <div class="iocn"><i class="fi fi-tr-file-upload"></i></div>
                                                <div class="count">
                                                    <asp:Label ID="lblRedressedWithin" runat="server"></asp:Label>
                                                </div>
                                            </div>

                                        </div>
                                    </a>
                                </div>
                                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                    <a href="GrievanceDeptView.aspx?status=Redressed" id="anchrRedressedBeyond" runat="server">
                                        <div class="card 4">
                                            <div class="card-headr">
                                                <div class="text">Redressed Beyond 7 Days</div>
                                                <div class="iocn"><i class="fi fi-tr-file-upload"></i></div>
                                                <div class="count">
                                                    <asp:Label ID="lblRedressedBeyond" runat="server"></asp:Label>
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
                <div class="card" id="divRejected" runat="server">
                    <div class="card-header">
                        <h3>Grievance - Rejected Applications</h3>
                    </div>
                    <section id="dashboardcount3" class="mb-3 mt-3">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                    <a href="GrievanceDeptView.aspx?status=Rejected" id="anchrRejectedTotal" runat="server">
                                        <div class="card 1">
                                            <div class="card-headr">
                                                <div class="text">Rejected Total</div>
                                                <div class="iocn"><i class="fi fi-tr-memo-circle-check"></i></div>
                                                <div class="count">
                                                    <asp:Label ID="lblRejectedTotal" runat="server"></asp:Label>
                                                </div>
                                            </div>

                                        </div>
                                    </a>
                                </div>
                                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                    <a href="GrievanceDeptView.aspx?status=Rejected" id="anchrRejectedWithin" runat="server">
                                        <div class="card 2">
                                            <div class="card-headr">
                                                <div class="text">Rejected With in 7 Days</div>
                                                <div class="iocn"><i class="fi fi-tr-file-upload"></i></div>
                                                <div class="count">
                                                    <asp:Label ID="lblRejectedWithin" runat="server"></asp:Label>
                                                </div>
                                            </div>

                                        </div>
                                    </a>
                                </div>
                                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                    <a href="GrievanceDeptView.aspx?status=Rejected" id="anchrRejectedBeyond" runat="server">
                                        <div class="card 4">
                                            <div class="card-headr">
                                                <div class="text">Rejected Beyond 7 Days</div>
                                                <div class="iocn"><i class="fi fi-tr-file-upload"></i></div>
                                                <div class="count">
                                                    <asp:Label ID="lblRejectedBeyond" runat="server"></asp:Label>
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
