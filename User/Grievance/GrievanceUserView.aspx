﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="GrievanceUserView.aspx.cs" Inherits="MeghalayaUIP.User.Grievance.GrievanceUserView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="../Dashboard/Dashboarddrill.aspx">Dashboard</a></li>
            <%--<li class="breadcrumb-item"><a href="Grievance.aspx">Grievance</a></li>--%>
            <li class="breadcrumb-item active" aria-current="page">Grievance Status</li>
        </ol>
    </nav>
    <link href="../../assets/admin/css/accordion.css" rel="stylesheet" />
    <div class="page-wrapper" style="">
        <div class="content container-fluid">
            <div class="card">

                <div class="card-body">
                    <div class="card-title h5 text-bold mb-1 border-bottom">View Grievance Status</div>
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

                    <div class="mt-2">
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse"
                                            data-parent="#accordion" href="#collapseOne" aria-expanded="false"
                                            aria-controls="collapseOne">View Grievance Total Applications
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse" role="tabpanel"
                                    aria-labelledby="headingOne" aria-expanded="false">
                                    <div class="card">
                                        <%-- <div class="card-header">
                                        <h5>View Grievance Total Applications</h5>
                                    </div>--%>
                                        <section id="dashboardStatus">
                                            <div class="container-fluid">
                                                <div class="row clearfix">
                                                    <div class="col-sm-12">
                                                        <div class="mt-2 table-responsive text-nowrap">
                                                            <asp:GridView ID="gvGrvncTotal" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true"
                                                                BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CssClass="table-bordered table-hover table-striped"
                                                                GridLines="None" Width="100%" EnableModelValidation="True">
                                                                <RowStyle />
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="SI.No" ItemStyle-Width="3%">
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <%# Container.DataItemIndex + 1%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:BoundField HeaderText="ID" DataField="GRIEVANCEID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" Visible="false" />
                                                                    <asp:BoundField HeaderText="Grievance/Feedback" DataField="TYPE" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" ItemStyle-Width="100px" />
                                                                    <asp:BoundField HeaderText="Department Name" DataField="DEPTNAME" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                    <asp:BoundField HeaderText="Unit Name" DataField="UNITNAME" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                    <asp:BoundField HeaderText="District Name" DataField="DistrictName" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                    <asp:BoundField HeaderText="Mobile Number" DataField="MOBILE" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                    <asp:BoundField HeaderText="Email" DataField="EMAIL" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                    <asp:BoundField HeaderText="Date of Register" DataField="REGDATE" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                    <asp:BoundField HeaderText="Subject" DataField="SUBJECT" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                    <asp:BoundField HeaderText="Description" DataField="DESCRIPTION" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" ItemStyle-ForeColor="WindowText" ItemStyle-CssClass="text-wrap" />
                                                                    <asp:BoundField HeaderText="Status" DataField="STATUS" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />

                                                                </Columns>
                                                                <EmptyDataTemplate>No Records Found </EmptyDataTemplate>
                                                                <HeaderStyle Font-Bold="True" ForeColor="White" />
                                                                <AlternatingRowStyle BackColor="White" />
                                                            </asp:GridView>
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>


                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingSecond">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse"
                                            data-parent="#accordion" href="#collapseSecond" aria-expanded="false"
                                            aria-controls="collapseSecond">View Grievance Pending Applications
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseSecond" class="panel-collapse collapse" role="tabpanel"
                                    aria-labelledby="headingSecond" aria-expanded="false">
                                    <div class="card">
                                        <%-- <div class="card-header">
                                            <h5>View Grievance Pending Applications</h5>
                                        </div>--%>
                                        <section id="dashboardStatus">
                                            <div class="container-fluid">
                                                <div class="row clearfix">
                                                    <div class="col-sm-12">
                                                        <div class="table-responsive text-nowrap mt-2">
                                                            <asp:GridView ID="gvGrvncPending" runat="server" AutoGenerateColumns="False" BorderColor="#003399" ShowHeaderWhenEmpty="true"
                                                                BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CssClass="table-bordered table-hover table-striped mb-0 GRD" ForeColor="#333333"
                                                                GridLines="None" Width="100%" EnableModelValidation="True">
                                                                <RowStyle />
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="SI.No" ItemStyle-Width="3%">
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                        <ItemTemplate>
                                                                            <%# Container.DataItemIndex + 1%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:BoundField HeaderText="ID" DataField="GRIEVANCEID" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" Visible="false" />
                                                                    <asp:BoundField HeaderText="Grievance/FeedBack" DataField="TYPE" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                    <asp:BoundField HeaderText="Department Name" DataField="DEPTNAME" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                    <asp:BoundField HeaderText="Unit Name" DataField="UNITNAME" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                    <asp:BoundField HeaderText="District Name" DataField="DistrictName" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                    <asp:BoundField HeaderText="Mobile Number" DataField="MOBILE" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                    <asp:BoundField HeaderText="Email" DataField="EMAIL" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                    <asp:BoundField HeaderText="Date of Register" DataField="REGDATE" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                    <asp:BoundField HeaderText="Subject" DataField="SUBJECT" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                    <asp:BoundField HeaderText="Description" DataField="DESCRIPTION" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" ItemStyle-ForeColor="WindowText" ItemStyle-CssClass="text-wrap" />
                                                                    <asp:BoundField HeaderText="Status" DataField="STATUS" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />

                                                                </Columns>
                                                                <EmptyDataTemplate>No Records Found </EmptyDataTemplate>
                                                                <HeaderStyle BackColor="#013161" Font-Bold="True" ForeColor="White" />
                                                                <AlternatingRowStyle BackColor="White" />
                                                            </asp:GridView>
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingThird">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse"
                                            data-parent="#accordion" href="#collapseThird" aria-expanded="false"
                                            aria-controls="collapseThird">View Grievance Redressed Applications
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseThird" class="panel-collapse collapse" role="tabpanel"
                                    aria-labelledby="headingThird" aria-expanded="false">
                                    <div class="card">
                                        <%-- <div class="card-header">
                                            <h5>View Grievance Redressed Applications</h5>
                                        </div>--%>
                                        <section id="dashboardStatus">
                                            <div class="container-fluid">
                                                <div class="row clearfix">
                                                    <div class="col-sm-12 mt-2">

                                                        <asp:GridView ID="gvGrvncRedressed" runat="server" AutoGenerateColumns="False" BorderColor="#003399" ShowHeaderWhenEmpty="true"
                                                            BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CssClass="table-bordered table-hover table-responsive mb-0 GRD" ForeColor="#333333"
                                                            GridLines="None" Width="100%" EnableModelValidation="True">
                                                            <RowStyle />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="SI.No" ItemStyle-Width="3%">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                    <ItemTemplate>
                                                                        <%# Container.DataItemIndex + 1%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:BoundField HeaderText="ID" DataField="GRIEVANCEID" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" Visible="false" />
                                                                <asp:BoundField HeaderText="Grievance/FeedBack" DataField="TYPE" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                <asp:BoundField HeaderText="Department Name" DataField="DEPTNAME" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                <asp:BoundField HeaderText="Unit Name" DataField="UNITNAME" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                <asp:BoundField HeaderText="District Name" DataField="DistrictName" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                <asp:BoundField HeaderText="Mobile Number" DataField="MOBILE" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                <asp:BoundField HeaderText="Email" DataField="EMAIL" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                <asp:BoundField HeaderText="Date of Register" DataField="REGDATE" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                <asp:BoundField HeaderText="Subject" DataField="SUBJECT" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                <asp:BoundField HeaderText="Description" DataField="DESCRIPTION" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" ItemStyle-CssClass="text-wrap" />
                                                                <asp:BoundField HeaderText="Status" DataField="STATUS" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />

                                                            </Columns>
                                                            <EmptyDataTemplate>No Records Found </EmptyDataTemplate>
                                                            <HeaderStyle BackColor="#013161" Font-Bold="True" ForeColor="White" />
                                                            <AlternatingRowStyle BackColor="White" />
                                                        </asp:GridView>
                                                    </div>

                                                </div>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingFour">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse"
                                            data-parent="#accordion" href="#collapseFour" aria-expanded="false"
                                            aria-controls="collapseFour">View Grievance Rejected Applications
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseFour" class="panel-collapse collapse" role="tabpanel"
                                    aria-labelledby="headingFour" aria-expanded="false">
                                    <div class="card">
                                        <%--<div class="card-header">
                                            <h5>View Grievance Rejected Applications</h5>
                                        </div>--%>
                                        <section id="dashboardStatus">
                                            <div class="container-fluid">
                                                <div class="row clearfix">
                                                    <div class="col-sm-12 mt-2">
                                                        <asp:GridView ID="gvGrvncRejected" runat="server" AutoGenerateColumns="False" BorderColor="#003399" ShowHeaderWhenEmpty="true"
                                                            BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CssClass="table-bordered table-hover table-responsive mb-0 GRD" ForeColor="#333333"
                                                            GridLines="None" Width="100%" EnableModelValidation="True">
                                                            <RowStyle />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="SI.No" ItemStyle-Width="3%">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                    <ItemTemplate>
                                                                        <%# Container.DataItemIndex + 1%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:BoundField HeaderText="ID" DataField="GRIEVANCEID" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" Visible="false" />
                                                                <asp:BoundField HeaderText="Grievance/FeedBack" DataField="TYPE" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                <asp:BoundField HeaderText="Department Name" DataField="DEPTNAME" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                <asp:BoundField HeaderText="Unit Name" DataField="UNITNAME" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                <asp:BoundField HeaderText="District Name" DataField="DistrictName" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                <asp:BoundField HeaderText="Mobile Number" DataField="MOBILE" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                <asp:BoundField HeaderText="Email" DataField="EMAIL" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                <asp:BoundField HeaderText="Date of Register" DataField="REGDATE" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                <asp:BoundField HeaderText="Subject" DataField="SUBJECT" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                                                <asp:BoundField HeaderText="Description" DataField="DESCRIPTION" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" ItemStyle-CssClass="text-wrap" />
                                                                <asp:BoundField HeaderText="Status" DataField="STATUS" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />

                                                            </Columns>
                                                            <EmptyDataTemplate>No Records Found </EmptyDataTemplate>
                                                            <HeaderStyle BackColor="#013161" Font-Bold="True" ForeColor="White" />
                                                            <AlternatingRowStyle BackColor="White" />
                                                        </asp:GridView>

                                                    </div>

                                                </div>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
