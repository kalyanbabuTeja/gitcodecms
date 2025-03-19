﻿<%@ Page Title="" Language="C#" MasterPageFile="~/OuterNew.Master" AutoEventWireup="true" CodeBehind="Deap.aspx.cs" Inherits="MeghalayaUIP.Deap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        table#servicestable th {
            vertical-align: middle;
        }

        select#ContentPlaceHolder1_ddlPolCategory {
            display: block;
            width: 100%;
            padding: 0.475rem 0.75rem;
            font-size: 1rem;
            line-height: 1.7;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        tr th, td {
            padding: 6px 15px !important;
            text-align: left;
        }

        b, strong {
            font-weight: bolder;
            color: #38373e;
        }

        a.btn.btn-primary.btn-sm {
            width: 100%;
            box-shadow: 1px 2px 4px #b5aaaa;
        }

        .table-responsive {
            display: flex;
            justify-content: space-around;
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <section class="innerpages">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                    <li class="breadcrumb-item">Services</li>
                                    <li class="breadcrumb-item active" aria-current="page">District Export Action Plan</li>
                                </ol>
                            </nav>
                            <h3 class="">District Export Action Plan</h3>

                            <div class="">
                                <div class="">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-striped" style="width: 60%">
                                            <thead style="background-color: #003399; color: white;">
                                                <tr>
                                                    <th style="width: 7%">Sl.No</th>
                                                    <th style="width: 40%">District Name</th>
                                                    <th style="width: 13%">Important Links</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td><strong>EAST GARO HILLS</strong></td>
                                                    <td><a href="Documents/Notifications/.pdf" target="_blank" class="btn btn-primary btn-sm">View</a></td>


                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td><strong>WEST GARO HILLS</strong></td>
                                                    <td><a href="Documents/Notifications/.pdf" target="_blank" class="btn btn-primary btn-sm">View</a></td>


                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td><strong>NORTH GARO HILLS</strong></td>
                                                    <td><a href="Documents/Notifications/.pdf" target="_blank" class="btn btn-primary btn-sm">View</a></td>


                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td><strong>SOUTH GARO HILLS</strong></td>
                                                    <td><a href="Documents/Notifications/.pdf" target="_blank" class="btn btn-primary btn-sm">View</a></td>


                                                </tr>
                                                <tr>
                                                    <td>5</td>
                                                    <td><strong>SOUTH WEST GARO HILLS</strong></td>
                                                    <td><a href="Documents/Notifications/.pdf" target="_blank" class="btn btn-primary btn-sm">View</a></td>


                                                </tr>
                                                <tr>
                                                    <td>6</td>
                                                    <td><strong>EAST JAINTIA HILLS</strong></td>
                                                    <td><a href="Documents/Notifications/.pdf" target="_blank" class="btn btn-primary btn-sm">View</a></td>


                                                </tr>
                                                <tr>
                                                    <td>7</td>
                                                    <td><strong>WEST JAINTIA HILLS</strong></td>
                                                    <td><a href="Documents/Notifications/.pdf" target="_blank" class="btn btn-primary btn-sm">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td>8</td>
                                                    <td><strong>EAST KHASI HILLS</strong></td>
                                                    <td><a href="Documents/Notifications/.pdf" target="_blank" class="btn btn-primary btn-sm">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td>9</td>
                                                    <td><strong>WEST KHASI HILLS</strong></td>
                                                    <td><a href="Documents/Notifications/.pdf" target="_blank" class="btn btn-primary btn-sm">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td>10</td>
                                                    <td><strong>SOUTH WEST KHASI HILLS</strong></td>
                                                    <td><a href="Documents/Notifications/.pdf" target="_blank" class="btn btn-primary btn-sm">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td>11</td>
                                                    <td><strong>EASTERN WEST KHASI HILLS</strong></td>
                                                    <td><a href="Documents/Notifications/.pdf" target="_blank" class="btn btn-primary btn-sm">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td>12</td>
                                                    <td><strong>RI BHOI</strong></td>
                                                    <td><a href="Documents/Notifications/.pdf" target="_blank" class="btn btn-primary btn-sm">View</a></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
