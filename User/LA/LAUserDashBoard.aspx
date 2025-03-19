﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="LAUserDashBoard.aspx.cs" Inherits="MeghalayaUIP.User.LA.LAUserDashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="card">
                <div class="card-body">
                    <div class="col-md-12 d-flex">
                        <div id="success" runat="server" visible="false" class="alert alert-success" align="Center">
                            <strong>Success!</strong><asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="col-md-12 d-flex">
                        <div id="Failure" runat="server" visible="false" class="alert alert-danger" align="Center">
                            <strong>Warning!</strong>
                            <asp:Label ID="lblmsg0" runat="server"></asp:Label>
                        </div>
                    </div>
                    <asp:HiddenField ID="hdnUserID" runat="server" />
                    <div class="col-md-12 d-flex">
                        <div class="col-md-11">
                            <h4 style="margin-left: -10px;">Land Allotment with Meghalaya Investment Promotion Authority (MIPA)/MIIPP</h4>
                        </div>
                        <div class="col-md-1">
                            <asp:LinkButton ID="lbtnBack" runat="server" Text="Back" OnClick="lbtnBack_Click" CssClass="btn btn-sm btn-dark"><i class="fi fi-br-angle-double-small-left" style="position: absolute;margin-left: 32px;margin-top: 3px;"></i> Back&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:LinkButton>
                        </div>
                    </div>

                    <div class="table-responsive CFEUSERDASHBOARD">

                        <asp:GridView ID="gvPreRegApproved" runat="server" AutoGenerateColumns="False" BorderColor="#003399" ShowHeaderWhenEmpty="true"
                            BorderStyle="Solid" BorderWidth="1px" CssClass="table-bordered table-hover" ForeColor="#333333"
                            GridLines="None" Width="100%" EnableModelValidation="True" ShowFooter="true" OnRowDataBound="gvPreRegApproved_RowDataBound" OnRowCreated="gvPreRegApproved_RowCreated">
                            <RowStyle />
                            <HeaderStyle BackColor="#013161" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                            <FooterStyle BackColor="#013161" CssClass="no-hover" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                            <AlternatingRowStyle />
                            <Columns>
                                <asp:TemplateField HeaderText="Sl.No" ItemStyle-Width="3%">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />--%>
                                <asp:BoundField HeaderText="Application ID" DataField="PREREGUIDNO" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" Visible="true" />
                                <asp:BoundField HeaderText="Unit Name" DataField="COMPANYNAME" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                <asp:BoundField HeaderText="PAN No" DataField="COMPANYPANNO" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                <asp:BoundField HeaderText="Application Filed Date" DataField="CREATEDDATE" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                <%--7--%>                                
                                <asp:TemplateField HeaderText="Query Raised">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="hplQueryRaised" Text='<%#Eval("QUERYCOUNT")%>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apply For Land Allotment">
                                    <ItemTemplate>
                                        <asp:Button runat="server" ID="btnApplyLand" Text="Apply" OnClick="btnApplyLand_Click" CssClass="btn btn-info btn-rounded btn-sm" Width="100px" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="View Application Details" Visible="true">
                                    <ItemTemplate>
                                        <asp:Button runat="server" ID="btnCombndAppl" Text="View" OnClick="btnCombndAppl_Click" CssClass="btn btn-info btn-rounded" Width="100px" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="View Application Status ">
                                    <ItemTemplate>
                                        <asp:Button runat="server" ID="btnApplStatus" Text="Status" CssClass="btn btn-info btn-rounded" Width="100px" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="UNITID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblUNITID" Text='<%#Eval("UNITID") %>'> </asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="LAQID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblLAQID" Text='<%#Eval("LAQDID") %>'> </asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="LAQSTATUS" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblAPPLSTATUS" Text='<%#Eval("STATUS") %>'> </asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div style="text-align: center; padding: 20px;">
                                    <div align="center" style="text-align: center; padding: 20px;">
                                    <b>There are no Registered/Approved Units Under MIIPP, Please  <a href="../PreReg/IndustryRegistration.aspx" style="font-size:20px; font-family:'Bookman Old Style'" >Click Here </a> to start Industry Registration.</b> 
                                </div>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>

                    </div>


                </div>
            </div>



        </div>
    </div>
</asp:Content>
