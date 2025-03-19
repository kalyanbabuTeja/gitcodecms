﻿<%@ Page Title="Grievance/Query Dashboard" Language="C#" MasterPageFile="~/OuterNew.Master" AutoEventWireup="true" CodeBehind="GrievanceMisReport.aspx.cs" Inherits="MeghalayaUIP.GrievanceMisReport" %>

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

        table#ContentPlaceHolder1_gvDetails tr th {
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

        table#ContentPlaceHolder1_gvDetails {
            width: 96.9% !important;
        }
    </style>

    <script type="text/javascript">



</script>
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
                                    <li class="breadcrumb-item active" aria-current="page">Grievance/Feedback/General Query</li>
                                </ol>
                            </nav>


                            <h3>Grievance/Feedback/General Query</h3>
                            <div class="col-md-12 d-flex" style="margin-bottom: 8px;">
                                <div class="col-md-3" runat="server" visible="false">
                                    <div class="form-group row">
                                        <label class="col-md-5 col-form-label" style="text-align: right;">
                                            From Date :</label>
                                        <div class="col-lg-7 d-flex" style="text-align: left; margin-left: -20px;">

                                            <input type="date" id="txtFDate" runat="server" class="date form-control" />

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3" runat="server" visible="false">
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
                                    <div class="col-md-6" style="margin-top: 4px;">Type of Report :</div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlType" runat="server" class=" form-control">
                                            <asp:ListItem Value="G" Selected="True">Grievance</asp:ListItem>
                                            <asp:ListItem Value="F">Feedback</asp:ListItem>
                                            <asp:ListItem Value="Q">General Query</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group row">

                                        <div class="col-lg-6 d-flex">
                                            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" class="btn btn-rounded btn-success" Width="80px" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swpd">

                                <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive table-bordered table-sm mb-0 table-hover"
                                    OnRowDataBound="gvDetails_RowDataBound" ShowFooter="true" FooterStyle-HorizontalAlign="Left">
                                    <Columns>
                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="S. No." HeaderStyle-CssClass="fw-bold">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1%>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle Width="5%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Deptid" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDeptid" runat="server" Text='<%#Eval("DEPT_ID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField ItemStyle-Width="1028px" DataField="DEPT_NAME" HeaderText="Department Name" HeaderStyle-CssClass="fw-bold" ItemStyle-CssClass="bg-info" />
                                        <%-- <asp:BoundField ItemStyle-Width="400px" DataField="TOTALAPPLICATIONSRCVD" HeaderText="Total Received" HeaderStyle-CssClass="fw-bold" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="bg-info" />
                                        <asp:BoundField ItemStyle-Width="400px" DataField="PENDING" HeaderText="Pending" HeaderStyle-CssClass="fw-bold" ItemStyle-CssClass="bg-info" />
                                        <asp:BoundField ItemStyle-Width="400px" DataField="REDRESS" HeaderText="Redressed" HeaderStyle-CssClass="fw-bold" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="bg-info" />
                                        <asp:BoundField ItemStyle-Width="400px" DataField="REJECT" HeaderText="Rejected" HeaderStyle-CssClass="fw-bold" ItemStyle-CssClass="bg-info" />--%>
                                        <asp:TemplateField HeaderText="Total Received">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lblTotal" Text='<%#Eval("TOTALAPPLICATIONSRCVD") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pending">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lblPending" Text='<%#Eval("PENDING") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Redressed">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lblRedressed" Text='<%#Eval("REDRESS") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Rejected">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lblRejected" Text='<%#Eval("REJECT") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Average time taken to respond to Queriess (In Days)">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblavgtime" Text='<%#Eval("AVG_TIME_TO_RESPOND") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Median time taken to respond to Queriess (In Days)">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblmedtime" Text='<%#Eval("MED_TIME_TO_RESPOND") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Minimum time taken to respond to Queriess (In Days)">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblmintime" Text='<%#Eval("MIN_TIME_TO_RESPOND") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Maximum time taken to respond to Queriess (In Days)">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblmaxtime" Text='<%#Eval("MAX_TIME_TO_RESPOND") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <%-- <asp:TemplateField HeaderText="Average time taken to respond to Queriess (In Days)">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lblAverage" Text='<%#Eval("AVG_TIME_TO_RESPOND") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>--%>
                                        <%--<asp:BoundField HeaderText="Average time taken to respond to Queriess (In Days)" DataField="AVG_TIME_TO_RESPOND" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Median time taken to respond to Queriess (In Days)" DataField="MED_TIME_TO_RESPOND" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Minimum time taken to respond to Queriess (In Days)" DataField="MIN_TIME_TO_RESPOND" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Maximum time taken to respond to Queriess (In Days)" DataField="MAX_TIME_TO_RESPOND" ItemStyle-HorizontalAlign="Center" />--%>
                                        <asp:TemplateField HeaderText="Time Limit prescribed as per the Public Service Guarantee Act  (In Days)">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbltxtguranteetime" Text="15" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
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
                <asp:UpdateProgress ID="UpdateProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <div class="update">
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
        </asp:UpdatePanel>
    </section>

</asp:Content>
