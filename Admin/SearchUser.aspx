﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Dept/dept.Master" AutoEventWireup="true" CodeBehind="SearchUser.aspx.cs" Inherits="MeghalayaUIP.Admin.SearchUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Dashboard/DeptDashBoard.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page">DEPARTMENT AMENDMENTS</li>
        </ol>
    </nav>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="card-header d-flex justify-content-between">
                        <h4 class="card-title mt-1"><b>User Search</b></h4>
                        <div class="col-md-1">
                            <asp:LinkButton ID="lbtnBack" runat="server" Text="Back" OnClick="lbtnBack_Click" CssClass="btn btn-sm btn-dark"><i class="fi fi-br-angle-double-small-left" style="position: absolute;margin-left: 32px;margin-top: 3px;"></i> Back&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:LinkButton>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <div class="col-md-12 ">
                                <div id="success" runat="server" visible="false" class="alert alert-success alert-dismissible fade show" align="Center">
                                    <strong>Success!</strong><asp:Label ID="lblmsg" runat="server"></asp:Label>
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

                            <div align="center">
                                <div class="row" align="center">
                                    <div class="col-lg-12">
                                        <div class="panel panel-primary">
                                            <div class="panel-body">
                                                <table style="vertical-align: top; text-align: center;" cellpadding="5" cellspacing="10"
                                                    width="50%">

                                                    <tr>
                                                        <td style="padding: 5px; margin: 5px; text-align: center;">Input</td>
                                                        <td style="padding: 5px; margin: 5px; text-align: center;">
                                                            <asp:DropDownList ID="ddlInput" runat="server" aria-label="Default select example" class="form-control" Style="width: 180PX; height: 32px;">
                                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                <asp:ListItem Value="EmailID">Email ID</asp:ListItem>
                                                                <asp:ListItem Value="InvesterID">Invester ID</asp:ListItem>
                                                                <asp:ListItem Value="UIDNO">UID NO</asp:ListItem>
                                                                <asp:ListItem Value="UnitName">Unit Name</asp:ListItem>
                                                                <asp:ListItem Value="DeptUserName">Dept UserName</asp:ListItem>
                                                                <asp:ListItem Value="DeptUserID">Dept UserID</asp:ListItem>

                                                            </asp:DropDownList>
                                                        </td>

                                                        <td style="padding: 5px; margin: 5px; text-align: center;">Enter Input</td>                                                           
                                                        <td style="padding: 5px; margin: 5px; text-align: center;">
                                                            <asp:TextBox ID="txtInput" runat="server" class="form-control txtbox" Height="28px" Width="180px" MaxLength="40" TabIndex="1" ValidationGroup="group"></asp:TextBox>

                                                        </td>
                                                    </tr>


                                                    <tr>
                                                        <td colspan="3" align="right" style="height: 25px"></td>


                                                    </tr>
                                                    <tr>
                                                        <td colspan="3" align="center" style="text-align: center;">


                                                            <asp:Button ID="BtnSave3" runat="server" CssClass="btn btn-xs btn-success"
                                                                Height="40px" TabIndex="10" Text="Search" OnClick="BtnSave3_Click"
                                                                Width="116px" />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                            <asp:Button ID="BTNcLEAR" runat="server" CssClass="btn btn-xs btn-warning"
                                                                                Height="40px" Text="Clear" OnClick="BTNcLEAR_Click"
                                                                                Width="116px" />
                                                        </td>

                                                    </tr>
                                                    <tr id="trusercomments" runat="server" visible="false" align="center">
                                                        <td colspan="5">
                                                            <asp:GridView Width="100%" ID="GVSearch" runat="server" AutoGenerateColumns="false" border="3" CellPadding="4" CellSpacing="1">
                                                                <HeaderStyle BackColor="#013161" CssClass="GRDHEADER" Font-Bold="True" ForeColor="White" />
                                                                <FooterStyle BackColor="#013161" Font-Bold="True" ForeColor="White" />
                                                                <RowStyle Height="50px" BackColor="#EBF2FE" CssClass="GRDITEM" HorizontalAlign="Left" VerticalAlign="Middle" />
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Sl No.">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSl" runat="server" Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="INVESTERID" HeaderText="Invester Id">
                                                                        <ItemStyle Width="350px" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="EMAILID" HeaderText="Email Id">
                                                                        <ItemStyle Width="350px" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="PASSWORD" HeaderText="Password">
                                                                        <ItemStyle Width="350px" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="PREREGUIDNOS" HeaderText="IR UIDNO">
                                                                        <ItemStyle Width="350px" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="LANDUIDNOS" HeaderText="LAND UIDNO">
                                                                        <ItemStyle Width="350px" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="CFEUIDNOS" HeaderText="CFE UIDNO">
                                                                        <ItemStyle Width="350px" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="CFOUIDNOS" HeaderText="CFO UIDNO">
                                                                        <ItemStyle Width="350px" />
                                                                    </asp:BoundField>
                                                                     <asp:BoundField DataField="RENUIDNOS" HeaderText="RENEWAL UIDNO">
                                                                        <ItemStyle Width="350px" />
                                                                    </asp:BoundField>
                                                                     <asp:BoundField DataField="INCENTIVEIDS" HeaderText="INCENTIVE ID">
                                                                        <ItemStyle Width="350px" />
                                                                    </asp:BoundField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>

                                                    <tr colspan="4" runat="server" id="Close">
                                                        <td align="center" style="padding: 5px; vertical-align: middle; text-align: center"
                                                            valign="middle">
                                                            <asp:Label ID="lblStatus" runat="server" Font-Bold="True" ForeColor="Red" Width="272px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3" align="center" style="padding: 5px; vertical-align: middle; height: 35px; text-align: left"
                                                            valign="middle">&nbsp; &nbsp;
                                                        </td>
                                                    </tr>

                                                </table>
                                                <br />
                                                <asp:ValidationSummary ID="vg" runat="server" ForeColor="Green" ShowMessageBox="True"
                                                    ShowSummary="False" Style="position: static" ValidationGroup="group" />

                                                <asp:HiddenField ID="hdnDeptid" runat="server" />
                                                <asp:HiddenField ID="hdfID" runat="server" />
                                                <br />
                                                <asp:HiddenField ID="hdfFlagID" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
        <Triggers>
            <asp:PostBackTrigger ControlID="BtnSave3" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
