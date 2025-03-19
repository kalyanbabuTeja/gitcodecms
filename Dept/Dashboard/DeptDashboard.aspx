﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Dept/dept.Master" AutoEventWireup="true" CodeBehind="DeptDashboard.aspx.cs" Inherits="MeghalayaUIP.Dept.Dashboard.DeptDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
        </ol>
    </nav>
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="card">
                <section id="dashboardcount">
                    <div class="container-fluid">
                        <div class="row">
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-12 d-flex">
                                <div class="col-md-3" id="Ammendments" runat="server" visible="false">
                                    <div class="card-counter primary first">
                                        <asp:LinkButton runat="server" ID="lblAmmendment" OnClick="lblAmmendment_Click">
									<i class="fi fi-tr-file-edit"></i>
									<span class="count-numbers">Ammendments</span>
									<span class="count-name"></span>
                                        </asp:LinkButton>
                                    </div>
                                </div>

                                <div class="col-md-3" id="intenttoinvest" runat="server" visible="false">
                                    <div class="card-counter danger First">
                                        <asp:LinkButton ID="lnkIntent" runat="server" OnClick="lnkIntent_Click">
									<i class="fi fi-tr-invest"></i>
									<span class="count-numbers">Intent to Invest</span>
									<span class="count-name"></span>
                                        </asp:LinkButton>
                                    </div>
                                </div>

                                <div class="col-md-3" id="Grievance" runat="server" visible="true">
                                    <div class="card-counter success">
                                        <asp:LinkButton runat="server" ID="linkGrievance" OnClick="linkGrievance_Click">
                                    <i class="fi fi-tr-person-circle-question"></i>
                                    <span class="count-numbers">Grievance</span>
                                    <span class="count-name"></span>
                                        </asp:LinkButton>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-12 d-flex">
                                <div class="col-md-3" id="Preestablishment" runat="server" visible="false">
                                    <div class="card-counter primary">
                                        <asp:LinkButton runat="server" ID="linkCFE" OnClick="linkCFE_Click">
									<img src="../../assets/admin/img/prl.png" alt="logo">
									<span class="count-numbers">Pre-establishment<br /> Approval</span>
									<span class="count-name"></span>
                                        </asp:LinkButton>
                                    </div>

                                </div>
                                <div class="col-md-3" id="PreOperational" runat="server" visible="false">
                                    <div class="card-counter danger">
                                        <asp:LinkButton runat="server" ID="linkCFO" OnClick="linkCFO_Click">
                                     <img src="../../assets/admin/img/poa.png" alt="logo">
                                    <span class="count-numbers">Pre-Operational<br /> Approval</span>
                                    <span class="count-name"></span>
                                        </asp:LinkButton>
                                    </div>

                                </div>

                                <div class="col-md-3" id="Renewal" runat="server" visible="false">
                                    <div class="card-counter danger First">
                                        <asp:LinkButton runat="server" ID="lnkrenewal" OnClick="lnkrenewal_Click">
                                     <img src="../../assets/admin/img/inc.png" alt="logo">
                                    <span class="count-numbers">Renewal<br /> Approval</span>
                                    <span class="count-name"></span>
                                        </asp:LinkButton>
                                    </div>

                                </div>

                                <div class="col-md-3" id="Services" runat="server" visible="false">
                                    <div class="card-counter primary">
                                        <asp:LinkButton runat="server" ID="linkServices" OnClick="lnkServices_Click">
					                    <img src="../../assets/admin/img/prl.png" alt="logo">
					                    <span class="count-numbers">Other Services<br /> Approval</span>
					                    <span class="count-name"></span>
                                        </asp:LinkButton>
                                    </div>

                                </div>



                            </div>
                            <div class="col-md-12 d-flex">
                                <div class="col-md-3" id="prereg" runat="server" visible="false">
                                    <div class="card-counter info">
                                        <asp:LinkButton ID="linkPreReg" runat="server" OnClick="linkPreReg_Click">
									<i class="fi fi-tr-clipboard-list"></i>
									<span class="count-numbers">Registration under<br /> MIIPP 2024</span>
									<span class="count-name">(Principle approval)</span>
                                        </asp:LinkButton>
                                    </div>
                                </div>

                                <div class="col-md-3" id="Land" runat="server" visible="false">
                                    <div class="card-counter primary">
                                        <asp:LinkButton ID="lnkLandAllotment" runat="server" OnClick="lnkLandAllotment_Click">
									<i class="fi fi-tr-land-layer-location"></i>
									<span class="count-numbers">Land Allotment</span>
									<span class="count-name"></span>
                                        </asp:LinkButton>
                                    </div>
                                </div>

                                <div class="col-md-3" id="Report" runat="server" visible="false">
                                    <div class="card-counter primary Reports">
                                        <asp:LinkButton runat="server" ID="lnkReport" OnClick="lnkReport_Click">
									<i class="fi fi-tr-newspaper"></i>
									<span class="count-numbers">Reports</span>
									<span class="count-name"></span>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>

            </div>

        </div>
    </div>
</asp:Content>
