﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Dept/dept.Master" AutoEventWireup="true" CodeBehind="PreRegApplDPRDashBoard.aspx.cs" Inherits="MeghalayaUIP.Dept.PreReg.PreRegApplDPRDashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../Dashboard/DeptDashBoard.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page">DPR</li>
        </ol>
    </nav>
    <div class="page-wrapper IIMADB" style="margin: 10px 0px !important;">
        <div class="container-fluid">
            <div class="card-header d-flex justify-content-between">
                <h4 class="card-title mt-1">DPR Applications<b></b></h4>
                <div class="col-md-1">
                    <asp:LinkButton ID="lbtnBack" runat="server" Text="Back" CssClass="btn btn-sm btn-dark"><i class="fi fi-br-angle-double-small-left" style="position: absolute;margin-left: 32px;margin-top: 3px;"></i> Back&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:LinkButton>
                </div>
            </div>

            <div class="card" style="padding: 10px; border-radius: 4px;">
                <h2 style="font-size: 22px; color: #3f51b5;"></h2>
                <div class="card">
                    <div class="card-header">
                        <h3>DPR Applications</h3>
                    </div>
                    <div class="col-md-12 ">
                        <div id="success" runat="server" visible="false" class="alert alert-success alert-dismissible fade show" align="Center">
                            <strong>Success!</strong><asp:Label ID="lblmsg" runat="server"></asp:Label>
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div id="Failure" runat="server" visible="false" class="alert alert-danger alert-dismissible fade show mt-3" align="Center">
                            <strong>Warning!</strong>
                            <asp:Label ID="lblmsg0" runat="server"></asp:Label>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                    </div>
                    <asp:HiddenField ID="hdnUserID" runat="server" />

                    <section id="dashboardcount">
                        <div class="container-fluid">
                            <div class="row clearfix">
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 ">
                                    <asp:LinkButton runat="server" ID="linkTotal" OnClick="linkTotal_Click" ForeColor="White">
                                        <div class="info-box bg-orange hover-expand-effect">
                                            <div class="icon">
                                                <h4>
                                                    <asp:Label ID="lblTotalApp" runat="server"></asp:Label>
                                                </h4>
                                            </div>
                                            <div class="content">
                                                <div class="text">
                                                    Total Applications
                                                  
                                                </div>
                                                <div style="font-size: 12px;"></div>
                                                <i class="fi fi-tr-ballot-check"></i>
                                            </div>
                                        </div>
                                    </asp:LinkButton>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <asp:LinkButton runat="server" ID="linktobeProc" OnClick="linktobeProc_Click" ForeColor="White">
                                        <div class="info-box bg-yellow hover-expand-effect">
                                            <div class="icon">
                                                <h4>
                                                    <asp:Label ID="lblDPRTOBEPROCESSED" runat="server"></asp:Label>
                                                </h4>
                                            </div>
                                            <div class="content">
                                                <div class="text">
                                                    Applications to<br />
                                                    be Processed
                                                </div>
                                                <div style="font-size: 12px;"></div>
                                                <i class="fi fi-tr-file-edit"></i>
                                            </div>
                                        </div>
                                    </asp:LinkButton>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <asp:LinkButton runat="server" ID="linkProcessed" OnClick="linkProcessed_Click" ForeColor="White">
                                        <div class="info-box bg-green hover-expand-effect">
                                            <div class="icon">
                                                <h4>
                                                    <asp:Label ID="lblDPRPROCESSED" runat="server"></asp:Label>
                                                </h4>
                                            </div>
                                            <div class="content">
                                                <div class="text">
                                                    Processed 
                                                </div>
                                                <div style="font-size: 12px;"></div>
                                                <i class="fi fi-tr-memo-circle-check"></i>
                                            </div>
                                        </div>
                                    </asp:LinkButton>
                                </div>


                            </div>
                        </div>
                    </section>


                </div>

            </div>
        </div>
    </div>
</asp:Content>
