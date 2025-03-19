﻿<%@ Page Title="Single Window Portal Dashboard" Language="C#" MasterPageFile="~/outerNew.Master" AutoEventWireup="true" CodeBehind="SingleWindowPortalDashboard.aspx.cs" Inherits="MeghalayaUIP.SingleWindowPortalDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .swpd thead tr th {
            vertical-align: middle;
            text-align: center;
            font-weight: 400;
            background: #054c93;
            color: #fff !important;
        }

        table.table.table-responsive.table-bordered.table-sm.mb-0.table-hover {
            font-size: 14px;
            text-align: center;
        }

            table.table.table-responsive.table-bordered.table-sm.mb-0.table-hover tbody tr th {
                text-align: center;
            }

        .swpd table.table.table-responsive.table-bordered.table-sm.mb-0.table-hover {
            border-radius: 14px !important;
            display: block;
        }

        tfoot tr th {
            text-align: center;
        }

        td.bg-info {
            text-align: left;
            font-weight: 900;
            color: #432b6b;
            padding: 10px !important;
            background: #fffcfd;
        }

        table#ContentPlaceHolder1_gvDepts tr th {
            margin: 10px !important;
            padding: 8px 8px;
            background: #3e2a6c;
            color: #fff;
        }

        td.fw-bold {
            padding: 10px;
            color: #3d2a6c;
            font-weight: 500;
        }

        input#ContentPlaceHolder1_txtFDate, input#ContentPlaceHolder1_txtTDate {
            width: 110%;
        }

        .bg-info {
            background-color: #fdfdfd00 !important;
        }

        table#ContentPlaceHolder1_gvDepts {
            width: 96.9% !important;
        }
    </style>


    <section class="innerpages">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                                    <li class="breadcrumb-item active" aria-current="page">Single Window Portal Dashboard</li>
                                </ol>
                            </nav>


                            <h3>Single Window Portal Dashboard</h3>
                            <div class="col-md-12 d-flex" style="margin-bottom: 8px;">
                                <div class="col-md-3">
                                    <div class="form-group row">
                                        <label class="col-md-5 col-form-label" style="text-align: right;">
                                            From Date :</label>
                                        <div class="col-lg-7 d-flex" style="text-align: left; margin-left: -20px;">

                                            <input type="date" id="txtFDate" runat="server" class="date form-control" />

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group row">
                                        <label class="col-md-5 col-form-label" style="text-align: right;">
                                            To Date :</label>
                                        <div class="col-lg-7 d-flex" style="text-align: left; margin-left: -20px;">
                                            <%--<asp:TextBox ID="txtTDate" runat="server" class="date form-control"></asp:TextBox>--%>
                                            <input type="date" id="txtTDate" runat="server" class="date form-control" />

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 d-flex">
                                    <div class="col-md-6" style="margin-top: 4px;">Department Name :</div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlDept" runat="server" class=" form-control">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group row">

                                        <div class="col-lg-6 d-flex">
                                            <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-rounded btn-success" Width="80px" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swpd">


                                <asp:GridView ID="gvDepts" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive table-bordered table-sm mb-0 table-hover"
                                    DataKeyNames="TMD_DEPTID" OnRowDataBound="gvDepts_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <img alt="" style="cursor: pointer" src="assets/assetsnew/images/plus.png" />
                                                <img alt="" style="cursor: pointer; display: none" src="assets/assetsnew/images/minus.png" />
                                                <asp:Panel ID="pnlApprovals" runat="server" Style="display: none">
                                                    <asp:GridView ID="gvApprovals" runat="server" AutoGenerateColumns="false" CssClass="ChildGrid"
                                                        OnRowDataBound="gvApprovals_RowDataBound" ShowFooter="true">
                                                        <Columns>
                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="S.No." HeaderStyle-BackColor="#650855">
                                                                <ItemTemplate>
                                                                    <%# Container.DataItemIndex + 1%>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" />

                                                                <ItemStyle Width="40px" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="ApprovalName" HeaderStyle-BackColor="#650855" HeaderText="Approval Name" ItemStyle-CssClass="fw-bold" />
                                                            <asp:BoundField DataField="TIMELIMIT" HeaderStyle-BackColor="#650855" HeaderText="Time limit prescribed" />
                                                            <asp:BoundField DataField="TOTALAPPLICATIONSRCVD" HeaderStyle-BackColor="#650855" HeaderText="Total number of applications received" />
                                                            <%-- <asp:TemplateField HeaderText="Total Number of Applications Received">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTOTALAPPLICATIONSRCVD" runat="server" Text='<%# Bind("TOTALAPPLICATIONSRCVD") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotalRcvd" runat="server" Text="0" Font-Bold="true" BackColor="Black"
                                                                ForeColor="Wheat"></asp:Label>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>--%>
                                                            <asp:BoundField DataField="TOTALAPPROVRED" HeaderStyle-BackColor="#650855" HeaderText="Approved" />
                                                            <asp:BoundField DataField="TOTALREJECTED" HeaderStyle-BackColor="#650855" HeaderText="Rejected" />
                                                            <asp:BoundField DataField="AVGTIMETOGRANT" HeaderStyle-BackColor="#650855" HeaderText="Average time taken to grant approval (in Days)" />
                                                            <asp:BoundField DataField="MDMTIMETOGRANT" HeaderStyle-BackColor="#650855" HeaderText="Median time taken to grant approval (in Days)" />
                                                            <asp:BoundField DataField="AVERAGEFEE" HeaderStyle-BackColor="#650855" HeaderText="Average Fee for Application" />
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </ItemTemplate>
                                            <ItemStyle Width="4%" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="S. No." HeaderStyle-CssClass="fw-bold">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1%>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle Width="5%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Deptid" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDeptid" runat="server" Text='<%#Eval("TMD_DEPTID")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField ItemStyle-Width="1028px" DataField="TMD_DeptName" HeaderText="Department Name" HeaderStyle-CssClass="fw-bold" ItemStyle-CssClass="bg-info" />
                                        <%-- <asp:BoundField ItemStyle-Width="400px" DataField="TOTALAPPLICATIONSRCVD" HeaderText="Total Applications Received" HeaderStyle-CssClass="fw-bold" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="bg-info" />
                                        <asp:BoundField ItemStyle-Width="400px" DataField="TOTALPROCESSED" HeaderText="Total Applications Processed" HeaderStyle-CssClass="fw-bold" ItemStyle-CssClass="bg-info" />--%>
                                        <asp:TemplateField HeaderText="Total Applications Received">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lblApplProcess" Text='<%#Eval("TOTALAPPLICATIONSRCVD")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Applications Processed">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lblAlprocess" Text='<%#Eval("TOTALPROCESSED")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>

                        </div>
                        <div id="DivFooter" runat="server">
                            <div>
                                <div style="font-size: 16px; margin-left: 190px; font-weight: 600; color: black;">
                                    <asp:Label ID="LBLDATETEXT" runat="server" Text="The Data in the Dashboard is updated on a real time basis. Last update:"></asp:Label><asp:Label ID="LBLDATETIME" runat="server"></asp:Label>
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
    </section>
    <script src="assets/assetsnew/js/jquery-O.S.T.min.js"></script>

    <script type="text/javascript">

        $("[src*=plus]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td class='orders' colspan = '999'>" + $(this).closest("tr").find("[id*=Approvals]").html() + "</td></tr>");
            $(this).closest("tr").find("[src*=minus]").show();
            $(this).hide();
        });
        $("[src*=minus]").live("click", function () {
            $(this).closest("tr").next().remove();
            $(this).closest("tr").find("[src*=plus]").show();
            $(this).hide();
        });

    </script>
</asp:Content>
