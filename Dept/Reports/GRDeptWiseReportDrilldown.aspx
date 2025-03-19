﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Dept/dept.Master" AutoEventWireup="true" CodeBehind="GRDeptWiseReportDrilldown.aspx.cs" Inherits="MeghalayaUIP.Dept.Reports.GRDeptWiseReportDrilldown" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href="../assets/admin/css/user.css" rel="stylesheet" />

    <div class="page-wrapper griddesignmulticount">
        <div class="content container-fluid">
            <%-- <div class="card" id="Applications" runat="server" visible="false">--%>
            <div class="card-header d-flex justify-content-between">
                <h4 class="card-title mt-1"><b>Grievance Department Wise Report: </b></h4>
                <h4 class="card-title mt-1">
                    <label id="lblStatus" runat="server" visible="false"></label>
                </h4>
                <div class="col-md-1 d-flex " style="align-items: center; margin-right: 60px;">
                    <asp:LinkButton ID="lbtnBack" runat="server" Text="Back" CssClass="btn btn-sm btn-dark" OnClick="lbtnBack_Click"><i class="fi fi-br-angle-double-small-left" style="position: absolute;margin-left: 32px;margin-top: 3px;"></i> Back&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:LinkButton>
                     <div class="panel-heading" style="text-align: center">
                        <h2 id="H1" runat="server" class="panel-title" style="font-weight: bold;">
                            <asp:Label ID="lblHeading" runat="server" Visible="false">Grievance Department Wise Report</asp:Label>
                            <asp:ImageButton ID="btnPdf" runat="server" ImageUrl="../../assets/admin/img/pdf-icon.png" Width="30px" Height="30px" Style="float: right; margin-right: 10px;" alt="PDF" OnClick="btnPdf_Click" />
                            <asp:ImageButton ID="btnExcel" runat="server" ImageUrl="../../assets/admin/img/Excel-icon.png" Width="30px" Height="30px" Style="float: right" alt="EXCEL" OnClick="btnExcel_Click" /></h2>
                    </div>
                </div>
            </div>

            <div>
                <div class="col-md-12 ">
                    <div id="success" runat="server" visible="false" class="alert alert-success alert-dismissible fade show" align="Center">
                        <strong>Success!</strong><asp:Label ID="lblmsg" runat="server"></asp:Label>
                        <asp:Label ID="Label2" runat="server"></asp:Label>
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
                <asp:HiddenField ID="hdnPreRegUNITID" runat="server" />
                <asp:HiddenField ID="hdnPreRegUID" runat="server" />
                <asp:HiddenField ID="hdnUserID" runat="server" />
            </div>
            <section id="dashboardcount" class="mt-2">
               <div class="container-fluid">
                    <div class="table-responsive">
                        <asp:GridView ID="GVgrivancereport" runat="server" AutoGenerateColumns="False" BorderColor="#003399" ShowHeaderWhenEmpty="true"
                            BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CssClass="table table-bordered table-striped table-hover" ForeColor="#333333"
                            GridLines="None" Width="100%" EnableModelValidation="True" ShowFooter="true">
                            <RowStyle />
                            <HeaderStyle BackColor="#013161" Font-Bold="True" ForeColor="White" Height="33px" HorizontalAlign="Center" />

                            <Columns>
                                <asp:TemplateField HeaderText="Sl.No" ItemStyle-Width="5%">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />--%>
                                <asp:BoundField HeaderText="Grievance/Feedback" DataField="REGISTERTYPE" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" ItemStyle-Width="20%" />
                                <asp:BoundField HeaderText="Name" DataField="APPLICANTNAME" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" Visible="true" ItemStyle-Width="10%" />
                                <asp:BoundField HeaderText="District" DataField="DISTRICT" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" ItemStyle-Width="20%" />
                                <asp:BoundField HeaderText="Department" DataField="DEPARTMENT" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ItemStyle-ForeColor="WindowText" ItemStyle-Width="10%" />
                                <asp:BoundField HeaderText="Subject" DataField="SUBJECT" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ItemStyle-ForeColor="WindowText" ItemStyle-Width="20%" />
                                <asp:BoundField HeaderText="Description" DataField="DESCRIPTION" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ItemStyle-ForeColor="WindowText" ItemStyle-Width="15%" />
                                <asp:BoundField HeaderText="Query Date" DataField="CREATEDDATE" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ItemStyle-ForeColor="WindowText" ItemStyle-Width="15%" />
                                <asp:TemplateField HeaderText="View">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkButton" runat="server" OnClick="lnkButton_Click" Text="View"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="View" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFilePath" Text='<%#Eval("GRIEVANCE_FILEPATH")%>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                   <asp:BoundField HeaderText="Status" DataField="STATUS" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ItemStyle-ForeColor="WindowText" ItemStyle-Width="15%" />
                                   <asp:BoundField HeaderText="Department Remarks" DataField="REMARKS" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ItemStyle-ForeColor="WindowText" ItemStyle-Width="15%" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </section>
            <%--</div>--%>
        </div>
    </div>
</asp:Content>
