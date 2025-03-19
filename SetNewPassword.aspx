﻿<%@ Page Title="" Language="C#" MasterPageFile="~/OuterNew.Master" AutoEventWireup="true" CodeBehind="SetNewPassword.aspx.cs" Inherits="MeghalayaUIP.SetNewPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../assets/admin/js/form-validation.js" type="text/javascript"></script>
    
    <link rel="stylesheet" href="assets/admin/css/style.css">
    <style>
        table#ContentPlaceHolder1_rblproposal label, table#ContentPlaceHolder1_rblInvestments label {
            font-weight: 100;
        }

        table#ContentPlaceHolder1_rblproposal tr td, table#ContentPlaceHolder1_rblInvestments tr td {
            padding: 0px 10px;
        }

        label.col-lg-6.col-form-label {
            font-weight: 400;
        }

        section.innerpages {
            margin-top: 50px;
            margin-bottom: 10px;
        }

        .card-body {
            background: #fff;
        }

        .widget.link-widget ul {
            width: 100% !important;
        }

        section.innerpages {
            margin-top: 20px;
            margin-bottom: 10px;
        }
    </style>
    <section class="innerpages IntentInvest">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="">
                        <div class="content container-fluid">
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
                            <div class="row" id="divnewpswd" runat="server">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">Create New Password</h4>
                                             <asp:HiddenField runat="server" ID="asp_hidden" />
                                        </div>
                                        <div class="card-body">

                                            <asp:HiddenField ID="hdnUserID" runat="server" />
                                            <div class="row">

                                                <div class="col-md-12 d-flex">
                                                    <label class="col-lg-12 col-form-label fw-bold"><span style="font-weight: 900;">Please Fill all the Details</span></label>

                                                </div>
                                                <div class="col-md-12 d-flex">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-lg-6 col-form-label">User Email Id  *</label>
                                                            <div class="col-lg-6 d-flex">
                                                                <asp:Label ID="lblusername" runat="server" class="form-control" onblur="validateEmail(event)" TabIndex="1"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 d-flex">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-lg-6 col-form-label">Secret Key shared to above Email Id*</label>
                                                            <div class="col-lg-6 d-flex">
                                                                <asp:TextBox ID="txtSecretKey" runat="server" class="form-control" ></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 d-flex">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-lg-6 col-form-label">New Password*</label>
                                                            <div class="col-lg-6 d-flex"><%--onblur="return fnEncryption();"--%>
                                                                <asp:TextBox ID="txtnewpassword" runat="server" class="form-control" TextMode="Password"    ></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 d-flex">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-lg-6 col-form-label">Confirm New Password*</label>
                                                            <div class="col-lg-6 d-flex"><%--onblur="return fnEncryption1();"--%>
                                                                <asp:TextBox ID="txtconfirmpassword" runat="server" TextMode="Password"  class="form-control"  ></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 d-flex">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-lg-6 col-form-label">Please Enter Captcha*</label>
                                                            <div class="col-lg-6 d-flex">
                                                                <asp:TextBox runat="server" ID="txtcaptcha" class="form-control" placeholder="Captcha"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2" style="display: flex; align-items: center; margin-left: -20px;">
                                                        <div class="form-group" style="margin-bottom: 20px;">
                                                            <asp:Image ID="imgCaptcha" runat="server" draggable="false" Height="38px" Width="400px" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-1" style="display: flex; align-items: center; margin-left: -20px;">
                                                        <div class="form-group" style="margin-left: 10px;">
                                                            <asp:ImageButton ID="btnRefresh" runat="server" AlternateText="Refresh" OnClick="btnRefresh_Click" ImageUrl="~/assets/assetsnew/images/Refresh.jpg" Height="35px" Width="40px" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 d-flex mt-4" style="margin-top: 17px !important; margin-bottom: 7px;">

                                                    <div class="col-md-12 text-center">
                                                        <asp:Button ID="BtnUpdate" runat="server" Text="Update" class="btn btn-info btn-submit" padding-right="10px" Width="120px" OnClick="BtnUpdate_Click" />
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script type="text/javascript">

        function fnEncryption() {
            var x = (Math.random() * 1973);
            $("input[id*='asp_hidden']").val(x);
            asp_hiddenVal = $("input[id*='asp_hidden']").val();
            var key = asp_hiddenVal;
            var otp = document.getElementById("<%=txtnewpassword.ClientID %>");
            var o = otp.value;
            //var otpencrpt = window.btoa(o);
            var otpencrpt = xorEncrypt(o, key);
            otp.value = otpencrpt;
        }
        function xorEncrypt(text, key) {
            var result = "";
            for (var i = 0; i < text.length; i++) {
                var charCode = text.charCodeAt(i) ^ key.charCodeAt(i % key.length);
                result += String.fromCharCode(charCode);
            }
            return result;
        }
        function fnEncryption1() {
            //var x = (Math.random() * 1973);
            //$("input[id*='asp_hidden']").val(x);
            asp_hiddenVal = $("input[id*='asp_hidden']").val();
            var key = asp_hiddenVal;
            var otp = document.getElementById("<%=txtconfirmpassword.ClientID %>");
            var o = otp.value;
            //var otpencrpt = window.btoa(o);
            var otpencrpt = xorEncrypt(o, key);
            otp.value = otpencrpt;
        }
        function xorEncrypt(text, key) {
            var result = "";
            for (var i = 0; i < text.length; i++) {
                var charCode = text.charCodeAt(i) ^ key.charCodeAt(i % key.length);
                result += String.fromCharCode(charCode);
            }
            return result;
        }
    </script>
</asp:Content>
