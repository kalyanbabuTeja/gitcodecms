﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Dept/dept.Master" AutoEventWireup="true" CodeBehind="GrievanceDeptDashbord.aspx.cs" Inherits="MeghalayaUIP.Dept.Grievance.GrievanceDeptDashbord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../assets/admin/css/deptdashbaords.css" rel="stylesheet" />
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="../Dashboard/DeptDashBoard.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page">Grievance</li>
        </ol>
    </nav>
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="card-header d-flex justify-content-between">
                <h4 class="card-title mt-1"><b>Grievance Applications</b></h4>
                <div class="col-md-1">
                    <asp:LinkButton ID="lbtnBack" runat="server" Text="Back" OnClick="lbtnBack_Click" CssClass="btn btn-sm btn-dark"><i class="fi fi-br-angle-double-small-left" style="position: absolute;margin-left: 32px;margin-top: 3px;"></i> Back&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:LinkButton>
                </div>
            </div>
            <div class="card grievance">
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
                <div class="card-header">
                    <h3>Status Dashbord</h3>
                </div>
                <section id="dashboardcount2">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-2 col-sm-6 mb-xl-0 mb-4">
                                <div class="card">
                                    <a href="GrievanceDeptdashboarddrill.aspx?status=Total" style="text-decoration: none;" id="anchrTotal" runat="server">
                                        <div class="card-header p-3 pt-2">
                                            <div class="icon icon-lg icon-shape bg-gradient-purpule shadow-success text-center border-radius-xl mt-n4 position-absolute">
                                                <i class="fi fi-rr-memo-circle-check"></i>
                                            </div>
                                            <div class="text-end pt-1">
                                                <h4 class="mb-0">
                                                    <asp:Label ID="lbltotal" runat="server"></asp:Label></h4>
                                                <p class="text-sm mb-0 text-capitalize">&nbsp;</p>
                                            </div>
                                        </div>
                                        <hr class="dark horizontal my-0">
                                        <div class="card-footer p-3">
                                            <p class="mb-0">
                                                Total Applications 
                                            </p>
                                        </div>
                                    </a>
                                </div>
                            </div>



                            <div class="col-xl-2 col-sm-6 mb-xl-0 mb-4">
                                <div class="card">
                                    <a href="GrievanceDeptdashboarddrill.aspx?status=Pending" style="text-decoration: none;" id="anchrPending" runat="server">
                                        <div class="card-header p-3 pt-2">
                                            <div class="icon icon-lg icon-shape bg-gradient-dark shadow-success text-center border-radius-xl mt-n4 position-absolute">
                                                <i class="fi fi-rr-search-alt"></i>
                                            </div>
                                            <div class="text-end pt-1">
                                                <h4 class="mb-0">
                                                    <asp:Label ID="lblpendingTotal" runat="server" Text="50"></asp:Label></h4>
                                                <p class="text-sm mb-0 text-capitalize">&nbsp;</p>
                                            </div>
                                        </div>
                                        <hr class="dark horizontal my-0">
                                        <div class="card-footer p-3">
                                            <p class="mb-0">
                                                Pending Applications
                                            </p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-2 col-sm-6 mb-xl-0 mb-4">
                                <div class="card">
                                    <a href="GrievanceDeptdashboarddrill.aspx?status=Redressed" style="text-decoration: none;" id="anchrRedressed" runat="server">
                                        <div class="card-header p-3 pt-2">
                                            <div class="icon icon-lg icon-shape bg-gradient-success shadow-success text-center border-radius-xl mt-n4 position-absolute">
                                                <i class="fi fi-rr-memo-circle-check"></i>
                                            </div>
                                            <div class="text-end pt-1">
                                                <h4 class="mb-0">
                                                    <asp:Label ID="lblRedressedTotal" runat="server" Text="30"></asp:Label></h4>
                                                <p class="text-sm mb-0 text-capitalize">&nbsp;</p>
                                            </div>
                                        </div>
                                        <hr class="dark horizontal my-0">
                                        <div class="card-footer p-3">
                                            <p class="mb-0">
                                                Redressed Applications 
                                            </p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-2 col-sm-6">
                                <div class="card">
                                    <a href="GrievanceDeptdashboarddrill.aspx?status=Rejected" style="text-decoration: none;" id="anchrRejected" runat="server">
                                        <div class="card-header p-3 pt-2">
                                            <div class="icon icon-lg icon-shape bg-gradient-primary shadow-info text-center border-radius-xl mt-n4 position-absolute">
                                                <i class="fi fi-rr-vote-nay"></i>
                                            </div>
                                            <div class="text-end pt-1">
                                                <h4 class="mb-0">
                                                    <asp:Label ID="lblRejectedTotal" runat="server" Text="20"></asp:Label></h4>
                                                <p class="text-sm mb-0 text-capitalize">&nbsp;</p>
                                            </div>
                                        </div>
                                        <hr class="dark horizontal my-0">
                                        <div class="card-footer p-3">
                                            <p class="mb-0">Rejected Applications</p>
                                        </div>
                                    </a>
                                </div>
                            </div>

                        </div>


                    </div>
                </section>
            </div>

        </div>
    </div>
</asp:Content>
